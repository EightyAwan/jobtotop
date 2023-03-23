<?php
if(checkloggedin())
{
    update_lastactive();
    $ses_userdata = get_user_data($_SESSION['user']['username']);
    if($ses_userdata['user_type'] != 'user'){
        headerRedirect($link['DASHBOARD']);
    }


    $result = ORM::for_table($config['db']['pre'].'experiences')
        ->where('user_id' , $_SESSION['user']['id'])->find_many();

    $items = array();
    if ($result) {
        foreach ($result as $info)
        {
            $items[$info['id']]['id'] = $info['id'];
            $items[$info['id']]['title'] = $info['title'];
            $items[$info['id']]['company'] = $info['company'];
            $items[$info['id']]['description'] = $info['description'];
            $items[$info['id']]['start_date'] = date('d M, Y', strtotime($info['start_date']));
            $items[$info['id']]['end_date'] = $info['currently_working']?$lang['CURRENTLY_WORKING']:date('d M, Y', strtotime($info['end_date']));
            $items[$info['id']]['city'] = $info['city'];
        }
    }

    $page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/my-experiences.tpl');
    $page->SetParameter ('OVERALL_HEADER', create_header($lang['MY_EXPERIENCES']));
    $page->SetLoop ('ITEM', $items);
    $page->SetParameter ('RESUMES', resumes_count($_SESSION['user']['id']));
    $page->SetParameter ('APPLIEDJOBS', applied_jobs_count($_SESSION['user']['id']));
    $page->SetParameter ('FAVORITEADS', favorite_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('TOTALITEM', count($result));
    $page->SetParameter('WCHAT', (isset($config['wchat_on_off']))? $config['wchat_on_off']:"");
    $page->SetParameter ('OVERALL_FOOTER', create_footer());
    $page->CreatePageEcho();
}else{
    headerRedirect($link['LOGIN']);
}