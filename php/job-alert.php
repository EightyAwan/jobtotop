<?php

if(checkloggedin())
{
	update_lastactive();
	$ses_userdata = get_user_data($_SESSION['user']['username']);
	if($ses_userdata['user_type'] != 'user'){
		headerRedirect($link['DASHBOARD']);
	}

	$notify_cat = explode(',', $ses_userdata['notify_cat']);
	$category = get_maincategory($notify_cat,"checked");
    //print_r($notify_cat);
    $temp = array();
    foreach($notify_cat as $value){
        $temp[] =  array('tag'=>$value);
    }
    $final = $temp;
    
    //echo "<pre>";print_r($final);echo "</pre>";
	if(!isset($_POST['submit']))
    {
        if(!isset($_GET['removeTag'])){
            $page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/job-alert.tpl');
            $page->SetParameter ('OVERALL_HEADER', create_header($lang['JOB_ALERT']));
            $page->SetParameter ('RESUMES', resumes_count($_SESSION['user']['id']));
            $page->SetParameter ('APPLIEDJOBS', applied_jobs_count($_SESSION['user']['id']));
            $page->SetParameter ('FAVORITEADS', favorite_ads_count($_SESSION['user']['id']));
            $page->SetParameter('WCHAT', (isset($config['wchat_on_off']))? $config['wchat_on_off']:"");
            $page->SetLoop ('CATEGORY',$category);
            $page->SetLoop ('FINAL',$final);
            $page->SetParameter ('NOTIFY', $ses_userdata['notify']);
            $page->SetParameter ('LINK', $link['JOBALERT']);
            $page->SetParameter ('OVERALL_FOOTER', create_footer());
            $page->CreatePageEcho();
        }
    }else{
        /*** OLD CODE */
    	// $notify = isset($_POST['notify']) ? '1' : '0';

        // if (isset($_POST['choice']) && is_array($_POST['choice'])) {
        //     $choice = validate_input(implode(',', $_POST['choice']));
        // }else{
        //     $choice = '';
        // }
        // $now = date("Y-m-d H:i:s");
        // $user_update = ORM::for_table($config['db']['pre'].'user')->find_one($_SESSION['user']['id']);
        // $user_update->set('notify', $notify);
        // $user_update->set('notify_cat', $choice);
        // $user_update->set('updated_at', $now);
        // $user_update->save();

        // ORM::for_table($config['db']['pre'].'notification')
        //         ->where_equal('user_id', $_SESSION['user']['id'])
        //         ->delete_many();

        // if($notify)
        // {
        //     if(isset($_POST['choice']))
        //     {
        //         foreach ($_POST['choice'] as $key=>$value)
        //         {
        //             $notification = ORM::for_table($config['db']['pre'].'notification')->create();
        //             $notification->user_id = $_SESSION['user']['id'];
        //             $notification->cat_id = $key;
        //             $notification->user_email = $ses_userdata['email'];
        //             $notification->save();
        //         }
        //     }
        // }
        // transfer($link['JOBALERT'],$lang['PROFILE_UPDATED'],$lang['PROFILE_UPDATED']);
        /*** END OLD CODE */

        /*** Testing CODE */
        
        
        function addToString($str, $item) {
                $str = substr($str, 1, -1);;
                $parts = explode(',', $str);
                array_push($parts,$item);
                array_filter($parts);
                //$parts = substr($parts, 0, -1);;
                return implode(',', $parts);
                
        }
        
        if(isset($_POST['addTag'])){
            $data = addToString($ses_userdata['notify_cat'], $_POST['add']);
            $now = date("Y-m-d H:i:s");
            $user_update = ORM::for_table($config['db']['pre'].'user')->find_one($_SESSION['user']['id']);
            $user_update->set('notify_cat', $data);
            $user_update->set('updated_at', $now);
            $user_update->save();
        } 

        $noti_userdata = get_user_data($_SESSION['user']['username']);
        $noti = explode(',', $noti_userdata['notify_cat']);
        ORM::for_table($config['db']['pre'].'notification')
                ->where_equal('user_id', $_SESSION['user']['id'])
                ->delete_many();
        foreach ($noti as $key=>$value)
        {
            $notification = ORM::for_table($config['db']['pre'].'notification')->create();
            $notification->user_id = $_SESSION['user']['id'];
            $notification->cat_id = $value;
            $notification->user_email = $noti_userdata['email'];
            $notification->save();
        }
        
        transfer($link['JOBALERT'],$lang['PROFILE_UPDATED'],$lang['PROFILE_UPDATED']);
        //echo $_POST['add'];

    }
    
    if(isset($_GET['removeTag'])){
        function removeFromString($str, $item) {
            $parts = explode(',', $str);
        
            while(($i = array_search($item, $parts)) !== false) {
                unset($parts[$i]);
            }
        
            return implode(',', $parts);
        }
    
        if(isset($_GET['removeTag'])){
            $data = removeFromString($ses_userdata['notify_cat'], $_GET['remove']);
            $now = date("Y-m-d H:i:s");
            $user_update = ORM::for_table($config['db']['pre'].'user')->find_one($_SESSION['user']['id']);
            $user_update->set('notify_cat', $data);
            $user_update->set('updated_at', $now);
            $user_update->save();
        } 
        
        $noti_userdata = get_user_data($_SESSION['user']['username']);
        $noti = explode(',', $noti_userdata['notify_cat']);
        ORM::for_table($config['db']['pre'].'notification')
                ->where_equal('user_id', $_SESSION['user']['id'])
                ->delete_many();
        foreach ($noti as $key=>$value)
        {
            $notification = ORM::for_table($config['db']['pre'].'notification')->create();
            $notification->user_id = $_SESSION['user']['id'];
            $notification->cat_id = $value;
            $notification->user_email = $noti_userdata['email'];
            $notification->save();
        }
        
        transfer($link['JOBALERT'],$lang['PROFILE_UPDATED'],$lang['PROFILE_UPDATED']);

    }

    

}else{
	headerRedirect($link['LOGIN']);
}
?>
