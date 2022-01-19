<?php

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

require_once __DIR__ . '/../../vendor/autoload.php';

use \App\Entity\Stock;

$id = $_GET['id'];
$where = '';

if(isset($id)){
    $stock = new Stock();
    echo json_encode($stock->getStock($id));
}

?>