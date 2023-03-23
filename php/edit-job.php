<?php

if(isset($match['params']['country'])) {
    if ($match['params']['country'] != ""){
        change_user_country($match['params']['country']);
    }
}

if (isset($_GET['action'])) {
    if ($_GET['action'] == "edit_ad") {
        ajax_edit_advertise();
    }
}

function ajax_edit_advertise(){

    global $config, $lang, $link;
    $item_screen = "";
    if (!checkloggedin()) {
        return false;
    }

    if(!check_valid_author($_POST['product_id'])){
        return false;
    }

    if(isset($_POST['submit'])) {
        $errors = array();

        if (empty($_POST['company'])) {
            if (empty($_POST['company_name'])) {
                $errors[]['message'] = $lang['COMPANY_NAME_REQ'];
            }

            if (empty($_POST['company_desc'])) {
                $errors[]['message'] = $lang['COMPANY_DESC_REQ'];
            }
        }

        // if (empty($_POST['catid'])) {
        //     $errors[]['message'] = $lang['CAT_REQ'];
        // }elseif(!isset($_POST['subcatid'])){
        //     $errors[]['message'] = $lang['CAT_REQ'];
        // }elseif(isset($_POST['subcatid']) && $_POST['subcatid'] == ""){
        //     $errors[]['message'] = $lang['CAT_REQ'];
        // }

        if (empty($_POST['title'])) {
            $errors[]['message'] = $lang['ADTITLE_REQ'];
        }
        if (empty($_POST['content'])) {
            $errors[]['message'] = $lang['DESC_REQ'];
        }
        if (empty($_POST['city'])) {
            $errors[]['message'] = $lang['CITY_REQ'];
        }
        if (!empty($_POST['salary_min']) or !empty($_POST['salary_max'])) {
            if (!is_numeric($_POST['salary_min']) or !is_numeric($_POST['salary_max'])) {
                $errors[]['message'] = $lang['SALARY_MUST_NO'];
            }
        }
        if (!empty($_POST['application_url'])) {
            if (filter_var($_POST['application_url'], FILTER_VALIDATE_URL) === FALSE) {
                $errors[]['message'] = $lang['APPLICATION_URL_INVALID'];
            }
        }
        // if (empty($_POST['comments'])) {
        //     $errors[]['message'] = $lang['COMMENT_PLACEHOLDER'];
        // }

        /*IF : USER GO TO PEMIUM POST*/
        $urgent = isset($_POST['urgent']) ? 1 : 0;
        $featured = isset($_POST['featured']) ? 1 : 0;
        $highlight = isset($_POST['highlight']) ? 1 : 0;
        //Custom Fields
        $customFee = isset($_POST['customFee']) ? 1 : 0;
        $days = $_POST['ad_days'];
        $cvs = $_POST['cvs'];
        $company_employees = $_POST['company_employees'];
        $company_role = $_POST['company_role'];
        $hear_about_us = $_POST['hear_about_us'];
        $app_receive_type = $_POST['app_receive_type'];
        $comm_email = $_POST['comm_email'];

        /*$payment_req = "";
        if (isset($_POST['urgent'])) {
            if (!isset($_POST['payment_id'])) {
                $payment_req = $lang['PAYMENT_METHOD_REQ'];
            }
        }
        if (isset($_POST['featured'])) {
            if (!isset($_POST['payment_id'])) {
                $payment_req = $lang['PAYMENT_METHOD_REQ'];
            }
        }
        if (isset($_POST['highlight'])) {
            if (!isset($_POST['payment_id'])) {
                $payment_req = $lang['PAYMENT_METHOD_REQ'];
            }
        }
        if (!empty($payment_req))
            $errors[]['message'] = $payment_req;*/

        /*IF : USER GO TO PREMIUM POST*/

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
            if (checkloggedin()) {
                $salary_min = $_POST['salary_min'];
                $salary_max = $_POST['salary_max'];
                $salary_type = $_POST['salary_type'];
                $phone = $_POST['phone'];
                $salary_min = !empty($_POST['salary_min']) ? $_POST['salary_min'] : '0';
                $salary_max = !empty($_POST['salary_max']) ? $_POST['salary_max'] : '0';
                $phone = !empty($_POST['phone']) ? $_POST['phone'] : '0'; 

                $negotiable = isset($_POST['negotiable']) ? '1' : '0';
                $hide_phone = isset($_POST['hide_phone']) ? '1' : '0';
                $cityid = $_POST['city'];
                $job_country= $_POST['job_country'];
                $zip = $_POST['zip_code'];

                if($config['post_desc_editor'] == 1)
                    $description = addslashes($_POST['content']);
                else
                    $description = validate_input($_POST['content']);

                $timenow = date('Y-m-d H:i:s');
                $citydata = get_cityDetail_by_id($cityid);
                $country = $citydata['country_code'];
                $state = $citydata['subadmin1_code'];

                if(isset($_POST['tags'])){
                    $tags = $_POST['tags'];
                }else{
                    $tags = '';
                }

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

                $info = ORM::for_table($config['db']['pre'].'product')
                    ->select('status')
                    ->find_one($_POST['product_id']);

                $item_status = $info['status'];

                if($config['company_enable']) {
                    if (empty($_POST['company'])) {
                        // save company details
                        $company = ORM::for_table($config['db']['pre'] . 'companies')->create();
                        $company->user_id = $_SESSION['user']['id'];
                        $company->name = removeEmailAndPhoneFromString($_POST['company_name']);
                        $company->description = validate_input($_POST['company_desc']);
                        $company->logo = $company_logo;
                        $company->save();
                        $company_id = $company->id();
                    } else {
                        $company_id = $_POST['company'];
                    }
                }else{
                    $company_id = 0;
                }

                if($item_status == "pending" or $config['post_auto_approve'] == 1)
                {

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

                    $item_edit = ORM::for_table($config['db']['pre'].'product')->find_one($_POST['product_id']);
                    $item_edit->set('company_id', $company_id);
                    $item_edit->set('product_name', $post_title);
                    $item_edit->set('slug', $slug);
                   // $item_edit->set('category', $_POST['catid']);
                   // $item_edit->set('sub_category', $_POST['subcatid']);
                   // defult setup
                    $item_edit->set('category', '11');
                    $item_edit->set('sub_category', '5');
                    $item_edit->set('description', $description);
                    $item_edit->set('product_type', $_POST['job_type']);
                    $item_edit->set('negotiable', $negotiable);
                    $item_edit->set('salary_min', $salary_min);
                    $item_edit->set('salary_max', $salary_max);
                    $item_edit->set('salary_type', $salary_type);
                    $item_edit->set('phone', $phone);
                    $item_edit->set('hide_phone', $hide_phone);
                    $item_edit->set('application_url', $_POST['application_url']);
                    $item_edit->set('location', $cityid);
                    $item_edit->set('city', $cityid);
                    //$item_edit->set('state', $state);
                    $item_edit->set('country', $job_country);
                    $item_edit->set('latlong', $latlong);
                    $item_edit->set('tag', $tags);
                    $item_edit->set('screen_shot', $job_image);
                    $item_edit->set('updated_at', $timenow);
                    //Custom Fields
                    $item_edit->set('pro_days', $days);
                    $item_edit->set('pro_cvs', $cvs);
                    $item_edit->set('remaining_cvs', $cvs);
                    $item_edit->set('company_employees', $company_employees);
                    $item_edit->set('company_role', $company_role);
                    $item_edit->set('hear_about_us', $hear_about_us);
                    $item_edit->set('app_receive_type', $app_receive_type);
                    $item_edit->set('comm_email', $comm_email);
                    $item_edit->set('zip', $zip);
                    $item_edit->save();
                }
                elseif($item_status == "saved" or $config['post_auto_approve'] == 1)
                {
                    $item_edit = ORM::for_table($config['db']['pre'].'product')->find_one($_POST['product_id']);
                    $item_edit->set('company_id', $company_id);
                    $item_edit->set('product_name', $post_title);
                    $item_edit->set('slug', $slug);
                    $item_edit->set('category', $_POST['catid']);
                    $item_edit->set('sub_category', $_POST['subcatid']);
                    $item_edit->set('description', $description);
                    $item_edit->set('product_type', $_POST['job_type']);
                    $item_edit->set('negotiable', $negotiable);
                    $item_edit->set('salary_min', $salary_min);
                    $item_edit->set('salary_max', $salary_max);
                    $item_edit->set('salary_type', $salary_type);
                    $item_edit->set('phone', $phone);
                    $item_edit->set('hide_phone', $hide_phone);
                    $item_edit->set('application_url', $_POST['application_url']);
                    $item_edit->set('location', $location);
                    $item_edit->set('city', $cityid);
                    $item_edit->set('state', $state);
                    $item_edit->set('country', $country);
                    $item_edit->set('latlong', $latlong);
                    $item_edit->set('tag', $tags);
                    $item_edit->set('screen_shot', $job_image);
                    $item_edit->set('updated_at', $timenow);
                    //Custom Fields
                    $item_edit->set('status', 'pending');
                    $item_edit->set('pro_days', $days);
                    $item_edit->set('pro_cvs', $cvs);
                    $item_edit->set('remaining_cvs', $cvs);
                    $item_edit->set('company_employees', $company_employees);
                    $item_edit->set('company_role', $company_role);
                    $item_edit->set('hear_about_us', $hear_about_us);
                    $item_edit->set('app_receive_type', $app_receive_type);
                    $item_edit->set('comm_email', $comm_email);
                    $item_edit->set('zip', $zip);
                    $item_edit->save();
                }
                elseif($item_status == "active" or $item_status == "softreject" or $item_status == "expire")
                {
                    $item_insrt = ORM::for_table($config['db']['pre'].'product_resubmit')->create();
                    $item_insrt->product_id = $_POST['product_id'];
                    $item_insrt->user_id = $_SESSION['user']['id'];
                    $item_insrt->company_id = $company_id;
                    $item_insrt->product_name = $post_title;
                    $item_insrt->category = $_POST['catid'];
                    $item_insrt->sub_category = $_POST['subcatid'];
                    $item_insrt->description = $description;
                    $item_insrt->product_type = $_POST['job_type'];
                    $item_insrt->salary_min = $salary_min;
                    $item_insrt->salary_max = $salary_max;
                    $item_insrt->salary_type = $salary_type;
                    $item_insrt->negotiable = $negotiable;
                    $item_insrt->phone = $phone;
                    $item_insrt->hide_phone = $hide_phone;
                    $item_insrt->application_url = $_POST['application_url'];
                    $item_insrt->location = $location;
                    $item_insrt->city = $_POST['city'];
                    $item_insrt->state = $state;
                    $item_insrt->country = $country;
                    $item_insrt->latlong = $latlong;
                    $item_insrt->tag = $tags;
                    $item_insrt->screen_shot = $job_image;
                    $item_insrt->created_at = $timenow;
                    $item_insrt->comments = validate_input($_POST['comments']);
                    //Custom Fields
                    $item_insrt->pro_days = $days;
                    $item_insrt->pro_cvs = $cvs;
                    $item_insrt->remaining_cvs = $cvs;
                    $item_insrt->company_employees = $company_employees;
                    $item_insrt->company_role = $company_role;
                    $item_insrt->hear_about_us = $hear_about_us;
                    $item_insrt->app_receive_type = $app_receive_type;
                    $item_insrt->comm_email = $comm_email;
                    $item_insrt->zip = $zip;
                    $item_insrt->save();
                }

                $product_id = $_POST['product_id'];

                add_post_customField_data($_POST['catid'], $_POST['subcatid'],$product_id);

                $amount = 0;
                $trans_desc = $lang['PACKAGE'];

                // Get usergroup details
                $group_id = get_user_group();
                if($group_id > 0) {
                    // Get membership details
                    $group_get_info = get_usergroup_settings($group_id);
                }else{
                    $group_get_info = get_usergroup_settings(1);
                }
                $urgent_project_fee = $group_get_info['urgent_project_fee'];
                $featured_project_fee = $group_get_info['featured_project_fee'];
                $highlight_project_fee = $group_get_info['highlight_project_fee'];
                $urgent_duration = $group_get_info['urgent_duration'];
                $featured_duration = $group_get_info['featured_duration'];
                $highlight_duration = $group_get_info['highlight_duration'];
                $premium_tpl = "";
                // $_POST['customFee'];
                //$amount = $amount + $_POST['customFee'];
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
                    $amount =  $amount + $featured_project_fee;
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
                
                if ($amount != 0) {
                    
                    $premium_tpl .= ' <div class="ModalPayment-totalCost">
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
                    //$_SESSION['quickad'][$access_token]['amount'];
                    echo json_encode($response);
                    //echo $amount."SD2";
                   
                    
                    unset($_POST);
                    //$json = '{"status" : "success","ad_type" : "package","redirect" : "' . $ad_link . '","tpl" : "'.$premium_tpl.'"}';
                    //echo $json;
                    
                    //$_SESSION['RESP'] = $_SESSION['PAYMENT']."<br>".$ad_link;
                    die();
                } else {
                    unset($_POST);
                    unset($_SESSION['PAYMENT']);
                    $_SESSION['PAYMENT'] = '';
                    $ad_link = $link['POST-REVIEW'] . "/" . $product_id;
                    $_SESSION['RESP'] = $_SESSION['PAYMENT']."<br>".$ad_link;

                    $json = '{"status" : "success","ad_type" : "free","redirect" : "' . $ad_link . '"}';
                    echo $json;
                    die();
                }
            } else {
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

if(checkloggedin()) {

    $status = check_item_status($_GET['id']);

    $header_text = "";
    $header_note = "";
    $resubmit = "";
    if($status == "pending" OR $status == "saved" ){
        $header_text = $lang['EDIT_JOB'];
        $resubmit = 0;
    }
    elseif($status == "active" or $status == "softreject" or $status == "hide" or $status == "expire")
    {
        if(check_valid_resubmission($_GET['id'])){
            $header_text = $lang['RE_SUBISSION'];
            $header_note = $lang['RE_SUBISSION_TEXT'];
            $resubmit = 1;
        }else{
            message($lang['ALREADY_EXIST'],$lang['RESUMIT_EXIST_TEXT'],'',false);
            exit;
        }

    }else {
        error($lang['PAGE_NOT_FOUND'], __LINE__, __FILE__, 1);
        exit;
    }


    if(check_valid_author($_GET['id'])){

        global $errors, $custom_fields, $catid,$catName, $subcatid,$subcatName, $title, $description, $negotiable, $phone, $hide_phone, $tags, $cityid, $mapLat, $mapLong, $seller_name, $seller_email;

        if(isset($_GET['country'])) {
            if ($_GET['country'] != ""){
                change_user_country($_GET['country']);
            }
        }

        $country_code = check_user_country();

        $currency_info = set_user_currency($country_code);
        $currency_sign = $currency_info['html_entity'];

        $info = ORM::for_table($config['db']['pre'].'product')->find_one($_GET['id']);
        $total[0] = count($info);
        if ($total[0] > 0) {
            // output data of each row
            $item_id = $info['id'];
            $company_id = $info['company_id'];
            $catid          = $info['category'];
            $subcatid       = $info['sub_category'];
            $title          = $info['product_name'];
            $description    = stripcslashes(nl2br($info['description']));
            $item_product_type = $info['product_type'];
            $item_salary_type = $info['salary_type'];
            $item_salary_min = !empty($info['salary_min'])?$info['salary_min']:'';
            $item_salary_max = !empty($info['salary_max'])?$info['salary_max']:'';
            $phone          = !empty($info['phone'])?$info['phone']:'';
            $negotiable     = $info['negotiable'];
            $hide_phone     = $info['hide_phone'];
            $item_application_url = $info['application_url'];
            $tags           = $info['tag'];
            $cityid         = $info['city'];
            //Custom Fields
            $stateid         = $info['state'];
            $zip         = $info['zip'];
            
            $location = $info['location'];
            $latlong = $info['latlong'];
            $map = explode(',', $latlong);
            $mapLat = $map[0];
            $mapLong = $map[1];

            $item_featured = $info['featured'];
            $item_urgent = $info['urgent'];
            $item_highlight = $info['highlight'];
            
            //Custom Fields
            
            $days = $info['pro_days'];
            $cvs = $info['pro_cvs'];
            $company_employees = $info['company_employees'];
            $company_role = $info['company_role'];
            $hear_about_us = $info['hear_about_us'];
            $app_receive_type = $info['app_receive_type'];
            $comm_email = $info['comm_email'];
            

            $maincat = get_maincat_by_id($catid);
            $catName = $maincat['cat_name'];
            $subcat = get_subcat_by_id($subcatid);
            $subcatName = $subcat['sub_cat_name'];

            $custom_fields = array();
            $custom_data = array();

            $customdata = ORM::for_table($config['db']['pre'].'custom_data')
                ->select_many('field_id','field_data')
                ->where('product_id',$item_id)
                ->find_many();

            foreach ($customdata as $array){
                $custom_fields[] = $array['field_id'];
                $custom_data[] = $array['field_data'];
            }

            $custom_fields = get_customFields_by_catid($catid, $subcatid,false, $custom_fields, $custom_data);

            foreach ($custom_fields as $key => $value) {
                if ($value['userent']) {
                    $custom_db_fields[$value['id']] = $value['title'];
                    $custom_db_data[$value['id']] = str_replace(',', '&#44;', $value['default']);
                }
            }


            // Get usergroup details
            $group_id = get_user_group();
            if($group_id > 0) {
                // Get membership details
                $group_get_info = get_usergroup_settings($group_id);
            }else{
                $group_get_info = get_usergroup_settings(1);
            }
            $urgent_project_fee = $group_get_info['urgent_project_fee'];
            $featured_project_fee = $group_get_info['featured_project_fee'];
            $highlight_project_fee = $group_get_info['highlight_project_fee'];
            $urgent_duration = $group_get_info['urgent_duration'];
            $featured_duration = $group_get_info['featured_duration'];
            $highlight_duration = $group_get_info['highlight_duration'];

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

            // get salary types
            $rows = ORM::for_table($config['db']['pre'].'salary_type')
                    ->where('active', '1')
                    ->order_by_asc('position')
                    ->find_many();
            $salary_types = array();
            foreach($rows as $row){
                $salary_types[$row['id']]['id'] = $row['id'];
                $salary_types[$row['id']]['title'] = get_salaryType_title_by_id($row['id']);
            }

            // get companies
            $rows = ORM::for_table($config['db']['pre'].'companies')
                    ->where('user_id', $_SESSION['user']['id'])
                    ->where('status', '1')
                    ->find_many();
            $companies = array();
            foreach($rows as $row){
                $companies[$row['id']]['id'] = $row['id'];
                $companies[$row['id']]['title'] = $row['name'];
            }

            // Output to template
            $page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/edit-job.tpl');
            $page->SetParameter ('OVERALL_HEADER', create_header($header_text));
            $page->SetParameter('RESPONSE', $resp);
            $page->SetParameter('ITEM_ID', $item_id);
            $page->SetLoop ('HTMLPAGE', get_html_pages());
            $page->SetLoop ('COUNTRYLIST',get_country_list());
            $page->SetLoop ('CATEGORY',get_maincategory($catid));
            $page->SetLoop ('SUBCATEGORY',get_subcat_of_maincat($catid,false,$subcatid));
            $page->SetLoop ('POSTTYPES',$post_types);
            $page->SetLoop ('SALARYTYPES',$salary_types);
            $page->SetLoop ('COMPANIES',$companies);
            $page->SetLoop ('CUSTOMFIELDS',$custom_fields);
            $page->SetParameter ('SHOWCUSTOMFIELD', (count($custom_fields) > 0) ? 1 : 0);
            $page->SetParameter ('CATID', $catid);
            $page->SetParameter ('SUBCATID', (int)$subcatid);
            $page->SetParameter ('CATEGORY', $catName);
            $page->SetParameter ('SUBCATEGORY', $subcatName);
            $page->SetParameter ('COMPANY_ID', $company_id);
            $page->SetParameter ('TITLE', $title);
            $page->SetParameter ('DESCRIPTION', $description);
            $page->SetParameter ('PRODUCT_TYPE', $item_product_type);
            $page->SetParameter ('SALARY_TYPE', $item_salary_type);
            $page->SetParameter ('SALARY_MIN', $item_salary_min);
            $page->SetParameter ('SALARY_MAX', $item_salary_max);
            $page->SetParameter ('PHONE', $phone);
            $page->SetParameter ('NEGOTIABLE', $negotiable);
            $page->SetParameter ('HIDEPHONE', $hide_phone);
            $page->SetParameter ('APPLICATION_URL', $item_application_url);
            $page->SetParameter ('TAGS', $tags);
            $page->SetParameter ('CITY', $cityid);
            $page->SetParameter ('CITYNAME', get_cityName_by_id($cityid));
            //Custom Fields
            $page->SetParameter ('STATE', $stateid);
            $page->SetParameter ('STATENAME', get_stateName_by_id($stateid));
            $page->SetParameter ('ZIP', $zip);
            
            $page->SetParameter ('LOCATION', $location);
            $page->SetParameter ('LATITUDE', $mapLat);
            $page->SetParameter ('LONGITUDE', $mapLong);
            $page->SetParameter ('USER_COUNTRY', strtolower($country_code));
            $page->SetParameter ('USER_COUNTRY_LOCAL', strtoupper($country_code));
            $page->SetParameter ('SELLER_NAME', $seller_name);
            $page->SetParameter ('SELLER_EMAIL', $seller_email);
            $page->SetParameter ('USER_CURRENCY_SIGN', $currency_sign);
            $page->SetParameter('HEADER_TEXT', $header_text);
            $page->SetParameter('HEADER_NOTE', $header_note);
            $page->SetParameter('RESUBMIT', $resubmit);
            $page->SetParameter('FEATURED', $item_featured);
            $page->SetParameter('URGENT', $item_urgent);
            $page->SetParameter('HIGHLIGHT', $item_highlight);
            $page->SetParameter('FEATURED_FEE', $featured_project_fee);
            $page->SetParameter('URGENT_FEE', $urgent_project_fee);
            $page->SetParameter('HIGHLIGHT_FEE', $highlight_project_fee);
            $page->SetParameter('FEATURED_DURATION', $featured_duration);
            $page->SetParameter('URGENT_DURATION', $urgent_duration);
            $page->SetParameter('HIGHLIGHT_DURATION', $highlight_duration);
            //Custom Fields
            
            $page->SetParameter('PRO_DAYS', $days);
            $page->SetParameter('PRO_CVS', $cvs);
            $page->SetParameter('COMPANY_EMPLOYEES', $company_employees);
            $page->SetParameter('COMPANY_ROLE', $company_role);
            $page->SetParameter('HEAR_ABOUT_US', $hear_about_us);
            $page->SetParameter('APP_RECEIVE_TYPE', $app_receive_type);
            $page->SetParameter('COMM_EMAIL', $comm_email);
            
            $page->SetParameter ('PAGE_TITLE', $lang['POST_JOB']);
            $page->SetParameter('LANGUAGE_DIRECTION', get_current_lang_direction());
            $page->SetParameter ('OVERALL_FOOTER', create_footer());
            $page->CreatePageEcho();
        }
        else {
            error($lang['PAGE_NOT_FOUND'], __LINE__, __FILE__, 1);
            exit;
        }


    }
    else{
        error($lang['PAGE_NOT_FOUND'], __LINE__, __FILE__, 1);
        exit;
    }
}
else{
    header("Location: ".$config['site_url']."login?ref=dashboard");
    exit();
}
?>
