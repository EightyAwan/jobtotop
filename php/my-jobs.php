<?php
if(!isset($_GET['page']))
    $page = 1;
else
    $page = $_GET['page'];


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
    $sort = "p.id";

$limit = isset($_GET['limit']) ? $_GET['limit'] : 6;
$sorting = isset($_GET['sort']) ? $_GET['sort'] : "Newest";


if(checkloggedin()) {
    $ses_userdata = get_user_data(null,$_SESSION['user']['id']);
    $author_image = $ses_userdata['image'];
    if($ses_userdata['user_type'] != 'employer'){
        headerRedirect($link['DASHBOARD']);
    }
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

    $where = '';
    $order_by_keyword = '';
    if(isset($_GET['keywords']) && !empty($_GET['keywords'])){
        $where.= " p.active=1 AND (p.product_name LIKE '%$keywords%' or p.tag LIKE '%$keywords%') ";
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

    if(isset($_GET['city']) && !empty($_GET['city']))
    {
        $where.= "AND (p.city = '".$_GET['city']."') ";
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
            $where.= "AND (p.city = '$placeid') ";
        }
    }
    else{
        /*$country_code = check_user_country();
        $where.= "AND (country = '$country_code') ";*/
    }

    $sql = "SELECT p.*, c.name company_name, pt.id product_type
FROM `".$config['db']['pre']."product` p LEFT JOIN `".$config['db']['pre']."companies` c on p.company_id = c.id AND c.active=1 LEFT JOIN `".$config['db']['pre']."product_type` pt on p.product_type = pt.id AND pt.active = 1
 WHERE p.active =1 AND (p.status = 'active' || p.status = 'pending') AND p.hide = '0' AND p.user_id = '".$_SESSION['user']['id']."' ";
    /*$q = "$sql $where";
    $totalWithoutFilter = mysqli_num_rows(mysqli_query($mysqli, $q));*/
    $total = mysqli_num_rows(mysqli_query($mysqli, "SELECT 1 FROM ".$config['db']['pre']."product as p where (status = 'active' || status = 'pending')  and hide = '0' and user_id = '".$_SESSION['user']['id']."' $where"));
    $query = "$sql $where ORDER BY $sort DESC LIMIT ".($page-1)*$limit.",$limit";

    $result = ORM::for_table($config['db']['pre'].'product')->raw_query($query)->find_many();

    $items = array();
    if ($result) {
        foreach ($result as $info)
        {
            $items[$info['id']]['id'] = $info['id'];
            $items[$info['id']]['status'] = $info['status'];
            $items[$info['id']]['product_name'] = $info['product_name'];
            $items[$info['id']]['company_name'] = $info['company_name'];
            $items[$info['id']]['product_type'] = get_productType_title_by_id($info['product_type']);
            $items[$info['id']]['cat_id'] = $info['category'];
            $items[$info['id']]['sub_cat_id'] = $info['sub_category'];
            $items[$info['id']]['salary_min'] = $info['salary_min'];
            $items[$info['id']]['salary_max'] = $info['salary_max'];
            $items[$info['id']]['location'] = $info['location'];
            $items[$info['id']]['featured'] = $info['featured'];
            $items[$info['id']]['urgent'] = $info['urgent'];
            $items[$info['id']]['highlight'] = $info['highlight'];
            $items[$info['id']]['highlight_bgClr'] = ($info['highlight'] == 1)? "highlight-premium-ad" : "";

            $cityname = get_cityName_by_id($info['city']);
            $items[$info['id']]['location'] = $info['location'];
            $items[$info['id']]['city'] = $cityname;

            $items[$info['id']]['hide'] = $info['hide'];

            $items[$info['id']]['created_at'] = timeAgo($info['created_at']);
            $expire_date_timestamp = $info['expire_date'];
            $expire_date = date('d M, Y', $expire_date_timestamp);
            $items[$info['id']]['expire_date'] = $expire_date;

            $items[$info['id']]['cat_id'] = $info['category'];
            $items[$info['id']]['sub_cat_id'] = $info['sub_category'];
            $get_main = get_maincat_by_id($info['category']);
            $get_sub = get_subcat_by_id($info['sub_category']);
            $items[$info['id']]['category'] = $get_main['cat_name'];
            $items[$info['id']]['sub_category'] = $get_sub['sub_cat_name'];

            $items[$info['id']]['favorite'] = check_product_favorite($info['id']);

            /*$status = $info['status'];

            if ($status == "active") {
                $items[$info['id']]['status'] = $lang['ACTIVE'];
            }
            else if ($status == "pending") {
                $items[$info['id']]['status'] = $lang['PENDING'];
            }
            else if ($status == "expire") {
                $items[$info['id']]['status'] = $lang['EXPIRE'];
            }
            else{
                $items[$info['id']]['status'] = $info['status'];
            }*/


            $salary_min = price_format($info['salary_min'],$info['country']);
            $item[$info['id']]['salary_min'] = $salary_min;
            $salary_max = price_format($info['salary_max'],$info['country']);
            $item[$info['id']]['salary_max'] = $salary_max;

            $userinfo = get_user_data(null,$info['user_id']);

            $items[$info['id']]['username'] = $userinfo['username'];
            $author_url = create_slug($userinfo['username']);

            $items[$info['id']]['author_link'] = $config['site_url'].'profile/'.$author_url;

            if(check_user_upgrades($info['user_id']))
            {
                $sub_info = get_user_membership_detail($info['user_id']);
                $items[$info['id']]['sub_title'] = $sub_info['sub_title'];
                $items[$info['id']]['sub_image'] = $sub_info['sub_image'];
            }else{
                $items[$info['id']]['sub_title'] = '';
                $items[$info['id']]['sub_image'] = '';
            }
            $pro_url = create_slug($info['product_name']);
            $items[$info['id']]['link'] = $config['site_url'].'job/' . $info['id'] . '/'.$pro_url;
            $items[$info['id']]['catlink'] = $config['site_url'].'category/'.$get_main['slug'];
            $items[$info['id']]['subcatlink'] = $config['site_url'].'category/'.$get_main['slug'].'/'.$get_sub['slug'];

            $city = create_slug($items[$info['id']]['city']);
            $items[$info['id']]['citylink'] = $config['site_url'].'city/'.$info['city'].'/'.$city;

        }
    }
    
    $total_item = get_items_count($_SESSION['user']['id']);

    $pagging = pagenav($total_item,$page,$limit,$link['MYJOBS']);

    $Pagelink = "";
    if(count($_GET) >= 1){
        $get = http_build_query($_GET);
        $Pagelink .= "?".$get;

        $pagging = pagenav($total,$page,$limit,$link['MYJOBS'].$Pagelink,1);
    }else{
        $pagging = pagenav($total,$page,$limit,$link['MYJOBS']);
    }

    $GetCategory = get_maincategory();
    $cat_dropdown = get_categories_dropdown($lang);
    // Output to template
    $page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/my-jobs.tpl');
    $page->SetParameter ('OVERALL_HEADER', create_header($lang['MY_JOBS']));
    $page->SetParameter ('CAT_DROPDOWN',$cat_dropdown);
    $page->SetParameter ('MYADS', active_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('ACTIVEADS', active_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('SAVEDADS', saved_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('PENDINGADS', pending_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('HIDDENADS', hidden_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('COMPANIES', companies_count($_SESSION['user']['id']));
    $page->SetParameter ('EXPIREADS', expire_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('RESUBMITADS', resubmited_ads_count($_SESSION['user']['id']));
    $page->SetParameter('WCHAT', (isset($config['wchat_on_off']))? $config['wchat_on_off']:"");
    $page->SetParameter ('FAVORITEUSERSS', favorite_users_count($_SESSION['user']['id']));
    $page->SetLoop ('ITEM', $items);
    $page->SetLoop ('PAGES', $pagging);
    $page->SetParameter ('LIMIT', $limit);
    $page->SetParameter ('SORT', $sorting);
    $page->SetParameter ('ORDER', $order);
    $page->SetParameter ('MAINCAT', $category);
    $page->SetParameter ('SUBCAT', $subcat);
    $page->SetParameter ('KEYWORDS', $keywords);
    $page->SetParameter ('ADSFOUND', $total);
    $page->SetParameter ('TOTALITEM', $total_item);
    $page->SetParameter ('AUTHORUNAME', ucfirst($ses_userdata['username']));
    $page->SetParameter ('AUTHORNAME', ucfirst($ses_userdata['name']));
    $page->SetParameter ('AUTHORIMG', $author_image);
    $page->SetLoop ('HTMLPAGE', get_html_pages());
    $page->SetParameter('COPYRIGHT_TEXT', get_option("copyright_text"));
    $page->SetParameter ('OVERALL_FOOTER', create_footer());
    $page->CreatePageEcho();
}
else{
    error($lang['PAGE_NOT_FOUND'], __LINE__, __FILE__, 1);
    exit();
}
?>
