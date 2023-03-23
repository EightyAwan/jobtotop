<?php
// if resume is disable
if(!$config['resume_enable']){
    error($lang['PAGE_NOT_FOUND'], __LINE__, __FILE__, 1);
}

if(checkloggedin())
{
	update_lastactive();
	$ses_userdata = get_user_data($_SESSION['user']['username']);
	if($ses_userdata['user_type'] != 'user'){
		headerRedirect($link['DASHBOARD']);
	}

	$keywords = '';

	$orm = ORM::for_table($config['db']['pre'].'resumes')
        ->where('user_id' , $_SESSION['user']['id'])
        ->where('active' , '1');

    if(!empty($_GET['keywords'])){
    	$keywords = $_GET['keywords'];
    	$orm->where_like('name','%'.$keywords.'%');
    }

    $result = $orm->find_many();
    $items = array();
    if ($result) {
        foreach ($result as $info)
        {
        	$items[$info['id']]['id'] = $info['id'];
        	$items[$info['id']]['name'] = $info['name'];
        	$items[$info['id']]['filename'] = $info['filename'];
        }
    }

	$page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/my-resumes.tpl');
    $page->SetParameter ('OVERALL_HEADER', create_header($lang['MY_RESUMES']));
    $page->SetLoop ('ITEM', $items);
    $page->SetParameter ('RESUMES', resumes_count($_SESSION['user']['id']));
    $page->SetParameter ('APPLIEDJOBS', applied_jobs_count($_SESSION['user']['id']));
    $page->SetParameter ('FAVORITEADS', favorite_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('KEYWORDS', $keywords);
    $page->SetParameter('WCHAT', (isset($config['wchat_on_off']))? $config['wchat_on_off']:"");
    $page->SetParameter ('OVERALL_FOOTER', create_footer());
    $page->CreatePageEcho();
}else{
	headerRedirect($link['LOGIN']);
}
?>
