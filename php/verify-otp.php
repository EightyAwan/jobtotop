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

$verify_otp = ORM::for_table($config['db']['pre'].'user_otps')
            ->select_many('id', 'token', 'number')
            ->where('token', $_POST['otp'])
            ->find_one();
         
            if($verify_otp->token){
                $verify_otp->delete();
                echo "1";
            }else{
                echo "0";
            }

?>