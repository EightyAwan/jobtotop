<?php
require_once('../../config.php');
require_once('../../sql_builder/idiorm.php');
require_once('../../db.php');
require_once('../../functions/func.global.php');
require_once('../../functions/func.users.php');
require_once('../../functions/func.sqlquery.php');
sec_session_start();

// Include the autoloader provided in the SDK
require_once __DIR__ . '/facebook-php-sdk/autoload.php';

// Include required libraries
use Facebook\Facebook;
use Facebook\Exceptions\FacebookResponseException;
use Facebook\Exceptions\FacebookSDKException;

/*
 * Configuration and setup Facebook SDK
 */
//Clients
// $appId 			= "1348235115751666"; //Facebook App ID
// $appSecret 		= "9719f307465c3c107f117c80dff084ab"; //Facebook App Secret


//Dev
// $appId 			= "539027208335957"; //Facebook App ID
// $appSecret 		= "dd9b94db671382d3d6e8e8307bfc3219"; //Facebook App Secret

$appId 			= "1348235115751666"; //Facebook App ID
$appSecret 		= "9719f307465c3c107f117c80dff084ab"; //Facebook App Secret
$redirectURL 	= $config['site_url'].'includes/social_login/facebook/index.php'; //Callback URL
$fbPermissions 	= array('email');  //Optional permissions

//Client 2
// $appId 			= "969823521053724"; //Facebook App ID
// $appSecret 		= "fdac732435596b85bc17e9383a83b5d4"; //Facebook App Secret






// 

$fb = new Facebook(array(
	'app_id' => $appId,
	'app_secret' => $appSecret,
	'default_graph_version' => 'v2.2',
));

// Get redirect login helper
$helper = $fb->getRedirectLoginHelper();

// Try to get access token
try {
	if(isset($_SESSION['facebook_access_token'])){
		$accessToken = $_SESSION['facebook_access_token'];
	}else{
  		$accessToken = $helper->getAccessToken($redirectURL);
	}
} catch(FacebookResponseException $e) {
 	echo 'Graph returned an error: ' . $e->getMessage();
  	exit;
} catch(FacebookSDKException $e) {
	echo 'Facebook SDK returned an error: ' . $e->getMessage();
  	exit;
}

?>