<?php
header('Content-Type: application/json');
$myObj->removeAddress = $_SERVER['REMOTE_ADDR'];
$myObj->requesterAddress = $_SERVER['HTTP_INK_REQUESTER_IP'];
$myObj->requestHost = $_SERVER['HTTP_INK_REQUEST_HOST'];
$myObj->hostname = gethostname();

$myJSON = json_encode($myObj);

echo $myJSON;
?>