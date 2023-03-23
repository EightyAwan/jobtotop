<?php

$user = ORM::for_table($config['db']['pre'].'user')->find_one($_SESSION['user']['id']);
 
if( $user['subscription_id'] == 0 ){
    headerRedirect('membership');
} 

// if job seekers is disable
if(!$config['job_seeker_enable']){
    error($lang['PAGE_NOT_FOUND'], __LINE__, __FILE__, 1);
}

if(!isset($_GET['page']))
    $page_number = 1;
else{
    $page_number = $_GET['page'];
}

$limit = 10;
$keywords = isset($_GET['keywords']) ? str_replace("-"," ",$_GET['keywords']) : "";

$category = $subcat = $gender = $range1 = $range2 = $age_range1 = $age_range2 = "";

if(isset($_GET['subcat']) && !empty($_GET['subcat'])){

    if(is_numeric($_GET['subcat'])){
        if(check_sub_category_exists($_GET['subcat'])){
            $subcat = $_GET['subcat'];
        }
    }else{
        $subcat = get_subcategory_id_by_slug($_GET['subcat']);
    }
}elseif(isset($_GET['cat']) && !empty($_GET['cat'])){
    if(is_numeric($_GET['cat'])){
        if(check_category_exists($_GET['cat'])){
            $category = $_GET['cat'];
        }
    }else{
        $category = get_category_id_by_slug($_GET['cat']);
    }
}


if(isset($_GET['city']) && !empty($_GET['city'])){
    $city = $_GET['city'];
}else{
    $city = "";
}

$total = 0;

$where = '';
$order_by = 'u.id DESC';
if(isset($_GET['keywords']) && !empty($_GET['keywords'])){
    $where.= "AND (u.name LIKE '%$keywords%' or u.tagline LIKE '%$keywords%' or u.description LIKE '%$keywords%') ";
    $order_by = "(CASE
    WHEN u.name = '$keywords' THEN 1
    WHEN u.name LIKE '$keywords%' THEN 2
    WHEN u.name LIKE '%$keywords%' THEN 3
    WHEN u.tagline = '$keywords' THEN 4
    WHEN u.tagline LIKE '$keywords%' THEN 5
    WHEN u.tagline LIKE '%$keywords%' THEN 6
    WHEN u.description LIKE '$keywords%' THEN 7
    WHEN u.description LIKE '%$keywords%' THEN 8
    ELSE 9
  END)";
}

if(isset($category) && !empty($category)){
    $where.= "AND (u.category = '$category') ";
}

if(isset($_GET['subcat']) && !empty($_GET['subcat'])){
    $where.= "AND (u.subcategory = '$subcat') ";
}


if (!empty($_GET['range1'])) {
    $range1 = str_replace('.', '', $_GET['range1']);
    $range2 = str_replace('.', '', $_GET['range2']);
    $where.= ' AND (u.salary_min BETWEEN '.$range1.' AND '.$range2.') OR (u.salary_max BETWEEN '.$range1.' AND '.$range2.')';
}

if (!empty($_GET['age_range1'])) {
    $age_range1 = $_GET['age_range1'];
    $age_range2 = $_GET['age_range2'];
    $where.= ' AND (DATEDIFF(CURRENT_DATE, u.dob) BETWEEN ('.$age_range1.' * 365.25) AND ('.$age_range2.' * 365.25))';
}

if(isset($_GET['city']) && !empty($_GET['city']))
{
    $where.= "AND (u.city_code = '".$_GET['city']."') ";
}
elseif(isset($_GET['location']) && !empty($_GET['location']))
{
    $placetype = $_GET['placetype'];
    $placeid = $_GET['placeid'];

    if($placetype == "country"){
        $where.= "AND (u.country_code = '$placeid') ";
    }elseif($placetype == "state"){
        $where.= "AND (u.state_code = '$placeid') ";
    }else{
        $where.= "AND (u.city_code = '$placeid') ";
    }
}
else{
    $country_code = check_user_country();
    $where.= "AND (u.country_code = '$country_code' OR u.country_code IS NULL) ";
    $order_by = "(CASE
    WHEN u.country_code = '$country_code' THEN 1
    WHEN u.country_code IS NULL THEN 2
    ELSE 3
  END),".$order_by;
}

if(!empty($_GET['gender'])){
    $gender = $_GET['gender'];
    $where.= "AND (u.sex = '$gender') ";
}

// bypassing the payment functionality 
$subscriptionID = ORM::for_table($config['db']['pre'].'user')->find_one($_SESSION['user']['id']); 
$subscription = ORM::for_table($config['db']['pre'].'subscriptions')->where('sub_id', $subscriptionID->subscription_id)->find_one();
$getLimit = explode(' ',$subscription->feature); 
$limit = $getLimit[0];

$total = mysqli_num_rows(mysqli_query($mysqli, "SELECT 1 FROM `".$config['db']['pre']."user` u where u.status = '1' AND u.user_type = 'user' $where  LIMIT $limit"));

$query = "SELECT u.* FROM `".$config['db']['pre']."user` u
     where u.status = '1' AND u.user_type = 'user' $where ORDER BY $order_by LIMIT ".($page_number-1)*$limit.",$limit";

$count = 0;
$noresult_id = "";
//Loop for list view
$item = array();
$result = $mysqli->query($query);
if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($info = mysqli_fetch_assoc($result)) {
        
        
        $orm = ORM::for_table($config['db']['pre'].'resumes')
        ->where('user_id' , $info['id'])
        ->where('active' , '1');
        
        $result1 = $orm->find_many();
            //$items = array();
            if ($result1) {
                foreach ($result1 as $info1)
                {
                //	$items[$info['id']]['id'] = $info['id'];
                	$item[$info['id']]['CVname'] = $info1['name'];
                	$item[$info['id']]['CVfilename'] = $info1['filename'];
                }
            }
        $item[$info['id']]['id'] = $info['id'];
        $item[$info['id']]['username'] = $info['username'];
        $item[$info['id']]['name'] = !empty($info['name'])?$info['name']:$info['username'];
        $item[$info['id']]['description'] = !empty($info['tagline'])?$info['tagline']:strlimiter(strip_tags($info['description']),200);
        $item[$info['id']]['sex'] = $info['sex'];
        $item[$info['id']]['image'] = !empty($info['image'])?$info['image']:'default_user.png';

        $item[$info['id']]['category'] = $item[$info['id']]['subcategory'] = null;
        if(!empty($info['category'])){
            $get_cat = get_maincat_by_id($info['category']);
            $item[$info['id']]['category'] = $get_cat['cat_name'];
        }
        if(!empty($info['subcategory'])){
            $get_cat = get_subcat_by_id($info['subcategory']);
            $item[$info['id']]['subcategory'] = $get_cat['sub_cat_name'];
        }

        $country_code = $info['country_code'];
        $item[$info['id']]['salary_min'] = price_format($info['salary_min'], $country_code);
        $item[$info['id']]['salary_max'] = price_format($info['salary_max'], $country_code);

        $item[$info['id']]['city'] = $info['city'];
        if(!empty($info['city_code'])) {
            $city_detail = get_cityDetail_by_id($info['city_code']);
            $item[$info['id']]['city'] = $city_detail['asciiname'];
            $item[$info['id']]['city'] .= ', '.get_stateName_by_id($city_detail['subadmin1_code']);
        }

        $item[$info['id']]['favorite'] = check_user_favorite($info['id']);
    }
}

$selected = "";
if(isset($_GET['cat']) && !empty($_GET['cat'])){
    $selected = $_GET['cat'];
}
// Check Settings For quotes
$GetCategory = get_maincategory($selected);
$cat_dropdown = get_categories_dropdown($lang);

$maincatname = get_maincat_by_id($category);
$maincatname = $maincatname['cat_name'];
$mainCategory = isset($category) ? $maincatname : "";
$subcatname = get_subcat_by_id($subcat);
$subcatname = $subcatname['sub_cat_name'];
$subCategory = isset($subcat) ? $subcatname : "";

if(isset($category) && !empty($category)){
    $Pagetitle = $mainCategory;
}
elseif(isset($subcat) && !empty($subcat)){
    $Pagetitle = $subCategory;
}
elseif(!empty($keywords)){
    $Pagetitle = ucfirst($keywords);
}
else{
    $Pagetitle = $lang['JOB_SEEKERS'];
}

if(!empty($_GET['location'])){
    $locTitle        =   explode(',' ,$_GET['location']);
    $locTitle     =   $locTitle[0];
    $Pagetitle .= " ".$lang['IN']." ".$locTitle;
}
else{
    $sortname = check_user_country();
    $countryName = get_countryName_by_sortname($sortname);
    $Pagetitle .= " ".$lang['IN']." ".$countryName;
}

if(isset($_GET['city']) && !empty($_GET['city']))
{
    $cityName = get_cityName_by_id($_GET['city']);
    $Pagetitle = $lang['JOB_SEEKERS']." ".$lang['IN']." ".$cityName;
}

$country_code = check_user_country();
$countryName = get_countryName_by_sortname($country_code);

$popular = array();
$count = 1;

$result = ORM::for_table($config['db']['pre'].'cities')
    ->select_many('id','asciiname')
    ->where(array(
        'country_code' => $country_code,
        'active' => '1'
    ))
    ->order_by_desc('population')
    ->limit(18)
    ->find_many();
foreach ($result as $info) {
    $id = $info['id'];
    $name = $info['asciiname'];
    $popular[$count]['tpl'] =  '<li><a href="#" class="selectme" data-id="'.$id.'" data-name="'.$name.'" data-type="city"><span>'.$name.'</span></a></li>';
    $count++;
}

$states = array();
$count = 1;

$result = ORM::for_table($config['db']['pre'].'subadmin1')
    ->select_many('id','code','asciiname')
    ->where(array(
        'country_code' => $country_code,
        'active' => '1'
    ))
    ->order_by_asc('asciiname')
    ->find_many();

foreach ($result as $info) {
    $states[$count]['tpl'] = "";
    $id = $info['id'];
    $code = $info['code'];
    $name = $info['asciiname'];
    if($count == 1){
        $states[$count]['tpl'] =  '<li class="selected"><a href="#" class="selectme" data-id="'.$country_code.'" data-name="'.$lang['ALL'].' '.$countryName.'" data-type="country"><strong>'.$lang['ALL'].' '.$countryName.'</strong></a></li>';
    }
    $states[$count]['tpl'] .= '<li class=""><a href="#" id="region'.$code.'" class="statedata" data-id="'.$code.'" data-name="'.$name.'"><span>'.$name.' <i class="fa fa-angle-right"></i></span></a></li>';
    $count++;
}


$cat_dropdown = get_categories_dropdown($lang);
// Output to template
$page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/job-seekers.tpl');
$page->SetParameter ('OVERALL_HEADER', create_header($Pagetitle));
$page->SetParameter ('USERSFOUND', $total);
$page->SetParameter ('CAT_DROPDOWN',$cat_dropdown);
$page->SetParameter('USER_COUNTRY', strtolower($country_code));
$page->SetParameter('DEFAULT_COUNTRY',$countryName);
$page->SetParameter('DEFAULT_COUNTRY_ID', $country_code);
    $page->SetParameter('USER_COUNTRY_LOCAL', strtoupper($country_code));
$page->SetLoop ('POPULARCITY',$popular);
$page->SetLoop ('STATELIST',$states);
$page->SetLoop ('ITEM', $item);
$page->SetLoop ('CATEGORY',$GetCategory);
$page->SetParameter ('MAINCAT', $category);
$page->SetParameter ('SUBCAT', $subcat);
$page->SetParameter ('MAINCATEGORY', $mainCategory);
$page->SetParameter ('SUBCATEGORY', $subCategory);
$page->SetParameter ('KEYWORDS', $keywords);
$page->SetParameter ('GENDER', $gender);
$page->SetParameter ('RANGE1', $range1);
$page->SetParameter ('RANGE2', $range2);
$page->SetParameter ('AGE_RANGE1', $age_range1);
$page->SetParameter ('AGE_RANGE2', $age_range2);
$Pagelink = "";
if(count($_GET) >= 1){
    $get = http_build_query($_GET);
    $Pagelink .= "?".$get;

    $page->SetLoop ('PAGES', pagenav($total,$page_number,$limit,$link['JOB_SEEKERS'].$Pagelink,1));
}else{
    $page->SetLoop ('PAGES', pagenav($total,$page_number,$limit,$link['JOB_SEEKERS']));
}
$page->SetParameter ('OVERALL_FOOTER', create_footer());
$page->CreatePageEcho();