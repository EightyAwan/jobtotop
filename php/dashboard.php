<?php

if (checkloggedin()) {
    update_lastactive();
    $ses_userdata = get_user_data($_SESSION['user']['username']);

    $author_image = $ses_userdata['image'];
    $username_error = $email_error = $password_error = $type_error = $phone_error = $avatar_error = '';
    $avatarName = null;
    $errors = 0;
    if (isset($_POST['submit'])) {

        if ($_POST["username"] != $_SESSION['user']['username']) {
            if (empty($_POST["username"])) {
                $errors++;
                $username_error = $lang['ENTERUNAME'];
                $username_error = "<span class='status-not-available'> " . $username_error . "</span>";
            } elseif (preg_match('/[^A-Za-z0-9]/', $_POST['username'])) {
                $errors++;
                $username_error = $lang['USERALPHA'];
                $username_error = "<span class='status-not-available'> " . $username_error . " [A-Z,a-z,0-9]</span>";
            } elseif ((strlen($_POST['username']) < 4) OR (strlen($_POST['username']) > 16)) {
                $errors++;
                $username_error = $lang['USERLEN'];
                $username_error = "<span class='status-not-available'> " . $username_error . ".</span>";
            } else {
                $user_count = check_username_exists($_POST["username"]);
                if ($user_count > 0) {
                    $errors++;
                    $username_error = $lang['USERUNAV'];
                    $username_error = "<span class='status-not-available'>" . $username_error . "</span>";
                }
            }
        }

        // Check if this is an Email availability check from signup page using ajax
        if (is_null($_POST["email"])) {
            $errors++;
            $email_error = $lang['ENTEREMAIL'];
            $email_error = "<span class='status-not-available'> " . $email_error . "</span>";
        } elseif ($_POST["email"] != $ses_userdata['email']) {
            $regex = '/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/';

            if (!preg_match($regex, $_POST['email'])) {
                $errors++;
                $email_error = $lang['EMAILINV'];
                $email_error = "<span class='status-not-available'> " . $email_error . ".</span>";
            } else {
                $user_count = check_account_exists($_POST["email"]);
                if ($user_count > 0) {
                    $errors++;
                    $email_error = $lang['ACCAEXIST'];
                    $email_error = "<span class='status-not-available'>" . $email_error . "</span>";
                }
            }
        }

        if (!empty($_POST["gender"])) {
            if (!in_array($_POST["gender"], array('Male', 'Female', 'Other'))) {
                $_POST["gender"] = 'Male';
            }
        }

        if ($errors == 0) {
            if (!empty($_FILES['avatar'])) {
                $file = $_FILES['avatar'];
                // Valid formats
                $valid_formats = array("jpeg", "jpg", "png");
                $filename = $file['name'];
                $ext = getExtension($filename);
                $ext = strtolower($ext);
                if (!empty($filename)) {
                    //File extension check
                    if (in_array($ext, $valid_formats)) {
                        $main_path = ROOTPATH . "/storage/profile/";
                        $filename = uniqid($_SESSION['user']['username'] . '_') . '.' . $ext;
                        if (move_uploaded_file($file['tmp_name'], $main_path . $filename)) {
                            $avatarName = $filename;
                            resizeImage(150, $main_path . $filename, $main_path . $filename);
                            resizeImage(60, $main_path . 'small_' . $filename, $main_path . $filename);
                            if (file_exists($main_path . $author_image) && $author_image != 'default_user.png') {
                                unlink($main_path . $author_image);
                                unlink($main_path . 'small_' . $author_image);
                            }
                        } else {
                            $errors++;
                            $avatar_error = $lang['ERROR_TRY_AGAIN'];
                            $avatar_error = "<span class='status-not-available'>" . $avatar_error . "</span>";
                        }
                    } else {
                        $errors++;
                        $avatar_error = $lang['ONLY_JPG_ALLOW'];
                        $avatar_error = "<span class='status-not-available'>" . $avatar_error . "</span>";
                    }
                }
            }
        }

        if ($errors == 0) {

            $salary_min = $salary_max = 0;
            $dob = null;

            if (!empty($_POST['dob'])) {
                $dob = date("Y-m-d", strtotime($_POST['dob']));
            }

            if (!empty($_POST['salary_min']) or !empty($_POST['salary_max'])) {
                $salary_min = is_numeric($_POST['salary_min']) ? $_POST['salary_min'] : 0;
                $salary_max = is_numeric($_POST['salary_max']) ? $_POST['salary_max'] : 0;
            }

            $city = $_POST['city'];
            $citydata = get_cityDetail_by_id($city);
            $country = $citydata['country_code'];
            $state = $citydata['subadmin1_code'];

            if (empty($_POST['city']) && empty($ses_userdata['country_code'])) {
                $location = getLocationInfoByIp();
                $country = $location['countryCode'];
            }

            $now = date("Y-m-d H:i:s");
            $user_update = ORM::for_table($config['db']['pre'] . 'user')->find_one($_SESSION['user']['id']);
            $user_update->set('name', $_POST['name']);
            $user_update->set('phone', $_POST['phone']);
            $user_update->set('username', $_POST["username"]);
            $user_update->set('email', $_POST["email"]);
            $user_update->set('address', validate_input($_POST["address"]));
            $user_update->set('sex', $_POST["gender"]);
            $user_update->set('tagline', isset($_POST["tagline"]) ? validate_input(strlimiter($_POST["tagline"], 200)) : null);
            $user_update->set('description', addslashes(stripUnwantedTagsAndAttrs($_POST["aboutme"])));
            $user_update->set('website', validate_input($_POST["website"]));
            $user_update->set('facebook', validate_input($_POST["facebook"]));
            $user_update->set('twitter', validate_input($_POST["twitter"]));
            $user_update->set('instagram', validate_input($_POST["instagram"]));
            $user_update->set('linkedin', validate_input($_POST["linkedin"]));
            $user_update->set('youtube', validate_input($_POST["youtube"]));
            $user_update->set('city_code', $city);
            $user_update->set('state_code', $state);
            $user_update->set('country_code', $country);
            $user_update->set('category', isset($_POST["category"]) ? $_POST['category'] : null);
            $user_update->set('subcategory', isset($_POST["subcategory"]) ? $_POST['subcategory'] : null);
            $user_update->set('salary_min', $salary_min);
            $user_update->set('salary_max', $salary_max);
            $user_update->set('dob', $dob);
            $user_update->set('updated_at', $now);
            if ($avatarName) {
                $user_update->set('image', $avatarName);
            }
            $user_update->save();

            $loggedin = get_user_data("", $_SESSION['user']['id']);
            create_user_session($loggedin['id'], $loggedin['username'], $loggedin['password'], $loggedin['user_type']);

            transfer($link['DASHBOARD'], $lang['PROFILE_UPDATED'], $lang['PROFILE_UPDATED']);
            exit;
        }

    } else if (isset($_POST['password-submit'])) {
        if (!empty($_POST["password"]) && !empty($_POST["re_password"])) {
            if ($_POST["password"] != $_POST["re_password"]) {
                $errors++;
                $password_error = "<span class='status-not-available'> " . $lang['PASS_NOT_MATCH'] . ".</span>";
            } elseif ((strlen($_POST['password']) < 5) OR (strlen($_POST['password']) > 21)) {
                $errors++;
                $password_error = "<span class='status-not-available'> " . $lang['PASSLENG'] . ".</span>";
            }

            if ($errors == 0) {
                $now = date("Y-m-d H:i:s");
                $user_update = ORM::for_table($config['db']['pre'] . 'user')->find_one($_SESSION['user']['id']);
                $user_update->set('updated_at', $now);

                $password = $_POST["password"];
                $pass_hash = password_hash($password, PASSWORD_DEFAULT, ['cost' => 13]);

                $user_update->set('password_hash', $pass_hash);

                //$user_update->save();

                $loggedin = get_user_data("", $_SESSION['user']['id']);
                create_user_session($loggedin['id'], $loggedin['username'], $loggedin['password'], $loggedin['user_type']);

                transfer($link['DASHBOARD'], $lang['PROFILE_UPDATED'], $lang['PROFILE_UPDATED']);
                exit;
            }
        }
    } else if (isset($_POST['submit_type'])) {
        $errors = 0;
        if (empty($_POST["user-type"])) {
            $errors++;
            $type_error = "<span class='status-not-available'> " . $lang['SELECT_USER_TYPE'] . "</span>";
        } else {
            if (!in_array($_POST["user-type"], array(1, 2))) {
                $errors++;
                $type_error = "<span class='status-not-available'> " . $lang['INVALID_USER_TYPE'] . "</span>";
            }
        }

        if ($errors == 0) {
            $now = date("Y-m-d H:i:s");
            $user_update = ORM::for_table($config['db']['pre'] . 'user')->find_one($_SESSION['user']['id']);
            if($_POST["user-type"] == 1){
                $user_update->user_type = 'user';
            }else{
                $user_update->user_type = 'employer';
            }
            $user_update->set('updated_at', $now);
            $user_update->save();

            $loggedin = get_user_data("", $_SESSION['user']['id']);
            create_user_session($loggedin['id'], $loggedin['username'], $loggedin['password'], $loggedin['user_type']);

            transfer($link['DASHBOARD'], $lang['PROFILE_UPDATED'], $lang['PROFILE_UPDATED']);
            exit;
        }
    }

    $author_lastactive = date('d M Y H:i', strtotime($ses_userdata['lastactive']));

    $country_code = !empty($ses_userdata['country_code']) ? $ses_userdata['country_code'] : check_user_country();
    $currency_info = set_user_currency($country_code);
    $currency_sign = $currency_info['html_entity'];

    //print_r($ses_userdata);exit();
    // Output to template
    $page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/dashboard.tpl');
    $page->SetParameter('OVERALL_HEADER', create_header($lang['DASHBOARD']));
    $page->SetParameter('RESUBMITADS', resubmited_ads_count($_SESSION['user']['id']));
    $page->SetParameter('HIDDENADS', hidden_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('SAVEDADS', saved_ads_count($_SESSION['user']['id']));
    $page->SetParameter('PENDINGADS', pending_ads_count($_SESSION['user']['id']));
    $page->SetParameter('EXPIREADS', expire_ads_count($_SESSION['user']['id']));
    $page->SetParameter('FAVORITEADS', favorite_ads_count($_SESSION['user']['id']));
    $page->SetParameter('APPLIEDJOBS', applied_jobs_count($_SESSION['user']['id']));
    $page->SetParameter('RESUMES', resumes_count($_SESSION['user']['id']));
    $page->SetParameter('COMPANIES', companies_count($_SESSION['user']['id']));
    $page->SetParameter('MYADS', active_ads_count($_SESSION['user']['id']));
    $page->SetParameter ('FAVORITEUSERSS', favorite_users_count($_SESSION['user']['id']));
    $page->SetParameter('WCHAT', (isset($config['wchat_on_off'])) ? $config['wchat_on_off'] : "");
    $page->SetParameter('AUTHORUNAME', ucfirst($ses_userdata['username']));
    $page->SetParameter('AUTHORNAME', ucfirst($ses_userdata['name']));
    $page->SetParameter('LASTACTIVE', $author_lastactive);
    $page->SetParameter('EMAIL', $ses_userdata['email']);
    $page->SetParameter('PHONE', $ses_userdata['phone']);
    $page->SetParameter('WEBSITE', $ses_userdata['website']);
    $page->SetParameter('FACEBOOK', $ses_userdata['facebook']);
    $page->SetParameter('TWITTER', $ses_userdata['twitter']);
    $page->SetParameter('INSTAGRAM', $ses_userdata['instagram']);
    $page->SetParameter('LINKEDIN', $ses_userdata['linkedin']);
    $page->SetParameter('YOUTUBE', $ses_userdata['youtube']);
    $page->SetParameter('ADDRESS', stripcslashes(nl2br($ses_userdata['address'])));
    $page->SetParameter('GENDER', $ses_userdata['sex']);
    $page->SetParameter('TAGLINE', $ses_userdata['tagline']);
    $page->SetParameter('ABOUTME', $ses_userdata['description']);
    $page->SetParameter('CAT', $ses_userdata['category']);
    $page->SetParameter('SUBCAT', $ses_userdata['subcategory']);
    $page->SetParameter('SALARY_MIN', $ses_userdata['salary_min']);
    $page->SetParameter('SALARY_MAX', $ses_userdata['salary_max']);
    $page->SetParameter('DOB', $ses_userdata['dob']);
    $page->SetParameter('USER_CURRENCY_SIGN', $currency_sign);
    $page->SetParameter('AVATAR', !empty($ses_userdata['image']) ? 'small_' . $ses_userdata['image'] : 'small_default_user.png');
    $page->SetParameter('USER_COUNTRY', $ses_userdata['country']);
    $page->SetParameter('CITY', $ses_userdata['city_code']);
    $page->SetParameter('CITYNAME', get_cityName_by_id($ses_userdata['city_code']));
    $page->SetParameter('STATENAME', get_stateName_by_id($ses_userdata['state_code']));
    $page->SetParameter('USERNAME_ERROR', $username_error);
    $page->SetParameter('EMAIL_ERROR', $email_error);
    $page->SetParameter('PHONE_ERROR', $phone_error);
    $page->SetParameter('TYPE_ERROR', $type_error);
    $page->SetParameter('PASSWORD_ERROR', $password_error);
    $page->SetParameter('AVATAR_ERROR', $avatar_error);
    $page->SetParameter('USER_COUNTRY_CODE', $ses_userdata['country_code']);

    if (check_user_upgrades($_SESSION['user']['id'])) {
        $sub_info = get_user_membership_detail($_SESSION['user']['id']);
        $page->SetParameter('SUB_TITLE', $sub_info['sub_title']);
        $page->SetParameter('SUB_IMAGE', $sub_info['sub_image']);
    } else {
        $page->SetParameter('SUB_TITLE', '');
        $page->SetParameter('SUB_IMAGE', '');
    }
    $page->SetParameter('NOTIFY', $ses_userdata['notify']);
    $page->SetLoop('ERRORS', "");
    $page->SetLoop('CATEGORIES', get_maincategory($ses_userdata['category']));
    $page->SetParameter('OVERALL_FOOTER', create_footer());
    $page->CreatePageEcho();
} else {
    headerRedirect($link['LOGIN']);
}
?>
