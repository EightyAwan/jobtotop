<?php

$maincat = array();
$var = 0;

$result = ORM::for_table($config['db']['pre'].'catagory_main')
    ->where('active',1)
    ->order_by_asc('cat_order')
    ->find_many();
foreach ($result as $info1) {

    if($config['lang_code'] != 'en' && $config['userlangsel'] == '1'){
        $transcat = get_category_translation("main",$info1['cat_id']);
        $info1['cat_name'] = $transcat['title'];

    }
    $maincat[$info1['cat_id']]['icon'] = $info1['icon'];
    $maincat[$info1['cat_id']]['main_title'] = $info1['cat_name'];
    $maincat[$info1['cat_id']]['main_id'] = $info1['cat_id'];
    $var++;
}

$subcat = array();

foreach ($result as $info) {
    if($config['lang_code'] != 'en' && $config['userlangsel'] == '1'){
        $transcat = get_category_translation("main",$info['cat_id']);
        $info['cat_name'] = $transcat['title'];
        $info['slug'] = $transcat['slug'];
    }
    $subcat[$info['cat_id']]['icon'] = $info['icon'];
    $subcat[$info['cat_id']]['main_title'] = $info['cat_name'];
    $subcat[$info['cat_id']]['main_id'] = $info['cat_id'];
    $cat_url = create_slug($info['cat_name']);
    $subcat[$info['cat_id']]['catlink'] = $config['site_url'].'category/'.$info['slug'];

    $totalAdsMaincat = get_items_count(false,"active",false,null,$info['cat_id'],true);
    $subcat[$info['cat_id']]['main_ads_count'] = $totalAdsMaincat;
    $count = 1;

    $rows = ORM::for_table($config['db']['pre'].'catagory_sub')
        ->where('main_cat_id', $info['cat_id'])
        ->where('active',1)
        ->order_by_asc('cat_order')
        ->find_many();
    if(count($rows) == 0){
        $subcat[$info['cat_id']]['sub_cat'] = 0;
    }else{
        $subcat[$info['cat_id']]['sub_cat'] = 1;
    }
    foreach ($rows as $info1) {
        if($config['lang_code'] != 'en' && $config['userlangsel'] == '1'){
            $transsubcat = get_category_translation("sub",$info1['sub_cat_id']);
            $info1['sub_cat_name'] = $transsubcat['title'];
            $info1['slug'] = $transsubcat['slug'];
        }
        $subcatlink = $config['site_url'].'category/'.$info['slug'].'/'.$info1['slug'];
        $totalads = get_items_count(false,"active",false,$info1['sub_cat_id'],null,true);
        $subcat_tpl = '<li><a href="'.$subcatlink.'">'.$info1['sub_cat_name'].' ('.$totalads.')</a></li>';

        if($count == 1)
            $subcat[$info['cat_id']]['sub_title'] = $subcat_tpl;
        else
            $subcat[$info['cat_id']]['sub_title'] .= $subcat_tpl;

        $count++;
    }
}

$page = new HtmlTemplate ('templates/'.$config['tpl_name'].'/sitemap.tpl');
$page->SetParameter ('OVERALL_HEADER', create_header($lang['SITE_MAP']));
$page->SetLoop ('CAT',$maincat);
$page->SetLoop ('SUBCAT',$subcat);
$page->SetParameter ('OVERALL_FOOTER', create_footer());
$page->SetParameter ('OVERALL_FOOTER', create_footer());
$page->CreatePageEcho();
?>
