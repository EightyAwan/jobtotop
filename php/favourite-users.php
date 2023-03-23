<?php

if(checkloggedin()) {
    update_lastactive();
    $item = array();
    $ses_userdata = get_user_data($_SESSION['user']['username']);

    if($ses_userdata['user_type'] != 'employer'){
        headerRedirect($link['DASHBOARD']);
    }

    if(!isset($_GET['page']))
        $_GET['page'] = 1;

    $limit = 10;
    $page = $_GET['page'];
    $offset = ($page-1)*$limit;

    $result = ORM::for_table($config['db']['pre'].'fav_users')
        ->select('fav_user_id')
        ->where('user_id', $_SESSION['user']['id'])
        ->limit($limit)->offset($offset)
        ->find_many();

    if (count($result) > 0) {
        foreach ($result as $fav) {
            $sql = "SELECT *
FROM `".$config['db']['pre']."user`
 WHERE status = '1' AND user_type = 'user' AND id = '".$fav['fav_user_id']."' ";
            $info = ORM::for_table($config['db']['pre'].'user')->raw_query($sql)->find_one();
            if (!empty($info)) {
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
    }

    $total_item = favorite_users_count($_SESSION['user']['id']);
    $pagging = pagenav($total_item,$_GET['page'],$limit,$link['FAVUSERS']);

    // Output to template
    $page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/favourite-users.tpl');
    $page->SetParameter ('OVERALL_HEADER', create_header($lang['FAV_USERS']));
    $page->SetParameter ('RESUBMITADS', resubmited_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('HIDDENADS', hidden_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('COMPANIES', companies_count($_SESSION['user']['id']));
    $page->SetParameter ('SAVEDADS', saved_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('PENDINGADS', pending_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('EXPIREADS', expire_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('MYADS', active_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('FAVORITEUSERSS', $total_item);
    $page->SetParameter('WCHAT', (isset($config['wchat_on_off']))? $config['wchat_on_off']:"");
    $page->SetLoop ('ITEM', $item);
    $page->SetLoop ('PAGES', $pagging);
    $page->SetParameter ('TOTALITEM', $total_item);
    $page->SetParameter ('OVERALL_FOOTER', create_footer());
    $page->CreatePageEcho();
}
else{
    error($lang['PAGE_NOT_FOUND'], __LINE__, __FILE__, 1);
    exit();
}