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

        // echo "<pre>";
        // print_r($_SERVER);
        global $config,$lang,$line;
        //$sql = "SELECT * FROM `".$config['db']['pre']."user` WHERE active = 1 AND email='musman5264@gmail.com'";
        $sql = "SELECT * FROM `".$config['db']['pre']."user`";
        $sql_cat = "SELECT cat_name,sub_cat_name,COUNT(*) as totalJobs FROM `".$config['db']['pre']."catagory_main` as cm JOIN `".$config['db']['pre']."catagory_sub` as cs JOIN `".$config['db']['pre']."product` as p WHERE p.category = cm.cat_id AND p.sub_category = cs.sub_cat_id GROUP BY p.category";
    
        $pdo = ORM::get_db();
        $result_cat = $pdo->query($sql_cat);
        foreach ($result_cat as $row) {
            $line .= $row['cat_name']. " - " . $row['totalJobs'] . "<br>";
        }
        //echo $line;
    
        $result = $pdo->query($sql);
    
        $total = count($result);
        if ($total > 0) {
            foreach ($result as $row) {
                 echo $row['email'] . "<br>";
                // echo $row['name'] . "<br>";
                
                $page = new HtmlTemplate();
                $page->html = $config['email_sub_newsletter'];
                $page->SetParameter('JOB_TYPES', $line);
                $email_subject = $page->CreatePageReturn($lang,$config,'');
    
                $page = new HtmlTemplate();
                $page->html = $config['email_message_newsletter'];
                $page->SetParameter('JOB_TYPES', $line);
                $email_body = $page->CreatePageReturn($lang,$config,'');
                
                //email($row['email'],$row['name'],$email_subject,$email_body);
            }
        }



    die();
    
    ?>