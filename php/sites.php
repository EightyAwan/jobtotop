<?php

$start = microtime(true);
$limit = 2;

if(isset($match['params']['country'])) {
    if ($match['params']['country'] != ""){
        change_user_country($match['params']['country']);
    }
}

if(isset($_POST['countrycode'])) {
    if ($_POST['countrycode'] != ""){
        change_user_country($_POST['countrycode']);
    }
}

// if(isset($_POST['languagecode'])) {
//     if ($_POST['languagecode'] != ""){
//         change_user_lang($_POST['languagecode'], false);
//     }
// }

$page = new HtmlTemplate ('templates/'.$config['tpl_name'].'/sites.tpl');
$page->SetParameter ('OVERALL_HEADER', create_header());
$page->SetParameter ('MAIN_FOOTER', main_footer());
$page->CreatePageEcho();
//echo "Execution time : ".$time_elapsed_secs = microtime(true) - $start." Seconds";
?>