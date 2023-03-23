<?php

if(checkloggedin())
{
    update_lastactive();
    $ses_userdata = get_user_data($_SESSION['user']['username']);
    if($ses_userdata['user_type'] != 'user'){
        headerRedirect($link['DASHBOARD']);
    }
    $id = $title = $company = $description = $city = $start_date = $end_date = $currently_working = $error = '';
    global $match;
    if(isset($match['params']['id'])){
        $_GET['id'] = $match['params']['id'];

        $result = ORM::for_table($config['db']['pre'].'experiences')
            ->where('user_id' , $_SESSION['user']['id'])
            ->where('id' , $_GET['id'])
            ->find_one();

        $title = $result['title'];
        $company = $result['company'];
        $description = $result['description'];
        $city = $result['city'];
        $start_date = $result['start_date'];
        $end_date = $result['end_date'];
        $currently_working = $result['currently_working'];
        $id = $_GET['id'];
    }

    if(isset($_POST['submit'])){
        if(empty($_POST['title']) || empty($_POST['company']) || empty($_POST['description']) || empty($_POST['city']) || empty($_POST['start_date'])){
            $error = $lang['ALL_FIELDS_REQ'];
        }
        $start_date = date("Y-m-d", strtotime($_POST['start_date']));
        $end_date = null;
        if(!empty($_POST['end_date'])){
            $end_date = date("Y-m-d", strtotime($_POST['end_date']));
            if($end_date <= $start_date) {
                $error = $lang['INVALID_END_DATE'];
            }
        }else{
            $_POST['currently_working'] = '1';
        }

        if($error == '') {
            if (!empty($_POST['id'])) {
                $experience_create = ORM::for_table($config['db']['pre'].'experiences')
                    ->where('id',$_POST['id'])
                    ->where('user_id',$_SESSION['user']['id'])
                    ->find_one();

                $experience_create->set('title', $_POST['title']);
                $experience_create->set('company', $_POST['company']);
                $experience_create->set('description', $_POST['description']);
                $experience_create->set('city', $_POST['city']);
                $experience_create->set('start_date', $start_date);
                $experience_create->set('end_date', $end_date);
                $experience_create->set('currently_working', $_POST['currently_working']);
                $experience_create->save();
            } else {
                $experiences = ORM::for_table($config['db']['pre'].'experiences')->create();
                $experiences->user_id = $_SESSION['user']['id'];
                $experiences->title = $_POST['title'];
                $experiences->company = $_POST['company'];
                $experiences->description = $_POST['description'];
                $experiences->city = $_POST['city'];
                $experiences->start_date = $start_date;
                $experiences->end_date = $end_date;
                $experiences->currently_working = $_POST['currently_working'];
                $experiences->save();
            }

            transfer($link['EXPERIENCES'],$lang['EXPERIENCE_UPDATED'],$lang['EXPERIENCE_UPDATED']);
            exit;
        }
    }


    $page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/user-experience.tpl');
    $page->SetParameter ('OVERALL_HEADER', create_header($lang['ADD_EXPERIENCE']));
    $page->SetParameter ('APPLIEDJOBS', applied_jobs_count($_SESSION['user']['id']));
    $page->SetParameter ('RESUMES', resumes_count($_SESSION['user']['id']));
    $page->SetParameter ('FAVORITEADS', favorite_ads_count($_SESSION['user']['id']));
    $page->SetParameter('WCHAT', (isset($config['wchat_on_off']))? $config['wchat_on_off']:"");
    $page->SetParameter ('TITLE', $title);
    $page->SetParameter ('COMPANY', $company);
    $page->SetParameter ('DESCRIPTION', $description);
    $page->SetParameter ('CITY', $city);
    $page->SetParameter ('START_DATE', $start_date);
    $page->SetParameter ('END_DATE', $end_date);
    $page->SetParameter ('CURRENTLY_WORKING', $currently_working);
    $page->SetParameter ('ID', $id);
    $page->SetParameter ('ERROR', $error);
    $page->SetParameter ('OVERALL_FOOTER', create_footer());
    $page->CreatePageEcho();
}else{
    headerRedirect($link['LOGIN']);
}