<?php

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

require_once __DIR__ . '/../../vendor/autoload.php';

use \App\Entity\Product;

$id = $_GET['id'];
$where = '';
$prod = new Product();

if(isset($id)){
    echo json_encode($prod->getProduct($id));
}else{
    echo json_encode($prod->getProducts($where));
}
?>