<?php
$page = new HtmlTemplate ("templates/" . $config['tpl_name'] . "/about.tpl");
$page->SetParameter ('OVERALL_HEADER', create_header($lang['Privacy']));
$page->SetParameter ('OVERALL_FOOTER', create_footer());
$page->CreatePageEcho();
?>