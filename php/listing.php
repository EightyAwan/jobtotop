<?php

if(!isset($_GET['page']))
    $page_number = 1;
else{
    $page_number = $_GET['page'];
}

if(!isset($_GET['order']))
    $order = "DESC";
else{
    if($_GET['order'] == ""){
        $order = "DESC";
    }else{
        $order = $_GET['order'];
    }
}

if(!isset($_GET['sort']))
    $sort = "p.id";
elseif($_GET['sort'] == "title")
    $sort = "product_name";
elseif($_GET['sort'] == "price")
    $sort = "price";
elseif($_GET['sort'] == "date")
    $sort = "created_at";
else
    $sort = "id";

$limit = isset($_GET['limit']) ? $_GET['limit'] : 9;
$filter = isset($_GET['filter']) ? $_GET['filter'] : "";
$sorting = isset($_GET['sort']) ? $_GET['sort'] : "Newest";
$budget = isset($_GET['budget']) ? $_GET['budget'] : "";
$keywords = isset($_GET['keywords']) ? str_replace("-"," ",$_GET['keywords']) : "";

$category = "";
$subcat = "";

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

if($subcat != ''){
    $custom_fields = get_customFields_by_catid('',$subcat,false);
}else if($category != ''){
    $custom_fields = get_customFields_by_catid($category,'',false);
}else{
    $custom_fields = get_customFields_by_catid('','',false);
}

$custom = array();
if(isset($_GET['custom']) && !empty($_GET['custom'])){
    $custom = $_GET['custom'];
}

if(isset($_GET['city']) && !empty($_GET['city'])){
    $city = $_GET['city'];
}else{
    $city = "";
}

$total = 0;

$where = '';
$order_by_keyword = '';
if(isset($_GET['keywords']) && !empty($_GET['keywords'])){
    $where.= "AND (p.product_name LIKE '%$keywords%' or p.tag LIKE '%$keywords%') ";
    $order_by_keyword = "(CASE
    WHEN p.product_name = '$keywords' THEN 1
    WHEN p.product_name LIKE '$keywords%' THEN 2
    WHEN p.product_name LIKE '%$keywords%' THEN 3
    WHEN p.tag = '$keywords' THEN 4
    WHEN p.tag LIKE '$keywords%' THEN 5
    WHEN p.tag LIKE '%$keywords%' THEN 6
    ELSE 7
  END),";
}

if(isset($category) && !empty($category)){
    $where.= "AND (p.category = '$category') ";
}

if(isset($_GET['subcat']) && !empty($_GET['subcat'])){
    $where.= "AND (p.sub_category = '$subcat') ";
}


if (isset($_GET['range1']) && $_GET['range1'] != '') {
    $range1 = str_replace('.', '', $_GET['range1']);
    $range2 = str_replace('.', '', $_GET['range2']);
    $where.= ' AND (p.salary_min BETWEEN '.$range1.' AND '.$range2.') OR (p.salary_max BETWEEN '.$range1.' AND '.$range2.')';
} else {
    $range1 = "";
    $range2 = "";
}

if(isset($_GET['city']) && !empty($_GET['city']))
{
    //$where.= "AND (ci.name LIKE '%".$_GET['city']."%') ";
    $where.= "AND (p.location LIKE '%".$_GET['city']."%') ";
}
elseif(isset($_GET['location']) && !empty($_GET['location']))
{
    $placetype = $_GET['placetype'];
    $placeid = $_GET['placeid'];

    if($placetype == "country"){
        $where.= "AND (p.country = '$placeid') ";
    }elseif($placetype == "state"){
        $where.= "AND (p.state = '$placeid') ";
    }else{
        //$where.= "AND (p.city = '$placeid') ";
    }
}
else{
    //$country_code = check_user_country();
    //$where.= "AND (p.country = '$country_code') ";
}
$country_code = check_user_country();
$where.= "AND (p.country = '$country_code') ";

if(isset($_GET['custom'])) {
    $whr_count = 1;
    $custom_where = "";
    $custom_join = "";
    foreach ($_GET['custom'] as $key => $value) {
        if (empty($value)) {
            unset($_GET['custom'][$key]);
        }
        if (!empty($_GET['custom'])) {
            // custom value is not empty.

            if ($key != "" && $value != "") {
                $c_as = "c".$whr_count;
                $custom_join .= " JOIN `".$config['db']['pre']."custom_data` AS $c_as ON $c_as.product_id = p.id AND `$c_as`.`field_id` = '$key' ";

                if (is_array($value)) {
                    $custom_where = " AND ( ";
                    $cond_count = 0;
                    foreach ($value as $val) {
                        if ($cond_count == 0) {
                            $custom_where .= " find_in_set('$val',$c_as.field_data) <> 0 ";
                        } else {
                            $custom_where .= " AND find_in_set('$val',$c_as.field_data) <> 0 ";
                        }
                        $cond_count++;
                    }
                    $custom_where .= " )";
                }else{
                    $custom_where .= " AND `$c_as`.`field_data` = '$value' ";
                }

                $whr_count++;
            }
        }
    }
    if($custom_where != "")
        $where .= $custom_where;

    if (!empty($_GET['custom'])) {
        $sql = "SELECT DISTINCT p.*
FROM `".$config['db']['pre']."product` AS p
$custom_join
 WHERE p.active=1 AND tatus = 'active' AND hide = '0' ";
    }else{
        $sql = "SELECT DISTINCT p.*
FROM `".$config['db']['pre']."product` AS p
 WHERE p.active=1 AND status = 'active' AND hide = '0' ";
    }
    $q = "$sql $where";
    $totalWithoutFilter = mysqli_num_rows(mysqli_query($mysqli, $q));
}
else{

    $totalWithoutFilter = mysqli_num_rows(mysqli_query($mysqli, "SELECT 1 FROM ".$config['db']['pre']."product as p where p.active=1 AND p.status = 'active' $where"));
}

if(isset($_GET['filter'])){
    if($_GET['filter'] == 'free')
    {
        $where.= "AND (p.urgent='0' AND p.featured='0' AND p.highlight='0') ";
    }
    elseif($_GET['filter'] == 'featured')
    {
        $where.= "AND (p.featured='1') ";
    }
    elseif($_GET['filter'] == 'urgent')
    {
        $where.= "AND (p.urgent='1') ";
    }
    elseif($_GET['filter'] == 'highlight')
    {
        $where.= "AND (p.highlight='1') ";
    }
}

$job_type = $salary_type = '';
if(isset($_GET['job-type'])){
    $job_type = $_GET['job-type'];
    $where.= "AND (p.product_type=$job_type) ";
}

if(isset($_GET['salary-type'])){
    $salary_type = $_GET['salary-type'];
    $where.= "AND (p.salary_type=$salary_type) ";
}


$order_by = "
      (CASE
        WHEN g.top_search_result = 'yes' and p.featured = '1' and p.urgent = '1' and p.highlight = '1' THEN 1
        WHEN g.top_search_result = 'yes' and p.urgent = '1' and p.featured = '1' THEN 2
        WHEN g.top_search_result = 'yes' and p.urgent = '1' and p.highlight = '1' THEN 3
        WHEN g.top_search_result = 'yes' and p.featured = '1' and p.highlight = '1' THEN 4
        WHEN g.top_search_result = 'yes' and p.urgent = '1' THEN 5
        WHEN g.top_search_result = 'yes' and p.featured = '1' THEN 6
        WHEN g.top_search_result = 'yes' and p.highlight = '1' THEN 7
        WHEN g.top_search_result = 'yes' THEN 8
        WHEN p.featured = '1' and p.urgent = '1' and p.highlight = '1' THEN 9
        WHEN p.urgent = '1' and p.featured = '1' THEN 10
        WHEN p.urgent = '1' and p.highlight = '1' THEN 11
        WHEN p.featured = '1' and p.highlight = '1' THEN 12
        WHEN p.urgent = '1' THEN 13
        WHEN p.featured = '1' THEN 14
        WHEN p.highlight = '1' THEN 15
        ELSE 16
      END),".$order_by_keyword." $sort $order";

if(isset($_GET['custom']))
{

    if (!empty($_GET['custom'])) {
        $sql = "SELECT DISTINCT p.*,  c.name company_name, c.logo company_image
FROM `".$config['db']['pre']."product` AS p
LEFT JOIN `".$config['db']['pre']."companies` c on p.company_id = c.id AND c.active=1
$custom_join
 WHERE p.active=1 AND p.status = 'active' AND p.hide = '0' ";
    }else{
        $sql = "SELECT DISTINCT p.*, c.name company_name, c.logo company_image
FROM `".$config['db']['pre']."product` AS p
LEFT JOIN `".$config['db']['pre']."companies` c on p.company_id = c.id AND c.active=1
 WHERE p.active=1 AND p.status = 'active' AND p.hide = '0' ";
    }

    $query =  $sql . " $where ORDER BY $sort $order LIMIT ".($page_number-1)*$limit.",$limit";

    $total = mysqli_num_rows(mysqli_query($mysqli, "$sql $where"));
    $featuredAds = mysqli_num_rows(mysqli_query($mysqli, "$sql and (p.featured='1') $where"));
    $urgentAds = mysqli_num_rows(mysqli_query($mysqli, "$sql and (p.urgent='1') $where"));

}
else{
    $total = mysqli_num_rows(mysqli_query($mysqli, "SELECT 1 FROM ".$config['db']['pre']."product as p LEFT JOIN `".$config['db']['pre']."cities` as ci ON  p.city = ci.id AND ci.active = 1 where p.status = 'active' AND p.hide = '0' $where"));
    $featuredAds = mysqli_num_rows(mysqli_query($mysqli, "SELECT 1 FROM ".$config['db']['pre']."product as p where p.active=1 AND p.active=1 AND status = 'active' AND hide = '0' and featured='1' $where"));
    $urgentAds = mysqli_num_rows(mysqli_query($mysqli, "SELECT 1 FROM ".$config['db']['pre']."product as p where p.active=1 AND status = 'active' AND hide = '0' and urgent='1' $where"));


    $query = "SELECT p.*,u.group_id,g.top_search_result, c.name company_name, c.logo company_image,ci.id as cid FROM `".$config['db']['pre']."product` as p
    LEFT JOIN `".$config['db']['pre']."companies` c on p.company_id = c.id  AND c.active =1
    LEFT JOIN `".$config['db']['pre']."user` as u ON u.id = p.user_id AND u.active=1
    LEFT JOIN `".$config['db']['pre']."usergroups` as g ON g.group_id = u.group_id AND g.active
    LEFT JOIN `".$config['db']['pre']."cities` as ci ON  p.city = ci.id AND ci.active 
     where p.active=1 AND p.status = 'active' AND p.hide = '0' $where ORDER BY $order_by LIMIT ".($page_number-1)*$limit.",$limit";

}

$count = 0;
$noresult_id = "";
//Loop for list view
$item = array();
//echo $query;
$result = $mysqli->query($query);
mysqli_num_rows($result);
if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($info = mysqli_fetch_assoc($result)) {
        $item[$info['id']]['id'] = $info['id'];
        $item[$info['id']]['featured'] = $info['featured'];
        $item[$info['id']]['urgent'] = $info['urgent'];
        $item[$info['id']]['highlight'] = $info['highlight'];
        $item[$info['id']]['product_name'] = $info['product_name'];
        $item[$info['id']]['company_id'] = $info['company_id'];
        $item[$info['id']]['company_name'] = strtolower($info['company_name']);
        $item[$info['id']]['company_image'] = !empty($info['company_image'])?$info['company_image']:'default.png';
        $item[$info['id']]['product_type'] = get_productType_title_by_id($info['product_type']);
        $item[$info['id']]['salary_type'] = get_salaryType_title_by_id($info['salary_type']);
        $item[$info['id']]['description'] = strlimiter(strip_tags($info['description']),200);
        $item[$info['id']]['category'] = $info['category'];
        $item[$info['id']]['phone'] = $info['phone'];
        $item[$info['id']]['address'] = strlimiter($info['location'],20);
        $cityname = get_cityName_by_id($info['city']);
        $item[$info['id']]['location'] = $cityname;
        $item[$info['id']]['city'] = $cityname;
        $item[$info['id']]['state'] = get_stateName_by_id($info['state']);
        $item[$info['id']]['country'] = get_countryName_by_id($info['country']);
        $item[$info['id']]['latlong'] = $info['latlong'];

        $salary_min = price_format($info['salary_min'],$info['country']);
        $item[$info['id']]['salary_min'] = $salary_min;
        $salary_max = price_format($info['salary_max'],$info['country']);
        $item[$info['id']]['salary_max'] = $salary_max;

        $item[$info['id']]['tag'] = $info['tag'];
        $item[$info['id']]['status'] = $info['status'];
        $item[$info['id']]['view'] = $info['view'];
        $item[$info['id']]['created_at'] = timeAgo($info['created_at']);
        //$item[$info['id']]['created_at_time'] = $info['created_at'];
        $datediff = strtotime(date('Y-m-d')) - strtotime($info['created_at']);
        $item[$info['id']]['new_status'] = round($datediff / (60 * 60 * 24));
        $item[$info['id']]['updated_at'] = date('d M Y', $info['updated_at']);

        $item[$info['id']]['cat_id'] = $info['category'];
        $item[$info['id']]['sub_cat_id'] = $info['sub_category'];
        $get_main = get_maincat_by_id($info['category']);
        $get_sub = get_subcat_by_id($info['sub_category']);
        $item[$info['id']]['category'] = $get_main['cat_name'];
        $item[$info['id']]['sub_category'] = $get_sub['sub_cat_name'];

        $item[$info['id']]['image'] = !empty($info['screen_shot'])?$info['screen_shot']:$item[$info['id']]['company_image'];

        $item[$info['id']]['favorite'] = check_product_favorite($info['id']);

        if($info['tag'] != ''){
            $item[$info['id']]['showtag'] = "1";
            $tag = explode(',', $info['tag']);
            $tag2 = array();
            foreach ($tag as $val)
            {
                //REMOVE SPACE FROM $VALUE ----
                $val = preg_replace("/[\s_]/","-", trim($val));
                $tag2[] = '<li><a href="'.$config['site_url'].'/listing?keywords='.$val.'">'.$val.'</a> </li>';
            }
            $item[$info['id']]['tag'] = implode('  ', $tag2);
        }else{
            $item[$info['id']]['tag'] = "";
            $item[$info['id']]['showtag'] = "0";
        }



        $user = "SELECT username FROM ".$config['db']['pre']."user where id='".$info['user_id']."'";
        $userresult = mysqli_query($mysqli, $user);
        $userinfo = mysqli_fetch_assoc($userresult);

        $item[$info['id']]['username'] = $userinfo['username'];


        if(check_user_upgrades($info['user_id']))
        {
            $sub_info = get_user_membership_detail($info['user_id']);
            $item[$info['id']]['sub_title'] = $sub_info['sub_title'];
            $item[$info['id']]['sub_image'] = $sub_info['sub_image'];
        }else{
            $item[$info['id']]['sub_title'] = '';
            $item[$info['id']]['sub_image'] = '';
        }

        $item[$info['id']]['highlight_bg'] = ($info['highlight'] == 1)? "highlight-premium-ad" : "";

        $author_url = create_slug($userinfo['username']);

        $item[$info['id']]['author_link'] = $config['site_url'].'profile/'.$author_url;

        $pro_url = create_slug($info['product_name']);

        $item[$info['id']]['link'] = $config['site_url'].'job/' . $info['id'] . '/'.$pro_url;

        $item[$info['id']]['catlink'] = $config['site_url'].'category/'.$get_main['slug'];

        $item[$info['id']]['subcatlink'] = $config['site_url'].'category/'.$get_main['slug'].'/'.$get_sub['slug'];

        $city = create_slug($item[$info['id']]['city']);
        $item[$info['id']]['citylink'] = $config['site_url'].'city/'.$info['city'].'/'.$city;

    }
}
else
{

    //echo "0 results";
}

//Again make loop for grid view
$item2 = array();
$item2 = $item;


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
    $Pagetitle = $lang['JOBS_LISTINGS'];
}

if(!empty($_GET['location'])){
    $locTitle        =   explode(',' ,$_GET['location']);
    $locTitle     =   $locTitle[0];
    $Pagetitle .= " ".$locTitle;
}
else{
    $sortname = check_user_country();
    $countryName = get_countryName_by_sortname($sortname);
    $Pagetitle .= " ".$countryName;
}

if(isset($_GET['city']) && !empty($_GET['city']))
{
    $cityName = get_cityName_by_id($_GET['city']);
    $Pagetitle = $lang['JOBS_LISTINGS']." ".$lang['IN']." ".$cityName;
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
    ->order_by_desc('asciiname')
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

// get job types
$rows = ORM::for_table($config['db']['pre'].'product_type')
        ->where('active', '1')
        ->order_by_desc('position')
        ->find_many();
$post_types = array();
foreach($rows as $row){
    $post_types[$row['id']]['id'] = $row['id'];
    $post_types[$row['id']]['title'] = get_productType_title_by_id($row['id']);
}

// get salary types
$rows = ORM::for_table($config['db']['pre'].'salary_type')
        ->where('active', '1')
        ->order_by_desc('position')
        ->find_many();
$salary_types = array();
foreach($rows as $row){
    $salary_types[$row['id']]['id'] = $row['id'];
    $salary_types[$row['id']]['title'] = get_salaryType_title_by_id($row['id']);
}

// Output to template
$page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/ad-listing.tpl');
$page->SetParameter ('OVERALL_HEADER', create_header($Pagetitle));
$page->SetParameter ('PAGETITLE', $Pagetitle);
$page->SetLoop ('POPULARCITY',$popular);
$page->SetLoop ('STATELIST',$states);
$page->SetParameter('USER_COUNTRY', strtolower($country_code));
$page->SetParameter('DEFAULT_COUNTRY',$countryName);
$page->SetParameter('DEFAULT_COUNTRY_ID', $country_code);
    $page->SetParameter('USER_COUNTRY_LOCAL', strtoupper($country_code));
$page->SetLoop ('ITEM', $item);
$page->SetLoop ('ITEM2', $item2);
$page->SetLoop ('CATEGORY',$GetCategory);
$page->SetParameter ('CAT_DROPDOWN',$cat_dropdown);
$page->SetParameter ('SERKEY', $keywords);
$page->SetParameter ('MAINCAT', $category);
$page->SetParameter ('SUBCAT', $subcat);
$page->SetParameter ('MAINCATEGORY', $mainCategory);
$page->SetParameter ('SUBCATEGORY', $subCategory);
$page->SetParameter ('BUDGET', $budget);
$page->SetParameter ('KEYWORDS', $keywords);
$page->SetParameter ('RANGE1', $range1);
$page->SetParameter ('RANGE2', $range2);
$page->SetParameter ('JOB_TYPE', $job_type);
$page->SetParameter ('SALARY_TYPE', $salary_type);
$page->SetParameter ('ADSFOUND', $total);
$page->SetParameter ('TOTALADSFOUND', $totalWithoutFilter);
$page->SetParameter ('FEATUREDFOUND', $featuredAds);
$page->SetParameter ('URGENTFOUND', $urgentAds);
$page->SetParameter ('LIMIT', $limit);
$page->SetParameter ('CITY', $_GET['city']);
$page->SetParameter ('FILTER', $filter);
$page->SetParameter ('SORT', $sorting);
$page->SetParameter ('ORDER', $order);
$page->SetParameter ('NO_RESULT_ID', $noresult_id);
if(isset($_SESSION['user']['id']))
{
    $page->SetParameter('USER_ID',$_SESSION['user']['id']);
    $page->SetParameter('LOGGED_IN', 1);
}
else
{
    $page->SetParameter('USER_ID','');
    $page->SetParameter('LOGGED_IN', 0);
}

if(isset($category) && !empty($category)) {
    $SubCatList = get_subcat_of_maincat( $category);
    $page->SetLoop ('SUBCATLIST',$SubCatList);
}else{
    $page->SetLoop ('SUBCATLIST',get_maincategory());
}

$Pagelink = "";
if(count($_GET) >= 1){
    $get = http_build_query($_GET);
    $Pagelink .= "?".$get;

    $page->SetLoop ('PAGES', pagenav($total,$page_number,$limit,$link['LISTING'].$Pagelink,1));
}else{
    $page->SetLoop ('PAGES', pagenav($total,$page_number,$limit,$link['LISTING']));
}
$page->SetLoop ('CUSTOMFIELDS',$custom_fields);
$page->SetLoop ('POSTTYPES',$post_types);
$page->SetLoop ('SALARYTYPES',$salary_types);
$page->SetParameter ('SHOWCUSTOMFIELD', (count($custom_fields) > 0) ? 1 : 0);
$page->SetParameter ('CATEGORY', "Ads Listing");
$page->SetParameter ('OVERALL_FOOTER', create_footer());
$page->CreatePageEcho();