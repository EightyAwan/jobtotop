<?php
if (checkloggedin()) {
    update_lastactive();
}

global $match;
if (!isset($match['params']['id'])) {
    error($lang['PAGE_NOT_FOUND'], __LINE__, __FILE__, 1);
    exit;
}
if(checkloggedin()) {
$_GET['id'] = $match['params']['id'];

$num_rows = ORM::for_table($config['db']['pre'] . 'transaction')
    ->where('id', $_GET['id'])
    ->count();
$item_custom = array();
$item_custom_textarea = array();
$item_checkbox = array();

if ($num_rows > 0) {

    $sql = " SELECT t.*,u.*,t.status as transaction_status, t.id as transaction_id FROM `" . $config['db']['pre'] . "transaction` as t LEFT JOIN `" . $config['db']['pre'] . "user` as u ON t.seller_id = u.id WHERE t.id = '" . $_GET['id'] . "' ";

    $info = ORM::for_table($config['db']['pre'] . 'transaction')->raw_query($sql)->find_one();
    // output data of each row

    $item_id = $info['id'];
    $invoice_no = 1000000+(INT)$info['transaction_id'];
    $product_name = $info['product_name'];
    $amount = $info['amount'];
    $fetured = $info['fetured'];
    $urgent = $info['urgent'];
    $highlight = $info['highlight'];
    //$transaction_time = date('d M Y h:i A', $info['transaction_time']);
    $transaction_time = date('d/m/Y', $info['transaction_time']);
    $status = $info['transaction_status'];
    $method = $info['transaction_gatway'];
    $transaction_description = $info['transaction_description'];

    //User Details
    $email = $info['email'];
    $name = $info['name'];
    $address = $info['address'];
    $country = $info['country'];
    $city = $info['city'];
    

    

} else {
    error($lang['PAGE_NOT_FOUND'], __LINE__, __FILE__, 1);
    exit;
}


// Output to template
$page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/invoice.tpl');
$page->SetParameter('OVERALL_HEADER', create_header($item_title, $meta_desc, $meta_image, true));
$page->SetParameter('INVOICE_NO', $invoice_no);
$page->SetParameter('PRODUCT_NAME', $product_name);
$page->SetParameter('AMOUNT', $amount);
$page->SetParameter('FEATURED', $fetured);
$page->SetParameter('URGENT', $urgent);
$page->SetParameter('HIGHLIGHT', $highlight);
$page->SetParameter('TRANSACTION_TIME', $transaction_time);
$page->SetParameter('STATUS', $status);
$page->SetParameter('METHOD', $method);
$page->SetParameter('TRANSACTION_DESCRIPTION', $transaction_description);
$page->SetParameter('NAME', $name);
$page->SetParameter('EMAIL', $email);
$page->SetParameter('ADDRESS', $address);
$page->SetParameter('COUNTRY', $country);
$page->SetParameter('CITY', $city);

$page->SetParameter('OVERALL_FOOTER', create_footer());
$page->CreatePageEcho();

}
else{
    error($lang['PAGE_NOT_FOUND'], __LINE__, __FILE__, 1);
    exit();
}
?>
