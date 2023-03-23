<?php
ini_set('display_errors', 1); ini_set('display_startup_errors', 1); error_reporting(E_ALL);
require_once 'twilio-php-master/Twilio/autoload.php';

require_once('../includes/config.php');
require_once('../includes/sql_builder/idiorm.php');
require_once('../includes/db.php');
require_once('../includes/classes/class.template_engine.php');
require_once('../includes/classes/class.country.php');
require_once('../includes/functions/func.global.php');
require_once('../includes/functions/func.sqlquery.php');
require_once('../includes/functions/func.users.php');
require_once('../includes/lang/lang_'.$config['lang'].'.php');
require_once('../includes/seo-url.php');

sec_session_start();

require_once('../includes/seo-url.php');

// Send OTP code for verification
if(isset($_POST["phone"])) {
    $SixDigitRandomNumber = rand(100000,999999);
 
//Please Enter Your Details
    $message = $SixDigitRandomNumber." is your JOBTOTOP Authentication code."; //enter Your Message

    $api_id="API1101254021095";
    $api_password = "TeBMN9e9dj"; //your password,
    $sms_type="T";
    $encoding="T";
    $sender_id="SMSALA";
    $phonenumber=$_POST["phone"];
    $textmessage=urlencode($message);
    $url="https://api.smsala.com/api/SendSMS?api_id=$api_id&api_password=$api_password&sms_type=$sms_type&encoding=$encoding&sender_id=$senderid&phonenumber=$phonenumber&textmessage=$textmessage";
    
    
    
    $ch = curl_init();
    if (!$ch) {
        die("Couldn't initialize a cURL handle");
    }
    $ret = curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    
    $ret = curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    $curlresponse = curl_exec($ch); // execute
    if (curl_errno($ch))
        echo 'curl error : ' . curl_error($ch);
    if (empty($ret)) {
// some kind of an error happened
        die(curl_error($ch));
        curl_close($ch); // close cURL handler
    } else {
        $info = curl_getinfo($ch);
        curl_close($ch); // close cURL handler
          $response=json_decode($curlresponse,true);
          if($response['message_id'] != 0 && $response['status'] != "F"){
              $insert_user = ORM::for_table($config['db']['pre'].'user_otps')->create();
                $insert_user->number = $_POST["phone"];
                $insert_user->token =$SixDigitRandomNumber;
                $insert_user->deleted_at = date('Y-m-d');
                $insert_user->save();
                echo "1";
          }else{
              echo "0";
          }
         
    }
    
    
    
    
    
    //Please Enter Your Details
    $user = "MANEU49939"; //your username
    $password = "Dubai@123"; //your password
    
    $mobilenumbers = $_POST["phone"]; //enter Mobile numbers comma seperated
    //exit();
    $message = $SixDigitRandomNumber." is your JOBTOTOP Authentication code."; //enter Your Message
    $senderid = "JOBTOTOP"; //Your senderid
    $messagetype = "N"; //Type Of Your Message
    $DReports = "Y"; //Delivery Reports
    $url = "https://api.smscountry.com/SMSCwebservice_bulk.aspx";
    $message = urlencode($message);
    

    
    
    
 
       
    $sid = 'ACa12e8001bd4252d9b033ef3362a60ea5';
    
    $token = '30a963834b2470988427de6254a17bd1';
    
    
 

    
    
    
    $client = new Twilio\Rest\Client($sid, $token);
    
     try{
  

$client->messages->create(

    // the number you'd like to send the message to

    "+$mobilenumbers",

    array(

        // A Twilio phone number you purchased at twilio.com/console

        'from' => '+17754611673',

        // the body of the text message you'd like to send

        'body' => "$SixDigitRandomNumber is your JOBTOTOP Authentication code."

    )

);


}
catch(Exception $e){
    
    echo "error";
    }
   /* 
    $message1=$client->messages->create(

    // the number you'd like to send the message to

    '+923217908901',

    array(

        // A Twilio phone number you purchased at twilio.com/console

        'from' => '+18623703906',

        // the body of the text message you'd like to send

        'body' => "$message"

    )

);*/
//echo "Asnan";exit();

  
    $insert_user = ORM::for_table($config['db']['pre'].'user_otps')->create();
                $insert_user->number = $_POST["phone"];
                $insert_user->token =$SixDigitRandomNumber;
                $insert_user->deleted_at = date('Y-m-d');
                $insert_user->save();
                echo "1";
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    $ch = curl_init();
    if (!$ch) {
        die("Couldn't initialize a cURL handle");
    }
    $ret = curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
    curl_setopt($ch, CURLOPT_POSTFIELDS,
        "User=$user&passwd=$password&mobilenumber=$mobilenumbers&message=$message&sid=$senderid");
    $ret = curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
//If you are behind proxy then please uncomment below line and provide your proxy ip with port.
// $ret = curl_setopt($ch, CURLOPT_PROXY, "PROXY IP ADDRESS:PORT");
    $curlresponse = curl_exec($ch); // execute
    if (curl_errno($ch))
        echo 'curl error : ' . curl_error($ch);
    if (empty($ret)) {
// some kind of an error happened
        print_r(curl_error($ch));
        curl_close($ch); // close cURL handler
    } else {
        $info = curl_getinfo($ch);
        curl_close($ch); // close cURL handler
          if(strpos($curlresponse, 'sent') > 0){
              $insert_user = ORM::for_table($config['db']['pre'].'user_otps')->create();
                $insert_user->number = $_POST["phone"];
                $insert_user->token =$SixDigitRandomNumber;
                $insert_user->deleted_at = date('Y-m-d');
                $insert_user->save();
               echo "1";
          }else{
              echo "0";
          }
    }

    
    
    
}
        
?>