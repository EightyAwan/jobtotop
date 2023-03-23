
<?php
    $mobile=$_POST["uphone"];
    $massage="your massage is";
	// Account details
	$apiKey = urlencode('MzA0NzRmNDQ2ODc2MzY0MzdhNGQ0NzZlMzk2YTUxNzI=');

	// Message details
	$numbers = array($mobile);
	$sender = urlencode('Jims Autos');
	$message = rawurlencode('$massage');

	$numbers = implode(',', $numbers);

	// Prepare data for POST request
	$data = array('apikey' => $apiKey, 'numbers' => $numbers, "sender" => $sender, "message" => $message);

	// Send the POST request with cURL
	$ch = curl_init('https://api.txtlocal.com/send/');
	curl_setopt($ch, CURLOPT_POST, true);
	curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	$response = curl_exec($ch);
	curl_close($ch);

	// Process your response here
	echo $response;
?>
