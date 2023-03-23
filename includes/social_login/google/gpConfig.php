<?php
require_once('../../config.php');
require_once('../../sql_builder/idiorm.php');
require_once('../../db.php');
require_once('../../functions/func.global.php');
require_once('../../functions/func.users.php');
require_once('../../functions/func.sqlquery.php');
sec_session_start();

//Include Google client library 
include_once 'src/Google_Client.php';
include_once 'src/contrib/Google_Oauth2Service.php';

/*
 * Configuration and setup Google API
 */

$clientId = "694483931057-ars3veg9hodfjqbsl02kfnhlbvt50l4e.apps.googleusercontent.com"; //Google client ID
$clientSecret = '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'; //Google client secret
$redirectURL = 'https://www.jobtotop.com/includes/social_login/google/index.php'; //Callback URL

//Call Google API
$gClient = new Google_Client();
$gClient->setApplicationName('Login to '.$config['site_title']);
$gClient->setClientId($clientId);
$gClient->setClientSecret($clientSecret);
$gClient->setRedirectUri($redirectURL);

$google_oauthV2 = new Google_Oauth2Service($gClient);
?>