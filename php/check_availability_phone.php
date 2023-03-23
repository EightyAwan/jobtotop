<?php
require_once('../includes/config.php');
require_once('../includes/sql_builder/idiorm.php');
require_once('../includes/db.php');
require_once('../includes/classes/class.template_engine.php');
require_once('../includes/classes/class.country.php');
require_once('../includes/functions/func.global.php');
require_once('../includes/functions/func.sqlquery.php');
require_once('../includes/functions/func.users.php');
require_once('../includes/lang/lang_'.$config['lang'].'.php');
require_once('../includes/seo-url.php');

sec_session_start();

require_once('../includes/seo-url.php');



// Check if this is an Email availability check from signup page using ajax
if(isset($_POST["phone"])) {
    $_POST['phone'] = strtolower($_POST['phone']);

    $regex = '/^[0-9]{10}+$/';

    if(empty($_POST["phone"])) {
        $phone_error = $lang['ENTERPHONE'];
        echo "<span class='status-not-available'> ".$phone_error."</span>";
        exit;
    }
    elseif(!preg_match($regex, $_POST['phone']))
    {
        $phone_error = $lang['PHONEINV'];
        echo "<span class='status-not-available'> ".$phone_error.".</span>";
        exit;
    }

    if(checkloggedin())
    {
        $ses_userdata = get_user_data($_SESSION['user']['username']);
        if($_POST["phone"] != $ses_userdata['phone'])
        {
            $user_count = check_phone_exists($_POST["phone"]);
            if($user_count>0) {
                $phone_error = $lang['PHONEEXIST'];
                echo "<span class='status-not-available'>".$phone_error."</span>";
            }
            else {
                $phone_error = $lang['PHONENOTEXIST'];
                echo "<span class='status-available'><a href='javascript:void(0)' id='otp-dialog'>".$phone_error."</a></span>";
            }
            exit;
        }else{
            //echo "<span class='status-available'>".$lang['SUCCESS']."</span>";
            exit;
        }
    }
    else{
        $user_count = check_phone_exists($_POST["phone"]);
        if($user_count>0) {
            $phone_error = $lang['PHONEEXIST'];
            echo "<span class='status-not-available'>".$phone_error."</span>";
        }
        else {
            $phone_error = $lang['PHONENOTEXIST'];
            echo "<span class='status-available'>".$phone_error."</span>";
        }
        exit;
    }
}

?>