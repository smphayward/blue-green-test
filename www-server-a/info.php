<?php
header('Content-Type: application/json');

if (!isset($myObj)) 
    $myObj = new stdClass();

$myObj->remoteAddress = $_SERVER['REMOTE_ADDR'];
$myObj->inkRequesterIpAddress = $_SERVER['HTTP_INK_REQUESTER_IP'];
$myObj->inkRequestHost = $_SERVER['HTTP_INK_REQUEST_HOST'];
$myObj->inkRequestId = $_SERVER['HTTP_INK_REQUEST_ID'];
$myObj->hostname = gethostname();

$myJSON = json_encode($myObj);

echo $myJSON;
?>