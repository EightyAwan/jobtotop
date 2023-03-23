<?php
if(!isset($_GET['page']))
    $_GET['page'] = 1;

$limit = 5;

if(checkloggedin()) {
    $items = get_items($_SESSION['user']['id'],"hide",false,$_GET['page'],$limit);
    $total_item = get_items_count($_SESSION['user']['id'],"hide");
    $pagging = pagenav($total_item,$_GET['page'],$limit,$link['HIDDENJOBS']);
    // Output to template
    $page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/ad-hidden.tpl');
    $page->SetParameter ('OVERALL_HEADER', create_header($lang['HIDDEN_JOBS']));
    $page->SetParameter ('RESUBMITADS', resubmited_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('SAVEDADS', saved_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('HIDDENADS', hidden_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('COMPANIES', companies_count($_SESSION['user']['id']));
    $page->SetParameter ('PENDINGADS', pending_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('EXPIREADS', expire_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('MYADS', active_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('FAVORITEUSERSS', favorite_users_count($_SESSION['user']['id']));
    $page->SetParameter('WCHAT', (isset($config['wchat_on_off']))? $config['wchat_on_off']:"");
    $page->SetLoop ('ITEM', $items);
    $page->SetLoop ('PAGES', $pagging);
    $page->SetParameter ('TOTALITEM', $total_item);
    $page->SetParameter ('OVERALL_FOOTER', create_footer());
    $page->CreatePageEcho();
}
else{
    error($lang['PAGE_NOT_FOUND'], __LINE__, __FILE__, 1);
    exit();
}
?>
