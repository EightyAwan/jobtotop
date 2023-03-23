<?php
// if company is disable
if(!$config['company_enable']){
    error($lang['PAGE_NOT_FOUND'], __LINE__, __FILE__, 1);
}
if(checkloggedin()) {
    update_lastactive();
}

if(!isset($_GET['id']))
{
    error($lang['PAGE_NOT_FOUND'], __LINE__, __FILE__, 1);
    exit;
}

$num_rows = ORM::for_table($config['db']['pre'].'companies')
    ->where('id',$_GET['id'])
    ->where('active',1)
    ->count();

if ($num_rows > 0) {

    $result = ORM::for_table($config['db']['pre'].'companies')->find_one($_GET['id']);
    $name = $result['name'];
	$description = nl2br(stripcslashes($result['description']));
	$city = $result['city'];
	$location = $result['location'];
	$phone = $result['phone'];
	$fax = $result['fax'];
	$email = $result['email'];
	$website = $result['website'];
	$facebook = $result['facebook'];
	$twitter = $result['twitter'];
	$linkedin = $result['linkedin'];
	$pinterest = $result['pinterest'];
	$youtube = $result['youtube'];
	$instagram = $result['instagram'];
	$id = $_GET['id'];

	$logo = '';
    if(!empty($result['logo'])){
    	$logo = $config['site_url'].'storage/products/'.$result['logo'];
    }else{
    	$logo = $config['site_url'].'storage/products/default.png';
    }

    if(!empty($result['latlong'])){
	    $latlong = explode(',', $result['latlong']);
	    $mapLat = $latlong[0];
	    $mapLong = $latlong[1];
	    if(empty($mapLat) || empty($mapLong)){
	    	$data = get_cityDetail_by_id($city);
			$mapLat = $data['latitude'];
			$mapLong = $data['longitude'];
	    }
	}else{
		$data = get_cityDetail_by_id($city);
		$mapLat = $data['latitude'];
		$mapLong = $data['longitude'];
	}

    $hide_contact = 0;
    if($config['contact_validation'] == '1'){
        if(!checkloggedin()){
            $hide_contact = 1;
        }
    }

    $meta_desc = substr(strip_tags($description),0,150);
	$meta_desc = trim(preg_replace('/\s\s+/', ' ', $meta_desc));

	// get company jobs
	$results = ORM::for_table($config['db']['pre'].'product')
	->where('company_id',$_GET['id'])
	->where('status','active')
	->where('active',1)
	->where('hide','0')
	->find_many();
	$total_job = $results->count();
	$items = array();
	foreach($results as $info){
		$items[$info['id']]['id'] = $info['id'];
        $items[$info['id']]['name'] = $info['product_name'];
        $items[$info['id']]['product_type'] = get_productType_title_by_id($info['product_type']);
        $items[$info['id']]['featured'] = $info['featured'];
        $items[$info['id']]['urgent'] = $info['urgent'];
        $items[$info['id']]['highlight'] = $info['highlight'];

        $salary_min = price_format($info['salary_min'],$info['country']);
        $items[$info['id']]['salary_min'] = $salary_min;
        $salary_max = price_format($info['salary_max'],$info['country']);
        $items[$info['id']]['salary_max'] = $salary_max;

        $cityname = get_cityName_by_id($info['city']);
        $items[$info['id']]['city'] = $cityname;
        $items[$info['id']]['created_at'] = timeAgo($info['created_at']);
        $pro_url = create_slug($info['product_name']);
        $items[$info['id']]['link'] = $config['site_url'].'job/' . $info['id'] . '/'.$pro_url;
	}

	$page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/company-detail.tpl');
	$page->SetParameter ('OVERALL_HEADER', create_header($name,$meta_desc,$logo,true));
	$page->SetLoop ('ITEM', $items);
	$page->SetParameter ('TOTALITEM', $total_job);
	$page->SetParameter ('NAME', $name);
	$page->SetParameter ('LOGO', $logo);
	$page->SetParameter ('DESCRIPTION', $description);
	$page->SetParameter ('CITY', $city);
	$page->SetParameter ('CITYNAME', get_cityName_by_id($city));
	$page->SetParameter ('STATENAME', get_stateName_by_id($result['state']));
	$page->SetParameter ('LOCATION', $location);
	$page->SetParameter ('PHONE', $phone);
	$page->SetParameter ('FAX', $fax);
	$page->SetParameter ('EMAIL', $email);
	$page->SetParameter ('WEBSITE', $website);
	$page->SetParameter ('FACEBOOK', $facebook);
	$page->SetParameter ('TWITTER', $twitter);
	$page->SetParameter ('LINKEDIN', $linkedin);
	$page->SetParameter ('PINTEREST', $pinterest);
	$page->SetParameter ('YOUTUBE', $youtube);
	$page->SetParameter ('INSTAGRAM', $instagram);
	$page->SetParameter ('ID', $id);
	$page->SetParameter ('LATITUDE', $mapLat);
	$page->SetParameter ('LONGITUDE', $mapLong);
    $page->SetParameter ('HIDE_CONTACT', $hide_contact);
	$page->SetParameter ('OVERALL_FOOTER', create_footer());
	$page->CreatePageEcho();

} else {
    error($lang['PAGE_NOT_FOUND'], __LINE__, __FILE__, 1);
    exit;
}

?>
