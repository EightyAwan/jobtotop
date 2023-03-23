<?php
// if company is disable
if(!$config['company_enable']){
    error($lang['PAGE_NOT_FOUND'], __LINE__, __FILE__, 1);
}
if(checkloggedin())
{
	update_lastactive();
	$ses_userdata = get_user_data($_SESSION['user']['username']);
	if($ses_userdata['user_type'] != 'employer'){
		headerRedirect($link['DASHBOARD']);
	}
	$id = $name = $error = $company_logo = $description = $city = $location = $phone = $fax = $email = $website = $facebook = $twitter = $linkedin = $pinterest = $youtube = $instagram = '';

    $country_code = check_user_country();
	if($latlong = get_lat_long_of_country($country_code)){
	    $mapLat     =  $latlong['lat'];
	    $mapLong    =  $latlong['lng'];
	}else{
	    $mapLat     =  get_option("home_map_latitude");
	    $mapLong    =  get_option("home_map_longitude");
	}

	if(isset($_POST['submit'])){
		if(empty($_POST['name'])){
			$error = $lang['COMPANY_NAME_REQ'];
		}

		if(empty($_POST['company_desc'])){
			$error = $lang['COMPANY_DESC_REQ'];
		}

		$name = $_POST['name'];
		$description = $_POST['company_desc'];
		$city = $_POST['city'];
		$phone = $_POST['phone'];
		$fax = $_POST['fax'];
		$email = $_POST['email'];
		$website = $_POST['website'];
		$facebook = $_POST['facebook'];
		$twitter = $_POST['twitter'];
		$linkedin = $_POST['linkedin'];
		$pinterest = $_POST['pinterest'];
		$youtube = $_POST['youtube'];
		$instagram = $_POST['instagram'];

		$citydata = get_cityDetail_by_id($city);
        $country = $citydata['country_code'];
        $state = $citydata['subadmin1_code'];

		$latlong = '';
        if(isset($_POST['location'])){
            $location = $_POST['location'];
            $mapLat = $_POST['latitude'];
            $mapLong = $_POST['longitude'];
            $latlong = $mapLat . "," . $mapLong;
        }

		if($error == ''){
			if(!empty($_FILES['logo'])){
				$file = $_FILES['logo'];
				// Valid formats
				$valid_formats = array("jpeg", "jpg", "png");
				$filename = $file['name'];
				$ext = getExtension($filename);
				$ext = strtolower($ext);
				if (!empty($filename)) {
	                //File extension check
					if (in_array($ext, $valid_formats)) {
						$main_path = ROOTPATH . "/storage/products/";
						$filename = uniqid(time()).'.'.$ext;
						if(move_uploaded_file($file['tmp_name'], $main_path.$filename)){
							$company_logo = $filename;
							resizeImage(200,$main_path.$filename,$main_path.$filename);
						}else{
							$error = $lang['ERROR_TRY_AGAIN'];
						}
					} else {
						$error = $lang['ONLY_JPG_ALLOW'];
					}
				}
			}
		}

		if($error == ''){
			$now = date("Y-m-d H:i:s");
			if(!empty($_POST['id'])){
				$add_company = ORM::for_table($config['db']['pre'].'companies')
				->where('id',$_POST['id'])
				->where('active',1)
				->where('user_id',$_SESSION['user']['id'])
				->find_one();

				if($add_company){
					if(!empty($company_logo)){
						$add_company->set('logo', $company_logo);
					}
					$add_company->set('name',removeEmailAndPhoneFromString($name));
					$add_company->set('description',validate_input($description));
					$add_company->set('location',$location);
					$add_company->set('city',$city);
					$add_company->set('state',$state);
					$add_company->set('country',$country);
					$add_company->set('latlong',$latlong);
					$add_company->set('phone',$phone);
					$add_company->set('fax',$fax);
					$add_company->set('email',$email);
					$add_company->set('website',$website);
					$add_company->set('facebook',$facebook);
					$add_company->set('twitter',$twitter);
					$add_company->set('linkedin',$linkedin);
					$add_company->set('pinterest',$pinterest);
					$add_company->set('youtube',$youtube);
					$add_company->set('instagram',$instagram);
					
					$add_company->set('updated_at', $now);
					$add_company->save();
				}

				transfer($link['MYCOMPANIES'],$lang['COMPANY_EDITED'],$lang['COMPANY_EDITED']);
			}else{
				$add_company = ORM::for_table($config['db']['pre'].'companies')->create();
				$add_company->name = removeEmailAndPhoneFromString($name);
				$add_company->logo = $company_logo;
				$add_company->description = validate_input($description);
				$add_company->location = $location;
				$add_company->city = $city;
				$add_company->state = $state;
				$add_company->country = $country;
				$add_company->latlong = $latlong;
				$add_company->phone = $phone;
				$add_company->fax = $fax;
				$add_company->email = $email;
				$add_company->website = $website;
				$add_company->facebook = $facebook;
				$add_company->twitter = $twitter;
				$add_company->linkedin = $linkedin;
				$add_company->pinterest = $pinterest;
				$add_company->youtube = $youtube;
				$add_company->instagram = $instagram;
				$add_company->user_id = $_SESSION['user']['id'];
				$add_company->created_at = $now;
				$add_company->updated_at = $now;
				$add_company->save();

				transfer($link['MYCOMPANIES'],$lang['COMPANY_ADDED'],$lang['COMPANY_ADDED']);
			}

			
			exit;
		}
	}

	if(isset($_GET['id'])){
		$result = ORM::for_table($config['db']['pre'].'companies')
		->where('user_id' , $_SESSION['user']['id'])
		->where('id' , $_GET['id'])
		->where('status' , '1')
		->where('active',1)
		->find_one();

		$name = $result['name'];
		$description = stripcslashes(nl2br($result['description']));
		$city = $result['city'];
		$location = $result['location'];
        if(!empty($result['latlong'])){
            $latlong = explode(',', $result['latlong']);
            $mapLat = $latlong[0];
            $mapLong = $latlong[1];
        }
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
	}

	$page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/add-company.tpl');
	$page->SetParameter ('OVERALL_HEADER', create_header($lang['CREATE_COMPANY']));
	$page->SetParameter ('RESUBMITADS', resubmited_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('HIDDENADS', hidden_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('COMPANIES', companies_count($_SESSION['user']['id']));
    $page->SetParameter ('SAVEDADS', saved_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('PENDINGADS', pending_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('EXPIREADS', expire_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('MYADS', active_ads_count($_SESSION['user']['id']));
    $page->SetParameter('WCHAT', (isset($config['wchat_on_off']))? $config['wchat_on_off']:"");
	$page->SetParameter ('NAME', $name);
	$page->SetParameter ('DESCRIPTION', $description);
	$page->SetParameter ('CITY', $city);
	$page->SetParameter ('CITYNAME', get_cityName_by_id($city));
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
	$page->SetParameter ('ERROR', $error);
	$page->SetParameter ('OVERALL_FOOTER', create_footer());
	$page->CreatePageEcho();
}else{
	headerRedirect($link['LOGIN']);
}
?>
