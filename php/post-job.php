<?php
 
if(isset($match['params']['country'])) {
    if ($match['params']['country'] != ""){
        change_user_country($match['params']['country']);
    }
}

if(get_option("post_without_login") == '0'){
    if (!checkloggedin()) {
        headerRedirect($link['LOGIN']."?ref=post-job");
        exit();
    }
}

if (isset($_GET['action'])) {
    if ($_GET['action'] == "post_job") {
        ajax_post_advertise();
    }
}

function check_user_post_limit(){
    global $config,$lang;

    // Get usergroup details
    $group_id = get_user_group();
    // Get membership details
    $group_info = ORM::for_table($config['db']['pre'].'usergroups')
        ->select('ad_limit')
        ->where('group_id', $group_id)
        ->find_one();

    $ad_limit = $group_info['ad_limit'];

    if($ad_limit != "999"){
        $total_user_post = ORM::for_table($config['db']['pre'].'product')
            ->where('user_id', $_SESSION['user']['id'])
            ->count();

        if($total_user_post >= $ad_limit){
            message($lang['NOTIFY'],$lang['POST_LIMIT_EXCEED']);
            exit();
        }
    }
}

if (checkloggedin()) {
    if($_SESSION['user']['user_type'] == 'user'){
        headerRedirect($link['DASHBOARD']);
    }

    if(!$config['non_active_allow']){
        $user_data = get_user_data(null,$_SESSION['user']['id']);
        if($user_data['status'] == 0){
            message($lang['NOTIFY'],$lang['EMAIL_VERIFY_MSG']);
            exit();
        }
    }

    check_user_post_limit();
}



function ajax_post_advertise(){

    global $config, $lang, $link;
    
    
    if(isset($_POST['submit'])) {
        $errors = array();

        if($config['company_enable']) {
            if (empty($_POST['company'])) {
                if (empty($_POST['company_name'])) {
                    //$errors[]['message'] = $lang['COMPANY_NAME_REQ'];
                    $errors[]['message'] = 'comp-select';
                }
                // if (empty($_POST['company_desc'])) {
                //     //$errors[]['message'] = $lang['COMPANY_DESC_REQ'];
                //     $errors[]['message'] = 'comp-desc';
                // }
            }
        }
        // if (empty($_POST['company'])) {
        //             //$errors[]['message'] = $lang['COMPANY_NAME_REQ'];
        //             $errors[]['message'] = 'comp-name';
        //         }
        //if (empty($_POST['catid'])) {
            //$errors[]['message'] = $lang['CAT_REQ'];
            //$errors[]['message'] = 'choose-category';
       // }elseif(!isset($_POST['subcatid'])){
            //$errors[]['message'] = $lang['CAT_REQ'];
         //   $errors[]['message'] = 'choose-category';
        //}elseif(isset($_POST['subcatid']) && $_POST['subcatid'] == ""){
            //$errors[]['message'] = $lang['CAT_REQ'];
           // $errors[]['message'] = 'choose-category';
        //}

        if (empty($_POST['title'])) {
            //$errors[]['message'] = $lang['JOB_TITLE_REQ'];
            $errors[]['message'] = 'p-title';
        }
        if (empty($_POST['content'])) {
            //$errors[]['message'] = $lang['DESC_REQ'];
            $errors[]['message'] = 'p-desc';
        }
        if (empty($_POST['job_type'])) {
            //$errors[]['message'] = $lang['JOB_TYPE_REQ'];
            $errors[]['message'] = 'job-type';
        }
        if (empty($_POST['city'])) {
            //$errors[]['message'] = $lang['CITY_REQ'];
            $errors[]['message'] = 'city';
        }
        if (!empty($_POST['salary_min']) or !empty($_POST['salary_max'])) {
            if (!is_numeric($_POST['salary_min']) or !is_numeric($_POST['salary_max'])) {
                //$errors[]['message'] = $lang['SALARY_MUST_NO'];
            }
        }
        if (!empty($_POST['application_url'])) {
            if (filter_var($_POST['application_url'], FILTER_VALIDATE_URL) === FALSE) {
                //$errors[]['message'] = $lang['APPLICATION_URL_INVALID'];
            }
        }
        /*IF : USER NOT LOGIN THEN CHECK SELLER INFORMATION*/
        if (!checkloggedin()) {
            if(isset($_POST['user_name'])){
                $seller_name = $_POST['user_name'];
                if (empty($seller_name)) {
                    //$errors[]['message'] = $lang['USER_NAME_REQ'];
                    $errors[]['message'] = 'full-name';
                }
            }else{
                //$errors[]['message'] = $lang['USER_NAME_REQ'];
                    $errors[]['message'] = 'full-name';
            }

            if(isset($_POST['user_email'])){
                $seller_email = $_POST['user_email'];

                if (empty($seller_email)) {
                    //$errors[]['message'] = $lang['USER_EMAIL_REQ'];
                    $errors[]['message'] = 'user-email';
                } else {
                    $regex = '/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/';
                    if (!preg_match($regex, $seller_email)) {
                        //$errors[]['message'] = $lang['USER_EMAIL'] . " : " . $lang['EMAILINV'];
                        $errors[]['message'] = 'user-email';
                    }
                }
            }else{
                //$errors[]['message'] = $lang['USER_EMAIL_REQ'];
                $errors[]['message'] = 'user-email';
            }
        }
        /*IF : USER NOT LOGIN THEN CHECK SELLER INFORMATION*/

        /*IF : USER GO TO PEMIUM POST*/
        $urgent = isset($_POST['urgent']) ? 1 : 0;
        $featured = isset($_POST['featured']) ? 1 : 0;
        $highlight = isset($_POST['highlight']) ? 1 : 0;
        //Custom Fields
        $customFee = isset($_POST['customFee']) ? 1 : 0;
        $days = $_POST['days'];
        $cvs = $_POST['cvs'];
        $company_employees = $_POST['company_employees'];
        $company_role = $_POST['company_role'];
        $hear_about_us = $_POST['hear_about_us'];
        $app_receive_type = $_POST['app_receive_type'];
        $comm_email = $_POST['comm_email'];

        $company_logo = null;
        if($config['company_enable']) {
            if (!count($errors) > 0) {
                if (isset($_FILES['company_logo'])) {
                    $file = $_FILES['company_logo'];
                    $valid_formats = array("jpg", "jpeg", "png"); // Valid image formats
                    $filename = $file['name'];
                    $ext = getExtension($filename);
                    $ext = strtolower($ext);
                    if (!empty($filename)) {
                        //File extension check
                        if (in_array($ext, $valid_formats)) {
                            //Valid File extension check
                            $main_path = ROOTPATH . "/storage/products/";
                            $filename = uniqid(time()) . '.' . $ext;
                            move_uploaded_file($file['tmp_name'], $main_path . $filename);
                            // resize image
                            resizeImage(200, $main_path . $filename, $main_path . $filename);
                            $company_logo = $filename;
                        } else {
                            $errors[]['message'] = $lang['ONLY_JPG_ALLOW'];
                        }
                    }

                }
            }
        }

        $job_image = null;
        if($config['job_image_field']) {
            if (!count($errors) > 0) {
                if (isset($_FILES['job_image'])) {
                    $file = $_FILES['job_image'];
                    $valid_formats = array("jpg", "jpeg", "png"); // Valid image formats
                    $filename = $file['name'];
                    $ext = getExtension($filename);
                    $ext = strtolower($ext);
                    if (!empty($filename)) {
                        //File extension check
                        if (in_array($ext, $valid_formats)) {
                            //Valid File extension check
                            $main_path = ROOTPATH . "/storage/products/";
                            $filename = uniqid(time()) . '.' . $ext;
                            move_uploaded_file($file['tmp_name'], $main_path . $filename);
                            // resize image
                            resizeImage(200, $main_path . $filename, $main_path . $filename);
                            $job_image = $filename;
                        } else {
                            $errors[]['message'] = $lang['ONLY_JPG_ALLOW'];
                        }
                    }

                }
            }
        }


        if (!count($errors) > 0) {

            if (!checkloggedin()) {
                $seller_name = $_POST['user_name'];
                $seller_email = $_POST['user_email'];

                $user_count = check_account_exists($seller_email);
                if ($user_count > 0) {
                    $info = ORM::for_table($config['db']['pre'].'user')
                            ->where('email', $seller_email)
                            ->find_one();
                    $json = '{"status" : "email-exist","errors" : "' . $lang['ACCAEXIST'] . '","email" : "' . $seller_email . '","username" : "' . $info['username'] . '","user_type" : "' . $info['user_type'] . '"}';
                    echo $json;
                    die();
                } else {
                    /*Create user account with givern email id*/
                    $created_username = parse_name_from_email($seller_email);
                    //mysql query to select field username if it's equal to the username that we check '
                    $check_username = ORM::for_table($config['db']['pre'].'user')
                        ->select('username')
                        ->where('username', $created_username)
                        ->count();

                    //if number of rows fields is bigger them 0 that means it's NOT available '
                    if ($check_username > 0) {
                        $username = createusernameslug($created_username);
                    } else {
                        $username = $created_username;
                    }
                    $location = getLocationInfoByIp();
                    $confirm_id = get_random_id();
                    $password = get_random_id();
                    $pass_hash = password_hash($password, PASSWORD_DEFAULT, ['cost' => 13]);
                    $now = date("Y-m-d H:i:s");

                    $insert_user = ORM::for_table($config['db']['pre'].'user')->create();
                    $insert_user->status = '0';
                    $insert_user->name = $seller_name;
                    $insert_user->username = $username;
                    $insert_user->password_hash = $pass_hash;
                    $insert_user->email = $seller_email;
                    $insert_user->confirm = $confirm_id;
                    $insert_user->user_type = 'employer';
                    $insert_user->created_at = $now;
                    $insert_user->updated_at = $now;
                    $insert_user->country = $location['country'];
                    $insert_user->city = $location['city'];
                    $insert_user->save();

                    $user_id = $insert_user->id();

                    /*CREATE ACCOUNT CONFIRMATION EMAIL*/
                    email_template("signup_confirm",$user_id);

                    /*SEND ACCOUNT DETAILS EMAIL*/
                    email_template("signup_details",$user_id,$password);

                    $loggedin = userlogin($username, $password);
                    create_user_session($loggedin['id'], $loggedin['username'], $loggedin['password'],$loggedin['user_type']);

                }
            }

            if (checkloggedin()) {

                $salary_type = $_POST['salary_type'];
                $salary_min = !empty($_POST['salary_min']) ? $_POST['salary_min'] : '0';
                $salary_max = !empty($_POST['salary_max']) ? $_POST['salary_max'] : '0';
                $phone = !empty($_POST['phone']) ? $_POST['phone'] : '0';

                $negotiable = isset($_POST['negotiable']) ? '1' : '0';
                $hide_phone = isset($_POST['hide_phone']) ? '1' : '0';
                $cityid = $_POST['city'];

                if($config['post_desc_editor'] == 1)
                    $description = addslashes($_POST['content']);
                else
                    $description = validate_input($_POST['content']);


               /* $citydata = get_cityDetail_by_id($cityid);
                $country = $citydata['country_code'];
                $state = $citydata['subadmin1_code'];
                /*$state = $_POST['state'];*/
                $job_country= $_POST['job_country'];

                $latlong = '';
                if(isset($_POST['location'])){
                    $location = $_POST['location'];
                    $mapLat = $_POST['latitude'];
                    $mapLong = $_POST['longitude'];
                    $latlong = $mapLat . "," . $mapLong;
                }else{
                    $location = '';
                }

                $post_title = removeEmailAndPhoneFromString($_POST['title']);
                $slug = create_post_slug($post_title);

                if(isset($_POST['tags'])){
                    $tags = $_POST['tags'];
                }else{
                    $tags = '';
                }

                if($config['post_auto_approve'] == 1){
                    $status = "active";
                }else{
                    $status = "saved";
                }

                // Get usergroup details
                $group_id = get_user_group();
                // Get membership details
                $group_get_info = get_usergroup_settings($group_id);


                $urgent_project_fee = $group_get_info['urgent_project_fee'];
                $featured_project_fee = $group_get_info['featured_project_fee'];
                $highlight_project_fee = $group_get_info['highlight_project_fee'];

                if(isset($days)){

                    //Check Premium Type
                    if($_POST['make_premium']=='0'){$ad_duration = '30';}else{$ad_duration = $days;}

                }else{
                     $ad_duration = $group_get_info['ad_duration'];
                }
                $timenow = date('Y-m-d H:i:s');
                $expire_time = date('Y-m-d H:i:s', strtotime($timenow . ' +'.$ad_duration.' day'));
                $expire_timestamp = strtotime($expire_time);

                if($config['company_enable']) {
                    if (empty($_POST['company'])) {
                        // save company details
                        $company = ORM::for_table($config['db']['pre'] . 'companies')->create();
                        $company->user_id = $_SESSION['user']['id'];
                        $company->name = removeEmailAndPhoneFromString($_POST['company_name']);
                        if(isset($_POST['company_desc']))
                            $company->description = $_POST['company_desc'];
                        else
                            $company->description = "";
                        $company->logo = $company_logo;
                        $company->created_at = $timenow;
                        $company->updated_at = $timenow;
                        $company->save();
                        $company_id = $company->id();
                    } else {
                        $company_id = $_POST['company'];
                    }
                }else{
                    $company_id = 0;
                }



                $google_map_key = get_option("gmap_api_key");

                $address = $cityid.'+'.$job_country;
                $address = str_replace(" ", "+", $address);
                //Google Map API URL
                $API_KEY = $google_map_key; // Google Map Free API Key
                $url = "https://maps.google.com/maps/api/geocode/json?address=".$address."&key=".$API_KEY."";

                // Send CURL Request
                $ch = curl_init();
                curl_setopt($ch, CURLOPT_URL, $url);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                curl_setopt($ch, CURLOPT_PROXYPORT, 3128);
                curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
                curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
                $response = curl_exec($ch);
                curl_close($ch);
                $returnBody = json_decode($response);

                // Google MAP
                $mapstatus = $returnBody->status;
                if($mapstatus == "REQUEST_DENIED"){
                    $result = $returnBody->error_message;
                } else {
                    $lat = $returnBody->results[0]->geometry->location->lat;
                    $lng = $returnBody->results[0]->geometry->location->lng;
                    $latlong = $lat.','.$lng;
                }

                $item_insrt = ORM::for_table($config['db']['pre'].'product')->create();
                $item_insrt->user_id = $_SESSION['user']['id'];
                $item_insrt->company_id = $company_id;
                $item_insrt->product_name = $post_title;
                $item_insrt->slug = $slug;
                $item_insrt->status = $status;
                //$item_insrt->category = $_POST['catid'];
                //$item_insrt->sub_category = $_POST['subcatid'];
                // defult setup
                $item_insrt->category = '11';
                $item_insrt->sub_category = '5';
                $item_insrt->description = $description;
                $item_insrt->product_type = $_POST['job_type'];
                $item_insrt->salary_min = $salary_min;
                $item_insrt->salary_max = $salary_max;
                $item_insrt->salary_type = $salary_type;
                $item_insrt->negotiable = $negotiable;
                $item_insrt->phone = $phone;
                $item_insrt->hide_phone = $hide_phone;
                $item_insrt->application_url = $_POST['application_url'];
                $item_insrt->location = $_POST['city'];
                $item_insrt->city = $_POST['city'];
                //$item_insrt->state = $state;
                $item_insrt->country = $job_country;
                $item_insrt->latlong = $latlong;
                $item_insrt->screen_shot = $job_image;
                $item_insrt->tag = $tags;
                $item_insrt->created_at = $timenow;
                $item_insrt->updated_at = $timenow;
                $item_insrt->expire_date = $expire_timestamp;
                //Custom Fields
                $item_insrt->pro_days = $days;
                $item_insrt->pro_cvs = $cvs;
                $item_insrt->remaining_cvs = $cvs;
                $item_insrt->company_employees = $company_employees;
                $item_insrt->company_role = $company_role;
                $item_insrt->hear_about_us = $hear_about_us;
                $item_insrt->app_receive_type = $app_receive_type;
                $item_insrt->comm_email = $comm_email;
                
                $item_insrt->save();

                $product_id = $item_insrt->id();

                add_post_customField_data($_POST['catid'], $_POST['subcatid'],$product_id);

                $amount = 0;
                $trans_desc = $lang['PACKAGE'];

                $premium_tpl = "";

                if ($customFee == 1) {
                    $amount = $amount + $_POST['customFee'];
                    $trans_desc = $trans_desc ." Custom Package with (".$days." days & ".$cvs." employees)";
                    $premium_tpl .= ' <div class="ModalPayment-paymentDetails">
                                            <div class="ModalPayment-label">Custom Package</div>
                                            <div class="ModalPayment-price">
                                                <span class="ModalPayment-totalCost-price">'.$config['currency_sign'].$customFee.'</span>
                                            </div>
                                        </div>';
                }
                if ($featured == 1) {
                    $amount = $amount + $featured_project_fee;
                    $trans_desc = $trans_desc ." ". $lang['FEATURED'];
                    $premium_tpl .= ' <div class="ModalPayment-paymentDetails">
                                            <div class="ModalPayment-label">'.$lang['FEATURED'].'</div>
                                            <div class="ModalPayment-price">
                                                <span class="ModalPayment-totalCost-price">'.$config['currency_sign'].$featured_project_fee.'</span>
                                            </div>
                                        </div>';
                }
                if ($urgent == 1) {
                    $amount = $amount + $urgent_project_fee;
                    $trans_desc = $trans_desc ." ". $lang['URGENT'];
                    $premium_tpl .= ' <div class="ModalPayment-paymentDetails">
                                            <div class="ModalPayment-label">'.$lang['URGENT'].'</div>
                                            <div class="ModalPayment-price">
                                                <span class="ModalPayment-totalCost-price">'.$config['currency_sign'].$urgent_project_fee.'</span>
                                            </div>
                                        </div>';
                }
                if ($highlight == 1) {
                    $amount = $amount + $highlight_project_fee;
                    $trans_desc = $trans_desc ." ". $lang['HIGHLIGHT'];
                    $premium_tpl .= ' <div class="ModalPayment-paymentDetails">
                                            <div class="ModalPayment-label">'.$lang['HIGHLIGHT'].'</div>
                                            <div class="ModalPayment-price">
                                                <span class="ModalPayment-totalCost-price">'.$config['currency_sign'].$highlight_project_fee.'</span>
                                            </div>
                                        </div>';
                }
                
                
                if ($amount > 0) {
                //print_r($amount);exit();
                    $premium_tpl .= '<div class="ModalPayment-totalCost">
                                            <span class="ModalPayment-totalCost-label">'.$lang['TOTAL'].': </span>
                                            <span class="ModalPayment-totalCost-price">'.$config['currency_sign'].$amount." ".$config['currency_code'].'</span>
                                        </div>';

                    /*These details save in session and get on payment sucecess*/
                    $title = $post_title;
                    $payment_type = "premium";
                    $access_token = uniqid();
                    
                    unset($_SESSION['PAYMENT']);
                    $_SESSION['PAYMENT'] = '';
                    
                    $new_amount = (5 / 100) * $amount;
                    
                    
                    $percentage  = $new_amount;
                    
                    
                    $_SESSION['quickad'][$access_token]['name'] = $title;
                    $_SESSION['quickad'][$access_token]['amount'] = $amount;
                    $_SESSION['quickad'][$access_token]['percentage_amount'] = $percentage;
                    $_SESSION['quickad'][$access_token]['total_amount'] = $amount + $percentage;
                    $_SESSION['quickad'][$access_token]['payment_type'] = $payment_type;
                    $_SESSION['quickad'][$access_token]['trans_desc'] = $trans_desc;
                    $_SESSION['quickad'][$access_token]['product_id'] = $product_id;
                    $_SESSION['quickad'][$access_token]['featured'] = $featured;
                    $_SESSION['quickad'][$access_token]['urgent'] = $urgent;
                    $_SESSION['quickad'][$access_token]['highlight'] = $highlight;
                    /*End These details save in session and get on payment sucecess*/

                    $ad_link = $link['POST-REVIEW'] . "/" . $product_id;
                    $url = $link['PAYMENT']."/" . $access_token;
                    $_SESSION['PAYMENT'] = $url;
                    $response = array();
                    $response['status'] = "success";
                    $response['ad_type'] = "package";
                    $response['redirect'] = $ad_link;
                    $response['tpl'] = $premium_tpl;
                    unset($_POST);
                    echo json_encode($response, JSON_UNESCAPED_SLASHES);
                    die();
                } else {
                    
                    unset($_POST);
                    $ad_link = $link['POST-REVIEW'] . "/" . $product_id;

                    $json = '{"status" : "success","ad_type" : "free","redirect" : "' . $ad_link . '"}';
                    echo $json;
                    die();
                }
            }
            else {
                $status = "error";
                $errors[]['message'] = $lang['POST_SAVE_ERROR'];
            }


        } else {
            $status = "error";
        }

        $json = '{"status" : "' . $status . '","errors" : ' . json_encode($errors, JSON_UNESCAPED_SLASHES) . '}';
        echo $json;
        die();
    }
}


if(isset($_GET['country'])) {
    if ($_GET['country'] != ""){
        change_user_country($_GET['country']);
    }
}

$country_code = check_user_country();
$currency_info = set_user_currency($country_code);
$phone_code_info = set_user_phCode($country_code);
$currency_sign = $currency_info['html_entity'];

if($latlong = get_lat_long_of_country($country_code)){
    $mapLat     =  $latlong['lat'];
    $mapLong    =  $latlong['lng'];
}else{
    $mapLat     =  get_option("home_map_latitude");
    $mapLong    =  get_option("home_map_longitude");
}

$custom_fields = get_customFields_by_catid();

// get job types
$rows = ORM::for_table($config['db']['pre'].'product_type')
        ->where('active', '1')
        ->order_by_asc('position')
        ->find_many();
$post_types = array();
foreach($rows as $row){
    $post_types[$row['id']]['id'] = $row['id'];
    $post_types[$row['id']]['title'] = get_productType_title_by_id($row['id']);
}

$rows = ORM::for_table($config['db']['pre'].'salary_type')
        ->where('active', '1')
        ->order_by_asc('position')
        ->find_many();

// Modify the order of the rows array
$temp = $rows[2];
$rows[2] = $rows[0];
$rows[0] = $temp;

// Build the salary_types array
$salary_types = array();
foreach($rows as $row){
    $salary_types[$row['id']]['id'] = $row['id'];
    $salary_types[$row['id']]['title'] = get_salaryType_title_by_id($row['id']);
}


// get companies
$companies = array();
if(isset($_SESSION['user']['id'])) {
    $rows = ORM::for_table($config['db']['pre'] . 'companies')
        ->where('user_id', $_SESSION['user']['id'])
        ->where('status', '1')
        ->where('active',1)
        ->find_many();
    foreach ($rows as $row) {
        $companies[$row['id']]['id'] = $row['id'];
        $companies[$row['id']]['title'] = $row['name'];
    }
}
$states = array();
    $rows = ORM::for_table($config['db']['pre'] . 'subadmin1')
        ->where('country_code', $country_code)
        ->where('active',1)
        ->order_by_asc('asciiname')
        ->find_many();
    foreach ($rows as $row) {
        $states[$row['id']]['code'] = $row['id'];
        $states[$row['id']]['name'] = $row['asciiname'];
    }
// Output to template
$page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/post-job.tpl');
$page->SetParameter ('OVERALL_HEADER', create_header($lang['POST_JOB']));
$page->SetLoop ('COUNTRYLIST',get_country_list());
$page->SetLoop ('CATEGORY',get_maincategory());
$page->SetLoop ('POSTTYPES',$post_types);
$page->SetLoop ('SALARYTYPES',$salary_types);
$page->SetLoop ('COMPANIES',$companies);
$page->SetLoop ('STATES',$states);
$page->SetLoop ('CUSTOMFIELDS',$custom_fields);
$page->SetParameter ('SHOWCUSTOMFIELD', (count($custom_fields) > 0) ? 1 : 0);
$page->SetParameter ('LATITUDE', $mapLat);
$page->SetParameter ('LONGITUDE', $mapLong);
$page->SetParameter ('USER_COUNTRY', strtolower($country_code));
$page->SetParameter ('USER_COUNTRY_LOCAL', strtoupper($country_code));
$page->SetParameter ('USER_CURRENCY_SIGN', $currency_sign);
$page->SetParameter ('USER_PHONE_CODE', $phone_code_info);


if(checkloggedin()) {
    // Get usergroup details
    $group_id = get_user_group();
    if($group_id > 0) {
        $group_get_info = get_usergroup_settings($group_id);
    }else{
        $group_get_info = get_usergroup_settings(1);
    }
}else{
    $group_get_info = get_usergroup_settings(1);
}

$urgent_project_fee = $group_get_info['urgent_project_fee'];
$featured_project_fee = $group_get_info['featured_project_fee'];
$highlight_project_fee = $group_get_info['highlight_project_fee'];
$urgent_duration = $group_get_info['urgent_duration'];
$featured_duration = $group_get_info['featured_duration'];
$highlight_duration = $group_get_info['highlight_duration'];

$page->SetParameter('FEATURED_FEE', $featured_project_fee);
$page->SetParameter('URGENT_FEE', $urgent_project_fee);
$page->SetParameter('HIGHLIGHT_FEE', $highlight_project_fee);
$page->SetParameter('FEATURED_DURATION', $featured_duration);
$page->SetParameter('URGENT_DURATION', $urgent_duration);
$page->SetParameter('HIGHLIGHT_DURATION', $highlight_duration);
$page->SetParameter('LANGUAGE_DIRECTION', get_current_lang_direction());
$page->SetParameter ('OVERALL_FOOTER', create_footer());
$page->CreatePageEcho();
?>
