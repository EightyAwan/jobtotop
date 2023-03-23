<?php
$page = new HtmlTemplate ("templates/" . $config['tpl_name'] . "/terms.tpl");
$page->SetParameter ('OVERALL_HEADER', create_header($lang['TERMS']));
$page->SetParameter ('OVERALL_FOOTER', create_footer());
$page->CreatePageEcho();
?>