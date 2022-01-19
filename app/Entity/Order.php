<?php

namespace App\Entity;
use Lib\Database\Database;
use \PDO;

class Order{
    /**
     * Unic Indentifier
     * @var integer
     */
    public $id;

    /**
     * The paymente form
     * @var string
     */
    public $payment_form;

    /**
     * The date at created
     * @var string
     */
    public $createdAt;

    /**
     * User ID
     */
    public $user_id;

    /**
     * List of products
     * @var Product List
     */
    public $products = array();

    /**
     * Returns the Order by id
     * @param id
     * @return Order
     */
    public function getOrder($id = null){
        $order = new Order();

        $conn = new Database('order_buy');
        $order = $conn->get('id = '.$id)->fetchObject(self::class);

        $conn = new Database('order_products');
        $products = $conn->get('id_order = '.$id)->fetchAll();

        $prod = new Product();
        $order->products = $prod->getProducts('id IN (' . implode(', ', array_column($products, 'id_product')) . ')');

        return $order;
    }

    /**
     * Create a new Order
     * @param array Order
     * @return Order
     */
    public function createOrder($order){
        
        $conn = new Database('order_buy');
        $order->id = $conn->insert(array('payment_form'=>$order->payment_form));
        $products = $order->cart;
        
        foreach($products as $key => $cart){
            $conn = new Database('order_products');
            
            $conn->insert(array('id_product'=>$cart->id,'id_order'=>$order->id,'amount'=>$cart->amount));

            $conn = new Database('stock');
            // TODO estoque não está atualizando corretamente
            $conn->custom("UPDATE stock SET amount = amount - {$cart->amount} WHERE id = {$cart->id}");
        }

        return true;
    }
}