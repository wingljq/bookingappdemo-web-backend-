<?php
// UFOSEND SMS API V3.0 - Secure HTTP GET Sample
// use this if you just wish to go for very quick and simple submission
// your submission can only be sending to one mobile each time
// you do not provide us a webhook URL in this case, while you can still login to portal to view usage and delivery status
/****************************** System Parameters *******************************/
// account information
$account_name = 'mmigl@u3.ufosend.com';
$api_key = 'd00fa2fd8d5fe2a0';
$api_url = "https://api3.ufosend.com/v3.0/sms_connect.php";
// define sender id
$sender = 'InfoSMS';  // fill in your caller display (3-11 alphanumeric characters, not support Chi. and strange characters)
// compose SMS content
$sms_content = '你好 Chan Tai Man, 你的密碼是 123456A'; 
$sms_content = urlencode($sms_content);   // content needs to be url encoded
$mobile = '85257444369';    // country code + mobile number
// prepare URL 
$url = $api_url . "?account_name=$account_name&api_key=$api_key&sms_content=$sms_content&mobile=$mobile&sender=$sender";
// if need sender and also want to override those already registered in ofca registars, add following parameters
// send_also_ofca_registars = 1 means also send to those who already reigstered as in OFCA's Do-Not-Call list
// sender = $sender
// uncomment example below 
// $url = $api_url . "?account_name=$account_name&api_key=$api_key&sender=$sender&sms_content=$sms_content&send_also_ofca_registers=1&mobile=$mobile";
// send request (here use GET) to platform thru API, use curl call 
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
$rm_json = curl_exec($ch);   // return message in JSON format
curl_close($ch);
/******************************* Show Result ********************************/
// show the acknowledge return, and reference id
echo "Return Data : <BR>$rm_json<BR>";
?>