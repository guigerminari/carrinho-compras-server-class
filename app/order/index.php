<?php

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

require_once __DIR__ . '/../../vendor/autoload.php';

use \App\Entity\Order;

$id = $_GET['id'];
$where = '';

if(isset($id)){
    $stock = new Order();
    echo json_encode($stock->getOrder($id));
}

?>