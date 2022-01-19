<?php

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Acess-Control-Allow-Methods: POST");
header("Acess-Control-Allow-Headers: Accept");
header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
header('Access-Control-Allow-Credentials: true');
header('Access-Control-Max-Age: 86400');    // cache for 1 day
header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");

require_once __DIR__ . '/../../vendor/autoload.php';

use \App\Entity\Order;
$data = json_decode(file_get_contents("php://input"));

$order = new Order();

if($order->createOrder($data)){
    echo json_encode(array("message" => "Success","status"=>true));
}else{
    echo json_encode(array("message" => "Failed Order Not Inserted","status"=>false));
}

?>