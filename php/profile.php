<?php
if(!isset($_GET['page']))
    $page = 1;
else
    $page = $_GET['page'];

$limit = 10;

if(isset($_GET['username'])){
    $get_userdata = get_user_data($_GET['username']);
    if(is_array($get_userdata)){
        $user_id = $get_userdata['id'];
        update_profileview($user_id);
        $user_view = thousandsCurrencyFormat($get_userdata['view']);
        $user_name = $get_userdata['name'];
        $user_tagline = $get_userdata['tagline'];
        $user_about = nl2br(stripcslashes($get_userdata['description']));
        $user_sex = $get_userdata['sex'];
        $user_city = $get_userdata['city'];
        $user_address = nl2br(stripcslashes($get_userdata['address']));
        $user_website = $get_userdata['website'];
        $user_image = !empty($get_userdata['image'])?$get_userdata['image']:'default_user.png';
        $created = date('d M Y', strtotime($get_userdata['created_at']));
        $lastactive = date('d M Y', strtotime($get_userdata['lastactive']));

        $user_category = $user_subcategory = null;
        if(!empty($get_userdata['category'])){
            $get_cat = get_maincat_by_id($get_userdata['category']);
            $user_category = $get_cat['cat_name'];
        }
        if(!empty($get_userdata['subcategory'])){
            $get_cat = get_subcat_by_id($get_userdata['subcategory']);
            $user_subcategory = $get_cat['sub_cat_name'];
        }

        $country_code = $get_userdata['country_code'];
        $user_salary_min = price_format($get_userdata['salary_min'], $country_code);
        $user_salary_max = price_format($get_userdata['salary_max'], $country_code);

        $user_age = null;
        if(!empty($get_userdata['dob'])){
            $user_age = date_diff(date_create($get_userdata['dob']), date_create('today'))->y;
        }

        if($config['contact_validation'] == '1'){
            $user_email = (checkloggedin()) ? $get_userdata['email'] : "Login to see";
            $user_phone = (checkloggedin()) ? $get_userdata['phone'] : "Login to see";
        }else{
            $user_email = $get_userdata['email'];
            $user_phone = $get_userdata['phone'];
        }

        $hide_contact = 0;
        if($config['contact_validation'] == '1'){
            if(!checkloggedin()){
                $hide_contact = 1;
            }
        }
        $state_name = '';
        if(!empty($get_userdata['city_code'])) {
            $city_detail = get_cityDetail_by_id($get_userdata['city_code']);
            $user_city = $city_detail['asciiname'];
            $state_name = ', '.get_stateName_by_id($city_detail['subadmin1_code']);
        }

        $items = array();
        $total = 0;
        $pagging = array();
        if($get_userdata['user_type'] == 'employer'){
            $results = ORM::for_table($config['db']['pre'].'product')
                ->where('user_id',$user_id)
                ->where('status','active')
                ->where('hide','0')
                ->limit($limit)
                ->offset(($page-1)*$limit)
                ->find_many();
            $items = array();
            foreach($results as $info){
                $items[$info['id']]['id'] = $info['id'];
                $items[$info['id']]['name'] = $info['product_name'];
                $items[$info['id']]['product_type'] = get_productType_title_by_id($info['product_type']);
                $items[$info['id']]['featured'] = $info['featured'];
                $items[$info['id']]['urgent'] = $info['urgent'];
                $items[$info['id']]['highlight'] = $info['highlight'];

                $salary_min = price_format($info['salary_min'],$info['country']);
                $items[$info['id']]['salary_min'] = $salary_min;
                $salary_max = price_format($info['salary_max'],$info['country']);
                $items[$info['id']]['salary_max'] = $salary_max;

                $cityname = get_cityName_by_id($info['city']);
                $items[$info['id']]['city'] = $cityname;
                $items[$info['id']]['created_at'] = timeAgo($info['created_at']);
                $pro_url = create_slug($info['product_name']);
                $items[$info['id']]['link'] = $config['site_url'].'job/' . $info['id'] . '/'.$pro_url;
            }
            $total = ORM::for_table($config['db']['pre'].'product')
                ->where('user_id',$user_id)
                ->where('status','active')
                ->where('hide','0')
                ->count();
            $pagging = pagenav($total,$page,$limit,$link['PROFILE'].'/'.$_GET['username']);
        }

        $experiences = array();
        if($get_userdata['user_type'] == 'user'){
            $result = ORM::for_table($config['db']['pre'].'experiences')
                ->where('user_id' , $user_id)->find_many();
            foreach ($result as $info)
            {
                $experiences[$info['id']]['id'] = $info['id'];
                $experiences[$info['id']]['title'] = $info['title'];
                $experiences[$info['id']]['company'] = $info['company'];
                $experiences[$info['id']]['description'] = $info['description'];
                $experiences[$info['id']]['start_date'] = date('d M, Y', strtotime($info['start_date']));
                $experiences[$info['id']]['end_date'] = $info['currently_working']?$lang['CURRENTLY_WORKING']:date('d M, Y', strtotime($info['end_date']));
                $experiences[$info['id']]['city'] = $info['city'];
            }
        }
        
        
        $orm = ORM::for_table($config['db']['pre'].'resumes')
        ->where('user_id' , $user_id)
        ->where('active' , '1');
        $resume = "";
        $result1 = $orm->find_many();
            //$items = array();
            if ($result1) {
                foreach ($result1 as $info1)
                {
                //	$items[$info['id']]['id'] = $info['id'];
                	$resumename = $info1['name'];
                	$resume = $info1['filename'];
                }
            }

        // Output to template
        $page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/profile.tpl');
        $page->SetParameter ('OVERALL_HEADER', create_header($user_name." ".$lang['PROFILE']));
        $page->SetParameter ('PROFILEVISIT', $user_view);
        $page->SetParameter ('FULLNAME', $user_name);
        $page->SetParameter ('USERID', $user_id);
        $page->SetParameter ('EMAIL', $user_email);
        $page->SetParameter ('CATEGORY', $user_category);
        $page->SetParameter ('SUBCATEGORY', $user_subcategory);
        $page->SetParameter ('SALARY_MIN', $user_salary_min);
        $page->SetParameter ('SALARY_MAX', $user_salary_max);
        $page->SetParameter ('AGE', $user_age);
        $page->SetParameter ('CITYNAME', $user_city);
        $page->SetParameter ('STATENAME', $state_name);
        $page->SetParameter ('TAGLINE', $user_tagline);
        $page->SetParameter ('ABOUT', $user_about);
        $page->SetParameter ('USERIMAGE', $user_image);
        $page->SetParameter ('USER_TYPE', $get_userdata['user_type']);
        $page->SetParameter ('PHONE', $user_phone);
        $page->SetParameter ('GENDER', $user_sex);
        $page->SetParameter ('ADDRESS', $user_address);
        $page->SetParameter('WEBSITE', $user_website);
        $page->SetParameter('FACEBOOK', $get_userdata['facebook']);
        $page->SetParameter('TWITTER', $get_userdata['twitter']);
        $page->SetParameter('INSTAGRAM', $get_userdata['instagram']);
        $page->SetParameter('LINKEDIN', $get_userdata['linkedin']);
        $page->SetParameter('YOUTUBE', $get_userdata['youtube']);
        $page->SetParameter ('CREATED', $created);
        $page->SetParameter ('HIDE_CONTACT', $hide_contact);
        $page->SetParameter ('LASTACTIVE', $lastactive);
        $page->SetLoop ('ITEM', $items);
        $page->SetLoop ('EXPERIENCES', $experiences);
        $page->SetLoop ('PAGES', $pagging);
        $page->SetParameter('SHOW_PAGING', (int)($total > $limit));
        $page->SetParameter ('TOTALITEM', $total);
        $page->SetParameter ('TOTAL_EXPERIENCES', count($experiences));
        $page->SetParameter ('resume', $resume);
        
        $page->SetParameter('USER_FAVORITE', check_user_favorite($user_id));
        $page->SetParameter ('OVERALL_FOOTER', create_footer());
        $page->CreatePageEcho();
        exit();
    }
    else{
        error($lang['PAGE_NOT_FOUND'], __LINE__, __FILE__, 1);
        exit();
    }
}
else{
    error($lang['PAGE_NOT_FOUND'], __LINE__, __FILE__, 1);
    exit();
}
?>
