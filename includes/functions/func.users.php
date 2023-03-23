<?php
$config['lang'] = check_user_lang();
$config['lang_code'] = get_current_lang_code();
$config['tpl_name'] = check_user_theme();

function get_random_id(){

    $random = '';

    for ($i = 1; $i <= 8; $i++)
    {
        $random.= mt_rand(0, 9);
    }

    return $random;
}

function change_user_country($country_code){

    global $config;

    if(get_option("country_type") == "multi"){
        $countryName = get_countryName_by_sortname($country_code);
        if(!$countryName) return;
        $_SESSION['user']['country'] = $country_code;
        set_user_currency($country_code);
    }
}
// Function to get the client IP address
function get_client_ip() {

    $ipaddress = '';
    if (getenv('HTTP_CLIENT_IP'))
        $ipaddress = getenv('HTTP_CLIENT_IP');
    else if(getenv('HTTP_X_FORWARDED_FOR'))
        $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
    else if(getenv('HTTP_X_FORWARDED'))
        $ipaddress = getenv('HTTP_X_FORWARDED');
    else if(getenv('HTTP_FORWARDED_FOR'))
        $ipaddress = getenv('HTTP_FORWARDED_FOR');
    else if(getenv('HTTP_FORWARDED'))
        $ipaddress = getenv('HTTP_FORWARDED');
    else if(getenv('REMOTE_ADDR'))
        $ipaddress = getenv('REMOTE_ADDR');
    else
        $ipaddress = 'UNKNOWN';
    return $ipaddress;
}

function check_user_country(){
    global $config;

    if(isset($_SESSION['user']['country']))
    {
        $country_code = $_SESSION['user']['country'];
    }
    else{
        if($config['country_type'] == 'multi'){
            $ip = get_client_ip();

            require_once  ROOTPATH . '/includes/database/geoip/autoload.php';
            // Country DB
            $reader = new \MaxMind\Db\Reader(ROOTPATH .'/includes/database/geoip/geo_country.mmdb');
            $data = $reader->get($ip);
            $country_code = @strtoupper(trim($data['country']['iso_code']));
        }else{
            $country_code = $config['specific_country'];
        }

        if(isset($country_code) && $config['country_type'] == 'multi'){

            if(check_country_activated($country_code)){
                $_SESSION['user']['country'] = $country_code;
            }else{
                $_SESSION['user']['country'] = $config['specific_country'];
                $country_code = $_SESSION['user']['country'];
            }
        }else{
            $_SESSION['user']['country'] = $config['specific_country'];
            $country_code = $_SESSION['user']['country'];
        }
    }

    return $country_code;
}

function get_user_group(){

    global $config;
    $usergroup = 0;

    if(isset($_SESSION['user']['id'])) {

        $user_info = ORM::for_table($config['db']['pre'].'user')
            ->select('group_id')
            ->find_one($_SESSION['user']['id']);

        $usergroup = isset($user_info['group_id'])? $user_info['group_id'] : 0;

    }
    return $usergroup;
}

function set_user_currency($country_code){

    global $config;

    $info = ORM::for_table($config['db']['pre'].'countries')
        ->select('currency_code')
        ->where('code', $country_code)
        ->find_one();
    $currency_code = $info['currency_code'];

    $currency_info = ORM::for_table($config['db']['pre'].'currencies')
        ->where('code', $currency_code)
        ->find_one();

    /*$config['currency_code'] = $info['code'];
    $config['currency_sign'] = $info['html_entity'];
    $config['currency_pos'] = $info['in_left'];*/

    return $currency_info;
}

function change_user_lang($lang_code, $active=true){

    global $config;
    $lang_code = get_language_by_code($lang_code, $active);
    if(!$lang_code) return;
    $cookie_name = "Quick_lang";
    $cookie_value = $lang_code['file_name'];
    setcookie($cookie_name, $cookie_value, time() + (86400 * 30), "/");
    if($config['userlangsel'] == '1')
    {
        $config['lang'] = $lang_code['file_name'];
        $config['lang_code'] = get_current_lang_code();
    }
}

function check_user_lang(){

    global $config;

    if($config['userlangsel'] == '1')
    {
        $cookie_name = "Quick_lang";
        if(isset($_COOKIE[$cookie_name])) {
            $config['lang'] = $_COOKIE[$cookie_name];
        }
    }
    return $config['lang'];
}

function get_current_lang_code(){
    global $config;

    $info = ORM::for_table($config['db']['pre'].'languages')
        ->select('code')
        ->where('file_name', $config['lang'])
        ->find_one();
    return strtolower($info['code']);
}

function check_user_theme(){
    global $config;

    if($config['userthemesel'])
    {
        $cookie_name = "Quick_theme";
        if(isset($_COOKIE[$cookie_name])) {
            $config['tpl_name'] = $_COOKIE[$cookie_name];
        }
    }

    return $config['tpl_name'];
}

function check_account_exists($email){

    global $config;

    $count = ORM::for_table($config['db']['pre'].'user')
        ->where('email', $email)
        ->count();

    // check existing email
    if ($count) {
        return $count;
    } else {
        return 0;
    }
}

function check_phone_exists($phone){

    global $config;

    $count = ORM::for_table($config['db']['pre'].'user')
        ->where('phone', $phone)
        ->count();

    // check existing phone
    if ($count) {
        return $count;
    } else {
        return 0;
    }
}

function check_table_row_exists($id_field_name,$id_value,$table_name){

    global $config;

    $count = ORM::for_table($config['db']['pre'].$table_name)
        ->where($id_field_name, $id_value)
        ->count();

    // check row exist
    if ($count) {
        return $count;
    } else {
        return 0;
    }
}

function check_username_exists($username){

    global $config;

    $count = ORM::for_table($config['db']['pre'].'user')
        ->where('username', $username)
        ->count();

    // check row exist
    if ($count) {
        return $count;
    } else {
        return 0;
    }
}

function get_user_id($username){

    global $config;

    $info = ORM::for_table($config['db']['pre'].'user')
        ->select('id')
        ->where('username', $username)
        ->find_one();

    if(isset($info['id'])){
        return $info['id'];
    }
    else{
        return FALSE;
    }
}

function get_user_id_by_email($email){

    global $config;

    $info = ORM::for_table($config['db']['pre'].'user')
        ->select('id')
        ->where('email', $email)
        ->find_one();

    if(isset($info['id'])){
        return $info['id'];
    }
    else{
        return FALSE;
    }
}

function get_username_by_email($email){

    global $config;

    $info = ORM::for_table($config['db']['pre'].'user')
        ->select('username')
        ->where('email', $email)
        ->find_one();

    if(isset($info['username'])){
        return $info['username'];
    }
    else{
        return FALSE;
    }
}

function is_seller($username){

    global $config;

    $info = ORM::for_table($config['db']['pre'].'user')
        ->select('user_type')
        ->where('username', $username)
        ->find_one();

    if(isset($info['user_type'])){
        $user_type = $info['user_type'];
        if($user_type == "seller")
            return TRUE;
        else
            return FALSE;
    }
    else{
        return FALSE;
    }
}

function create_user_session($userid,$username,$password,$user_type = ''){
    $user_browser = $_SERVER['HTTP_USER_AGENT']; // Get the user-agent string of the user.

    $user_id = preg_replace("/[^0-9]+/", "", $userid); // XSS protection as we might print this value
    $_SESSION['user']['id']  = $user_id;

    $username = preg_replace("/[^a-zA-Z0-9_\-]+/", "", $username); // XSS protection as we might print this value
    $_SESSION['user']['username'] = $username;

    $_SESSION['user']['login_string'] = hash('sha512', $password . $user_browser);

    $_SESSION['user']['user_type'] = $user_type;
    
}

function userlogin($email,$password)
{
    global $config, $user_id, $username,  $db_password, $where;

    $regex = '/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/';

    if(!preg_match("/^[[:alnum:]]+$/", $email))
    {
        if(!preg_match($regex,$email))
        {
            return false;
        }
        else{
            //checking in email
            $where = 'email';
        }
    }
    else{
        //checking in username
        $where = 'username';
    }

    $num_rows = ORM::for_table($config['db']['pre'].'user')
        ->select_many('id', 'status', 'username', 'password_hash')
        ->where($where, $email)
        ->count();

    if ($num_rows >= 1) {
        $info = ORM::for_table($config['db']['pre'].'user')
            ->select_many('id', 'status', 'username', 'password_hash', 'user_type', 'subscription_id')
            ->where($where, $email)
            ->find_one();

        $user_id = $info['id'];
        $status = $info['status'];
        $username = $info['username'];
        $db_password = $info['password_hash'];

        // If the user exists we check if the account is locked
        // from too many login attempts

        /*if (checkbrute($user_id) == true) {
            // Account is locked
            // Send an email to user saying their account is locked
            return false;
        } else {
            // Check if the password in the database matches
            // the password the user submitted. We are using
            // the password_verify function to avoid timing attacks.

        }*/
        if (password_verify($password, $db_password)) {
            // Password is correct!

            // Login successful.
            $userinfo = array();
            $userinfo['id'] = $user_id;
            $userinfo['status'] = $status;
            $userinfo['username'] = $username;
            $userinfo['password'] = $db_password;
            $userinfo['subscription_id'] = $info['subscription_id'];
            $userinfo['user_type'] = $info['user_type'];

            return $userinfo;

        } else {
            // Password is not correct
            // We record this attempt in the database
            $now = time();
            $login_attempts = ORM::for_table($config['db']['pre'].'login_attempts')->create();
            $login_attempts->user_id = $user_id;
            $login_attempts->time = $now;
            $login_attempts->save();

            return false;
        }
    } else {
        // No user exists.
        return false;
    }
	
}

function checkloggedin()
{
    global $config,$password;

    // Check if all session variables are set
    if (isset($_SESSION['user']['id'],
        $_SESSION['user']['username'],
        $_SESSION['user']['login_string'])) {

        $user_id = $_SESSION['user']['id'];
        $login_string = $_SESSION['user']['login_string'];
        $username = $_SESSION['user']['username'];

        // Get the user-agent string of the user.
        $user_browser = $_SERVER['HTTP_USER_AGENT'];

        $result = ORM::for_table($config['db']['pre'].'user')
            ->select('password_hash')
            ->where('id', $user_id)
            ->find_one();

        if (!empty($result)) {

            $login_check = hash('sha512', $result['password_hash'] . $user_browser);

            if (hash_equals($login_check, $login_string) ){
                // Logged In!!!!
                return true;
            } else {
                // Not logged in
                return false;
            }
        } else {
            // Not logged in
            return false;
        }
    } else {
        // Not logged in
        return false;
    }
}

function createusernameslug($title){
    global $config;
    $numHits = 0;
    $slug = $title;

    $numHits = ORM::for_table($config['db']['pre'].'user')
        ->where_like('username', ''.$slug.'%')
        ->count();

    return ($numHits > 0) ? ($slug.$numHits) : $slug;
}

function LogInUserInSystem($userData){
    global $config;
    $fullname = $userData['first_name'].' '.$userData['last_name'];
    $fbfirstname = $userData['first_name'];

    // Check whether user data already exists in database
    $info = ORM::for_table($config['db']['pre'].'user')
        ->where_any_is(array(
            array('email' => $userData['email']),
            array('oauth_uid' => $userData['oauth_uid'])))
        ->find_one();
    if(!empty($info->id)){
        
        $info->oauth_provider = $userData['oauth_provider'];
        $info->oauth_uid = $userData['oauth_uid'];
        $info->save();
        //$userData = $info;
        $userData['id'] = $info->id;
        $userData['username'] = $info->username;
        $userData['password_hash'] = $info->password_hash;
        $userData['status'] = 1;
        $userData['user_type'] = $info->user_type;
        return $userData;
    }
    $arr = array();
    $arr['status'] = 4;
    return $arr;
    
}

function checkSocialUser($userData = array(),$picname, $LogInType = 1, $userType = null){
    
    global $config;
     
    if(!empty($userData)){
       
        if($LogInType == 1){
            return LogInUserInSystem($userData);
        }elseif($LogInType == 2){
            return SignUpUserInSystem($userData,$picname,$userType);
        }
        
        // else{
        //     if(check_username_exists($fbfirstname)){
        //         $username = createusernameslug($fbfirstname);
        //     }
        //     else{
        //         $username = $fbfirstname;
        //     }

        //     $location = getLocationInfoByIp();
        //     $gender = ($userData['gender'] == "") ? "Male" : $userData['gender'];
        //     $password = get_random_id();
        //     $pass_hash = password_hash($password, PASSWORD_DEFAULT, ['cost' => 13]);
        //     // Insert user data
        //     $now = date("Y-m-d H:i:s");

        //     $insert_user = ORM::for_table($config['db']['pre'].'user')->create();
        //     $insert_user->oauth_provider = $userData['oauth_provider'];
        //     $insert_user->oauth_uid = $userData['oauth_uid'];
        //     $insert_user->status = '1';
        //     $insert_user->name = $fullname;
        //     $insert_user->username = $username;
        //     $insert_user->password_hash = $pass_hash;
        //     $insert_user->email = $userData['email'];
        //     $insert_user->sex = $gender;
        //     $insert_user->image = $picname;
        //     $insert_user->oauth_link = $userData['link'];
        //     $insert_user->created_at = $now;
        //     $insert_user->updated_at = $now;
        //     $insert_user->country = $location['country'];
        //     $insert_user->city = $location['city'];
        //     $insert_user->save();

        //     $user_id = $insert_user->id();
            
           
        //     // Get user data from the database
        //     $userData['id'] = $user_id;
        //     $userData['username'] = $username;
        //     $userData['password_hash'] = $pass_hash;
        //     $userData['status'] = 1;
        //     $userData['user_type'] = null;
        // }
    }
    return null;
}

function SignUpUserInSystem($userData,$picname, $userType){
    
    global $config;
    $username = '';
    $fullname = $userData['first_name'].' '.$userData['last_name'];
    $fbfirstname = $userData['first_name'];
    $info = ORM::for_table($config['db']['pre'].'user')
        ->where_any_is(array(
            array('email' => $userData['email']),
            array('oauth_uid' => $userData['oauth_uid'])))
        ->find_one();
    
    
    if(!empty($info->id)){
        $arr = array();
        $arr['status'] = 3;
        return $arr;
    }
    
    if(check_username_exists($fbfirstname)){
        $username = createusernameslug($fbfirstname);
    }
    else{
        $username = $fbfirstname;
    }

    $location = getLocationInfoByIp();
    if($userData['gender'] =='male'){
        $userData['gender'] = 'Male';
    }elseif($userData['gender'] =='female'){
        $userData['gender'] = 'Female';
    }else{
        $userData['gender'] = "";
    }
    
    
    $gender = ($userData['gender'] == "") ? "Male" : $userData['gender'];
    $password = get_random_id();
    $pass_hash = password_hash($password, PASSWORD_DEFAULT, ['cost' => 13]);
    // Insert user data
    $now = date("Y-m-d H:i:s");
    $insert_user = ORM::for_table($config['db']['pre'].'user')->create();
    $insert_user->oauth_provider = $userData['oauth_provider'];
    $insert_user->oauth_uid = $userData['oauth_uid'];
    $insert_user->status = '1';
    $insert_user->user_type = $userType==1?'user':'employer';
    $insert_user->name = $fullname;
    $insert_user->username = $username;
    $insert_user->password_hash = $pass_hash;
    $insert_user->email = $userData['email'];
    $insert_user->sex = $gender;
    $insert_user->image = $picname;
    $insert_user->oauth_link = $userData['link'];
    $insert_user->created_at = $now;
    $insert_user->updated_at = $now;
    $insert_user->country = $location['country'];
    $insert_user->city = $location['city'];
    $insert_user->save();

    
    $user_id = $insert_user->id();
    
   
    // Get user data from the database
    $userData['id'] = $user_id;
    $userData['username'] = $username;
    $userData['password_hash'] = $pass_hash;
    $userData['status'] = 1;
    $userData['user_type'] = null;
    return $userData;
}

function checkFbData($UserData){
    if(empty($UserData) || empty($UserData['id'])){
        return null;
    }
    if(empty($UserData['email'])){
        $UserData['email'] = strtolower(trim($UserData['first_name']??'')).strtolower(trim($UserData['last_name']??'')).$UserData['id'].'@'.$UserData['id'].'facebook.com';
    }
    return $UserData;
}

function get_user_data($username=null,$userid=null){

    global $config;

    if($username != null){
        $info = ORM::for_table($config['db']['pre'].'user')
            ->where('username', $username)
            ->find_one();
    }
    else{
        $info = ORM::for_table($config['db']['pre'].'user')
            ->where('id', $userid)
            ->find_one();
    }

    if (isset($info['id'])) {
        $userinfo['id']         = $info['id'];
        $userinfo['username']   = $info['username'];
        $userinfo['user_type']  = $info['user_type'];
        $userinfo['name']       = $info['name'];
        $userinfo['email']      = $info['email'];
        $userinfo['confirm']    = $info['confirm'];
        $userinfo['password']   = $info['password_hash'];
        $userinfo['forgot']     = $info['forgot'];
        $userinfo['status']     = $info['status'];
        $userinfo['view']       = $info['view'];
        $userinfo['image']      = $info['image'];
        $userinfo['tagline']    = stripslashes($info['tagline']);
        $userinfo['description']= stripslashes($info['description']);
        $userinfo['category']   = $info['category'];
        $userinfo['subcategory']= $info['subcategory'];
        $userinfo['salary_min'] = $info['salary_min'];
        $userinfo['salary_max'] = $info['salary_max'];
        $userinfo['dob']        = $info['dob'];
        $userinfo['sex']        = $info['sex'];
        $userinfo['phone']      = $info['phone'];
        $userinfo['postcode']   = $info['postcode'];
        $userinfo['address']    = $info['address'];
        $userinfo['country']    = $info['country'];
        $userinfo['city']       = $info['city'];
        $userinfo['city_code']  = $info['city_code'];
        $userinfo['state_code'] = $info['state_code'];
        $userinfo['country_code']= $info['country_code'];
        $userinfo['lastactive'] = $info['lastactive'];
        $userinfo['online']     = $info['online'];
        $userinfo['created_at'] = $info['created_at'];
        $userinfo['updated_at'] = $info['updated_at'];
        $userinfo['subscription_id'] = $info['subscription_id'];

        $userinfo['facebook']   = $info['facebook'];
        $userinfo['twitter']    = $info['twitter'];
        $userinfo['googleplus'] = $info['googleplus'];
        $userinfo['instagram']  = $info['instagram'];
        $userinfo['linkedin']   = $info['linkedin'];
        $userinfo['youtube']    = $info['youtube'];

        $userinfo['notify']     = $info['notify'];
        $userinfo['notify_cat'] = $info['notify_cat'];
        $userinfo['website']    = $info['website'];
        return $userinfo;
    }
    else{
        return 0;
    }
}

function update_lastactive(){

    global $config;

    if(isset($_SESSION['user']['id']))
    {
        $person = ORM::for_table($config['db']['pre'].'user')->find_one($_SESSION['user']['id']);
        $person->set_expr('lastactive', 'NOW()');
        $person->save();
    }
}

function send_forgot_email($to,$id)
{
    global $config,$lang,$link;
	$time = time();
	$rand = getrandnum(10);
	$forgot = md5($time.'_:_'.$rand.'_:_'.$to);

    $person = ORM::for_table($config['db']['pre'].'user')->find_one($id);
    $person->forgot = $forgot;
    $person->save();

    $get_userdata = get_user_data(null,$id);
    $to_name = $get_userdata['name'];

    $page = new HtmlTemplate();
    $page->html = $config['email_sub_forgot_pass'];
    $page->SetParameter ('EMAIL', $to);
    $page->SetParameter ('USER_FULLNAME', $to_name);
    $email_subject = $page->CreatePageReturn($lang,$config,$link);

    $forget_password_link = $config['site_url']."login?forgot=".$forgot."&r=".$rand."&e=".$to."&t=".$time;
    $page = new HtmlTemplate();
    $page->html = $config['email_message_forgot_pass'];
    $page->SetParameter ('FORGET_PASSWORD_LINK', $forget_password_link);
    $page->SetParameter ('EMAIL', $to);
    $page->SetParameter ('USER_FULLNAME', $to_name);
    $email_body = $page->CreatePageReturn($lang,$config,$link);

    email($to,$to_name,$email_subject,$email_body);
}

function getrandnum($length)
{
    $randstr='';
    srand((double)microtime()*1000000);
    $chars = array ( 'a','b','C','D','e','f','G','h','i','J','k','L','m','N','P','Q','r','s','t','U','V','W','X','y','z','1','2','3','4','5','6','7','8','9');
    for ($rand = 0; $rand <= $length; $rand++)
    {
        $random = rand(0, count($chars) -1);
        $randstr .= $chars[$random];
    }

    return $randstr;
}

function randomPassword() {
    $alphabet = "abcdefghijklmnopqrstuwxyzABCDEFGHIJKLMNOPQRSTUWXYZ0123456789";
    $pass = array(); //remember to declare $pass as an array
    $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
    for ($i = 0; $i < 8; $i++) {
        $n = rand(0, $alphaLength);
        $pass[] = $alphabet[$n];
    }
    return implode($pass); //turn the array into a string
}

function update_profileview($user_id){

    global $config;

    $person = ORM::for_table($config['db']['pre'].'user')->find_one($user_id);
    $person->set_expr('view', 'view+1');
    $person->save();
}


/********************SECURE LOGIN*********************/
function sec_session_start() {
    define("CAN_REGISTER", "any");
    define("DEFAULT_ROLE", "member");
    define("SECURE", FALSE);    // FOR DEVELOPMENT ONLY!!!!
    $session_name = 'sec_session_id';   // Set a custom session name
    $secure = SECURE;
    // This stops JavaScript being able to access the session id.
    $httponly = true;
    // Forces sessions to only use cookies.
    if (ini_set('session.use_only_cookies', 1) === FALSE) {
        header("Location: ../error.php?err=Could not initiate a safe session (ini_set)");
        exit();
    }
    // Gets current cookies params.
    $cookieParams = session_get_cookie_params();
    $lifetime = time() + (30 * 24 * 60 * 60);
    // $lifetime = strtotime('+1 months'); 
    // session_set_cookie_params($cookieParams["lifetime"], $cookieParams["path"], $cookieParams["domain"], $secure, $httponly); old
    session_set_cookie_params($lifetime, $cookieParams["path"], $cookieParams["domain"], $secure, $httponly);
    // Sets the session name to the one set above.
    session_name($session_name);
    session_start();            // Start the PHP session
    $_SESSION['start'] = time(); // Taking now logged in time.
    $_SESSION['expire'] = $_SESSION['start'] + (30 * 24 * 60 * 60 );
    session_regenerate_id();    // regenerated the session, delete the old one.
}

function checkbrute($user_id) {

    global $config;
    // Get timestamp of current time
    $now = time();

    // All login attempts are counted from the past 2 hours.
    $valid_attempts = $now - (2 * 60 * 60);

    $num_rows = ORM::for_table($config['db']['pre'].'login_attempts')
        ->where_any_is(array(
            array('user_id' => $user_id, 'time' => $valid_attempts)), array('time' => '>'))
        ->count();

    // If there have been more than 5 failed login
    if ($num_rows > 5) {
        return true;
    } else {
        return false;
    }
}

function esc_url($url) {

    if ('' == $url) {
        return $url;
    }

    $url = preg_replace('|[^a-z0-9-~+_.?#=!&;,/:%@$\|*\'()\\x80-\\xff]|i', '', $url);

    $strip = array('%0d', '%0a', '%0D', '%0A');
    $url = (string) $url;

    $count = 1;
    while ($count) {
        $url = str_replace($strip, '', $url, $count);
    }

    $url = str_replace(';//', '://', $url);

    $url = htmlentities($url);

    $url = str_replace('&amp;', '&#038;', $url);
    $url = str_replace("'", '&#039;', $url);

    if ($url[0] !== '/') {
        // We're only interested in relative links from $_SERVER['PHP_SELF']
        return '';
    } else {
        return $url;
    }
}

//Get country cities based on selected country
function get_country_cities_list($country_code,$stringquery){

    global $config;
    $cities = ORM::for_table($config['db']['pre'].'cities')
        ->select('asciiname')
        ->where_like('name', $stringquery.'%')
        ->where('country_code', $country_code)
        ->find_many();

    foreach ($cities as $city) {
        $citiesdata[]=$city->asciiname;
    }

    $citiesdata = array_map('utf8_encode', $citiesdata);
    $citiesJSON = json_encode($citiesdata);

    return $citiesJSON;
}

//Get country cities based on selected country json format
function get_country_cities_list_json($country_code,$stringquery){

    global $config;

    $cities = ORM::for_table($config['db']['pre'].'cities')
        ->select('*')
        ->where_like('name', $stringquery.'%')
        ->where('country_code', $country_code)
        ->find_many();

    //Index
    $i=0;
    foreach ($cities as $city) {

        $cityid = $city['id'];

        $cityname = $city['asciiname'];


        $MyCity[$i]["id"]   = $cityid;

        $MyCity[$i]["text"] = $cityname;

        $i++;

    }



    $citiesJSON = '{"items" : '.json_encode($MyCity, JSON_UNESCAPED_SLASHES).',"totalEntries" : 1000}';



    return $citiesJSON;
}

//Create Order PDF & Send email to user & admin
function create_invoice_pdf($trans_id){


    global $config;
    $num_rows = ORM::for_table($config['db']['pre'] . 'transaction')

        ->where('transaction_time', $trans_id)

        ->count();

    $item_custom = array();

    $item_custom_textarea = array();

    $item_checkbox = array();



    if ($num_rows > 0) {


        $sql = " SELECT t.*,u.*,t.status as transaction_status, t.id as transaction_id FROM `" . $config['db']['pre'] . "transaction` as t LEFT JOIN `" . $config['db']['pre'] . "user` as u ON t.seller_id = u.id WHERE t.transaction_time = '" . $trans_id . "' ";


        $info = ORM::for_table($config['db']['pre'] . 'transaction')->raw_query($sql)->find_one();

        // output data of each row


        $item_id = $info['id'];

        $invoice_no = 1000000 + (int)$info['transaction_id'];

        $product_name = $info['product_name'];

        $amount = $info['amount'];
        
        $vatinvoice  = $amount * 0.05 ;
        
        $totalamount = $amount + $vatinvoice;
        
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

        // Include the main TCPDF library (search for installation path).

        require_once(dirname(__DIR__).'/tcpdf/examples/tcpdf_include.php');
        // Extend the TCPDF class to create custom Header and Footer
        class MYPDF extends TCPDF {

            //Page header
            public function Header() {
                // Logo
                $image_file = K_PATH_IMAGES.'tcpdf_logo.jpg';
                $this->Image($image_file, 10, 10, 50, '', 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);
                // Set font
                $this->SetFont('helvetica', 'B', 20);
                // Title
                $this->Cell(0, 25, '', 0, false, 'R', 0, '', 0, false, 'M', 'B');
            }
            public function Footer()
            {
                $this->SetY(-15);
                // Set font
                $this->SetFont('aealarabiya', 'I', 8);
                // Page number
                $this->Cell(0, 10, '© JOBTOTOP 2022, ALL RIGHTS RESERVED', 0, false, 'C', 0, '', 0, false, 'T', 'M');
            }
        }

        // create new PDF document
                $pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

        // set document information
                $pdf->SetCreator(PDF_CREATOR);
                //$pdf->SetAuthor('MH');
        //$pdf->SetSubject('TCPDF Tutorial');
        //$pdf->SetKeywords('TCPDF, PDF, example, test, guide');
               $pdf->setPrintFooter(false);
        // set default header data
                $pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE, PDF_HEADER_STRING);

        // set header and footer fonts
                $pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
                $pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

        // set default monospaced font
                $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

        // set margins
                $pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
                $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
                $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

        // set auto page breaks
                $pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

        // set image scale factor
                $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

        // set some language dependent data:

        // set some language-dependent strings (optional)
        if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
            require_once(dirname(__FILE__).'/lang/eng.php');
            $pdf->setLanguageArray($l);
        }

        // ---------------------------------------------------------

        // set default font subsetting mode
        $pdf->setFontSubsetting(true);

        // Set font
        // dejavusans is a UTF-8 Unicode font, if you only need to
        // print standard ASCII chars, you can use core fonts like
        // helvetica or times to reduce file size.
        $pdf->setFont('aealarabiya', '', 10, '', true);

        // Add a page
        // This method has several options, check the source code documentation for more information.
        $pdf->AddPage();
        //$pdf->setCellHeightRatio(1.5);
        // set text shadow effect
        //$pdf->setTextShadow(array('enabled'=>true, 'depth_w'=>0.2, 'depth_h'=>0.2, 'color'=>array(196,196,196), 'opacity'=>1, 'blend_mode'=>'Normal'));

        // Set some content to print
        $pdf->ln(5);
        $pdf->SetFont('aealarabiya', '', 12);
        $pdf->SetFillColor(255,255,255);
        $pdf->Cell(50 ,8,'Invoice',0,0,'L',true);
        $pdf->Cell(140 ,8,'',0,0);
        $pdf->Cell(190 ,8,'',0,1);
        $pdf->ln(-1);
        $pdf->SetFont('aealarabiya', '', 10);
        $pdf->Cell(27 ,5,'Invoice number:',0,0,'L',true);
        $pdf->Cell(140 ,5,$invoice_no,0,0,'L');
        $pdf->Cell(190 ,5,'',0,1);
        $pdf->ln(15);
        $pdf->SetFont('aealarabiya', '', 12);
        $pdf->Cell(50 ,5,'Bill to:',0,0,'L',true);
        $pdf->Cell(140 ,5,'',0,0);
        $pdf->Cell(190 ,5,'',0,1);
        $pdf->ln(1);
        $pdf->SetFont('aealarabiya', '', 10);
        $pdf->Cell(250 ,5,$name,0,0,'L',true);
        $pdf->ln(5);
        $pdf->Cell(250 ,5,$city,0,0,'L',true);
        $pdf->ln(5);
        $pdf->Cell(250 ,5,$country,0,0,'L',true);
        $pdf->ln(5);
        $pdf->Cell(250 ,5,$email,0,0,'L',true);
        $pdf->ln(25);
        $pdf->SetFont('aealarabiya', '', 12);
        $pdf->Cell(75 ,5,'Details',0,0,'L',true);
        $pdf->SetLineStyle(array('width' => 0.7,'color' => array(204, 209, 214)));
        $pdf->Cell(100 ,5,'Description / Payment','B',0,'L',true);
        $pdf->ln(10);
        $pdf->SetFont('aealarabiya', '', 10);
        $pdf->Cell(75 ,5,'Invoice number....................'.$invoice_no,0,0,'L',true);
        $pdf->Cell(100 ,5,$transaction_description.'(via @ '.$method.')',0,0);
        $pdf->ln(5);
        $pdf->Cell(75 ,5,'Invoice date....................'.$transaction_time,0,0,'L',true);
        $pdf->Cell(85 ,10,'Total in USD',0,0);
        $pdf->Cell(15 ,10,$amount,0,0);
        $pdf->ln(5);
        $pdf->Cell(75 ,5,'Payment status....................'.$status,0,0,'L',true);
        $pdf->Cell(85 ,5,'',0,0);
        $pdf->Cell(15 ,5,'',0,0);
        $pdf->ln(4);
        $pdf->SetFont('aealarabiya', '', 12);
        $pdf->Cell(75 ,5,'',0,0,'L',true);
        $pdf->SetLineStyle(array('width' => 0.7,'color' => array(204, 209, 214)));
        $pdf->Cell(100 ,5,'Summary for now','B',0,'L',true);
        $pdf->SetFont('aealarabiya', '', 10);
        $pdf->ln(7);
        $pdf->Cell(75 ,5,'',0,0,'L',true);
        $pdf->Cell(85 ,5,'Subtotal in USD',0,0);
        $pdf->Cell(15 ,5,$amount,0,0);
        $pdf->ln(5);
        $pdf->Cell(75 ,5,'',0,0,'L',true);
        $pdf->Cell(85 ,5,'VAT (5%)',0,0);
        $pdf->Cell(15 ,5,$vatinvoice,0,0);
        $pdf->ln(5);
        $pdf->Cell(75 ,5,'',0,0,'L',true);
        $pdf->Cell(85 ,5,'Total in USD',0,0);
        $pdf->Cell(15 ,5,$totalamount,0,0);
        $pdf->ln(25);
        //$pdf->Cell(200 ,8,'Please retain this receipt for your records and get in touch with us for any assistance.',0,0,'L',true);

        // Print text using writeHTMLCell()
        //$pdf->writeHTMLCell(0, 0, '', '', $html, 0, 1, 0, true, '', true);

        // ---------------------------------------------------------

        // Close and output PDF document
        // This method has several options, check the source code documentation for more information.

        $pdf->Output($_SERVER['DOCUMENT_ROOT'].'storage/payments/jobtotop_invoice_'.$invoice_no.'.pdf', 'F');
        //$pdf->Output('example_001.pdf', 'I');exit;

        //============================================================+
        // END OF FILE
        //============================================================+

        //Send email to user and Website admin
        // Recipient Email, write your email here
        $toEmail = $email;

        // Sender Data
        $from = 'info@jobtotop.com';
        $fromName = 'JOBTOTOP';

        // Subject
        $emailSubject = 'Order #'.$invoice_no.' payment confirmed ';

        // User Message
        $htmlContent = '<html>
    <head>
        <title>payment received confirmation</title>
    </head>
    <body style="margin: 0px;">
    <!-- start body -->
    <table width="100%" cellspacing="0" cellpadding="0" border="0">

        <!-- start logo -->
        <tbody><tr>
            <td bgcolor="#e9ecef" align="center">
                <!--[if (gte mso 9)|(IE)]>
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="600">
                    <tr>
                        <td align="center" valign="top" width="600">
                <![endif]-->
                <table style="max-width: 600px;" width="100%" cellspacing="0" cellpadding="0" border="0">
                    <tbody><tr>
                        <td style="padding: 0px;" valign="top" align="center"><p><img src="https://jobtotop.com/storage/logo/classic-theme_footer_logo.png" alt="" style="width: 20%; float: left;" class="note-float-left"><br><a href="{SITE_URL}" target="_blank" style="display: inline-block;"></a></p></td>
                    </tr>
                    </tbody></table>
                <!--[if (gte mso 9)|(IE)]>
                </td>
                </tr>
                </table>
                <![endif]-->
            </td>
        </tr>
        <!-- end logo -->

        <!-- start hero -->
        <tr>
            <td bgcolor="#e9ecef" align="center">
                <!--[if (gte mso 9)|(IE)]>
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="600">
                    <tr>
                        <td align="center" valign="top" width="600">
                <![endif]-->
                <table style="max-width: 600px;" width="100%" cellspacing="0" cellpadding="0" border="0">
                    <tbody><tr>
                        <td style="padding: 36px 24px 0; font-family: Source Sans Pro, Helvetica, Arial, sans-serif; border-top: 3px solid #d4dadf" bgcolor="#ffffff" align="center">
                            <h1 style="margin: 0; font-size: 25px; font-weight: 600; letter-spacing: -1px; line-height: 48px;"><span style="color: inherit; font-family: inherit; background-color: transparent;">Payment Recived</span></h1>            </td>
                    </tr>
                    </tbody></table>
                <!--[if (gte mso 9)|(IE)]>
                </td>
                </tr>
                </table>
                <![endif]-->
            </td>
        </tr>
        <!-- end hero -->

        <!-- start copy block -->
        <tr>
            <td bgcolor="#e9ecef" align="center">
                <!--[if (gte mso 9)|(IE)]>
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="600">
                    <tr>
                        <td align="center" valign="top" width="600">
                <![endif]-->
                <table style="max-width: 600px;" width="100%" cellspacing="0" cellpadding="0" border="0">

                    <!-- start copy -->
                    <tbody><tr>
                        <td style="padding: 24px; font-family: Source Sans Pro, Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;" bgcolor="#ffffff" align="left">
                            <p style="margin: 0;" align="center">Hi '.$name.', we have received your recent payment in respect of invoice #1000046. Thank you very much. We really appreciate it.</p>
                        </td>
                    </tr>
                    <!-- end copy -->

                    <!-- start copy -->
                    <tr>
                        <td style="padding: 24px; font-family: Source Sans Pro, Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;" bgcolor="#ffffff" align="left">
                            <p style="margin: 0;" align="center">Thank you for choosing JOBTOTOP</p>
                        </td>
                    </tr>
                    <!-- end copy -->

                    <!-- start copy -->

                    <!-- end copy -->

                    </tbody></table>
                <!--[if (gte mso 9)|(IE)]>
                </td>
                </tr>
                </table>
                <![endif]-->
            </td>
        </tr>
        <!-- end copy block -->

        <!-- start footer -->
        <tr>
            <td style="padding: 24px;" bgcolor="#e9ecef" align="center">
                <!--[if (gte mso 9)|(IE)]>
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="600">
                    <tr>
                        <td align="center" valign="top" width="600">
                <![endif]-->
                <table style="max-width: 600px;" width="100%" cellspacing="0" cellpadding="0" border="0">

                    <!-- start permission -->
                    <tbody>
                    <!-- end permission -->

                    </tbody></table>
                <!--[if (gte mso 9)|(IE)]>
                </td>
                </tr>
                </table>
                <![endif]-->
            </td>
        </tr>
        <!-- end footer -->

        </tbody></table>
    <!-- end body -->

    </body>
    </html>';

        //Admin Message
    $htmlContentadmin = '<html>
    <head>
        <title>payment received confirmation</title>
    </head>
    <body style="margin: 0px;">
    <!-- start body -->
    <table width="100%" cellspacing="0" cellpadding="0" border="0">

        <!-- start logo -->
        <tbody><tr>
            <td bgcolor="#e9ecef" align="center">
                <!--[if (gte mso 9)|(IE)]>
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="600">
                    <tr>
                        <td align="center" valign="top" width="600">
                <![endif]-->
                <table style="max-width: 600px;" width="100%" cellspacing="0" cellpadding="0" border="0">
                    <tbody><tr>
                        <td style="padding: 0px;" valign="top" align="center"><p><img src="https://jobtotop.com/storage/logo/classic-theme_footer_logo.png" alt="" style="width: 20%; float: left;" class="note-float-left"><br><a href="{SITE_URL}" target="_blank" style="display: inline-block;"></a></p></td>
                    </tr>
                    </tbody></table>
                <!--[if (gte mso 9)|(IE)]>
                </td>
                </tr>
                </table>
                <![endif]-->
            </td>
        </tr>
        <!-- end logo -->

        <!-- start hero -->
        <tr>
            <td bgcolor="#e9ecef" align="center">
                <!--[if (gte mso 9)|(IE)]>
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="600">
                    <tr>
                        <td align="center" valign="top" width="600">
                <![endif]-->
                <table style="max-width: 600px;" width="100%" cellspacing="0" cellpadding="0" border="0">
                    <tbody><tr>
                        <td style="padding: 36px 24px 0; font-family: Source Sans Pro, Helvetica, Arial, sans-serif; border-top: 3px solid #d4dadf" bgcolor="#ffffff" align="center">
                            <h1 style="margin: 0; font-size: 25px; font-weight: 600; letter-spacing: -1px; line-height: 48px;"><span style="color: inherit; font-family: inherit; background-color: transparent;">Payment Recived</span></h1>            </td>
                    </tr>
                    </tbody></table>
                <!--[if (gte mso 9)|(IE)]>
                </td>
                </tr>
                </table>
                <![endif]-->
            </td>
        </tr>
        <!-- end hero -->

        <!-- start copy block -->
        <tr>
            <td bgcolor="#e9ecef" align="center">
                <!--[if (gte mso 9)|(IE)]>
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="600">
                    <tr>
                        <td align="center" valign="top" width="600">
                <![endif]-->
                <table style="max-width: 600px;" width="100%" cellspacing="0" cellpadding="0" border="0">

                    <!-- start copy -->
                    <tbody><tr>
                        <td style="padding: 24px; font-family: Source Sans Pro, Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;" bgcolor="#ffffff" align="left">
                            <p style="margin: 0;" align="center">You’ve received the following order #'.$invoice_no.' from .'.$name.', please find the attached invoice copy for your reference</p>
                        </td>
                    </tr>
                    <!-- end copy -->

                    <!-- start copy -->
                    <tr>
                        <td style="padding: 24px; font-family: Source Sans Pro, Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;" bgcolor="#ffffff" align="left">
                            <p style="margin: 0;" align="center">Thank you for choosing JOBTOTOP</p>
                        </td>
                    </tr>
                    <!-- end copy -->

                    <!-- start copy -->

                    <!-- end copy -->

                    </tbody></table>
                <!--[if (gte mso 9)|(IE)]>
                </td>
                </tr>
                </table>
                <![endif]-->
            </td>
        </tr>
        <!-- end copy block -->

        <!-- start footer -->
        <tr>
            <td style="padding: 24px;" bgcolor="#e9ecef" align="center">
                <!--[if (gte mso 9)|(IE)]>
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="600">
                    <tr>
                        <td align="center" valign="top" width="600">
                <![endif]-->
                <table style="max-width: 600px;" width="100%" cellspacing="0" cellpadding="0" border="0">

                    <!-- start permission -->
                    <tbody>
                    <!-- end permission -->

                    </tbody></table>
                <!--[if (gte mso 9)|(IE)]>
                </td>
                </tr>
                </table>
                <![endif]-->
            </td>
        </tr>
        <!-- end footer -->

        </tbody></table>
    <!-- end body -->

    </body>
    </html>';

        // Header for sender info
        $headers = "From:". $fromName." <".$from.">";
        $uploadedFile = $_SERVER['DOCUMENT_ROOT'].'storage/payments/jobtotop_invoice_'.$invoice_no.'.pdf';
        if(!empty($uploadedFile) && file_exists($uploadedFile)){

            // Boundary
            $semi_rand = md5(time());
            $mime_boundary = "==Multipart_Boundary_x{$semi_rand}x";

            // Headers for attachment
            $headers .= "\nMIME-Version: 1.0\n" . "Content-Type: multipart/mixed;\n" . " boundary=\"{$mime_boundary}\"";

            // Multipart boundary
            $message = "--{$mime_boundary}\n" . "Content-Type: text/html; charset=\"UTF-8\"\n" .
                "Content-Transfer-Encoding: 7bit\n\n" . $htmlContent . "\n\n";

            $messageadmin = "--{$mime_boundary}\n" . "Content-Type: text/html; charset=\"UTF-8\"\n" .
                "Content-Transfer-Encoding: 7bit\n\n" . $htmlContentadmin . "\n\n";

            // Preparing attachment
            if(is_file($uploadedFile)){
                $message .= "--{$mime_boundary}\n";
                $messageadmin .= "--{$mime_boundary}\n";
                $fp =    @fopen($uploadedFile,"rb");
                $data =  @fread($fp,filesize($uploadedFile));
                @fclose($fp);
                $data = chunk_split(base64_encode($data));
                $message .= "Content-Type: application/octet-stream; name=\"".basename($uploadedFile)."\"\n" .
                    "Content-Description: ".basename($uploadedFile)."\n" .
                    "Content-Disposition: attachment;\n" . " filename=\"".basename($uploadedFile)."\"; size=".filesize($uploadedFile).";\n" .
                    "Content-Transfer-Encoding: base64\n\n" . $data . "\n\n";

                $messageadmin .= "Content-Type: application/octet-stream; name=\"".basename($uploadedFile)."\"\n" .
                    "Content-Description: ".basename($uploadedFile)."\n" .
                    "Content-Disposition: attachment;\n" . " filename=\"".basename($uploadedFile)."\"; size=".filesize($uploadedFile).";\n" .
                    "Content-Transfer-Encoding: base64\n\n" . $data . "\n\n";
            }

            $message .= "--{$mime_boundary}--";
            $messageadmin .= "--{$mime_boundary}--";
            $returnpath = "-f" . $email;

            // Send email
            $mail = mail($toEmail, $emailSubject, $message, $headers, $returnpath);
            $mail = mail($from, $emailSubject, $messageadmin, $headers, $returnpath);

            // Delete attachment file from the server
            //@unlink($uploadedFile);
        }else{
            // Set content-type header for sending HTML email
            $headers .= "\r\n". "MIME-Version: 1.0";
            $headers .= "\r\n". "Content-type:text/html;charset=UTF-8";

            // Send email
             $mail = mail($toEmail, $emailSubject, $htmlContent, $headers);
        }

    }//end if

}
?>
