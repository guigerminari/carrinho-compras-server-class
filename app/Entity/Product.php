<?php

namespace App\Entity;
use Lib\Database\Database;
use \PDO;

class Product{
    /**
     * Unic Indentifier
     * @var integer
     */
    public $id;
    
    /**
     * Product Title
     * @var string
     */
    public $title;

    /**
     * Product description
     * @var string
     */
    public $description;

    /**
     * Product price
     * @var float
     */
    public $price;

    /**
     * URL of Product Image
     * @var string
     */
    public $image;

    /**
     * Product is activated
     * @var string(y/n)
     */
    public $active;

    /**
     * When the product is created
     * @var string
     */
    public $createdAt;

    /**
     * 
     */
    public function __construct($prod = null){
        if($prod !== null){
            print_r($prod);
            $this->id = $prod['id'];
            $this->title = $prod->title;
            $this->description = $prod->description;
            $this->price = $prod->price;
            $this->image = $prod->image;
            $this->active = $prod->active;
            $this->createdAt = $prod->createdAt;
        }
    }

    /**
     * Persist a new product
     * @var array
     * @return Product
     */
    public function insert($newProduct = null){
        $conn = new Database('products');
        
        if(!isset($newProduct)){
            $newProduct = array("title"=>$this->title, "price"=>$this->price);
        }

        $conn->insert($newProduct);
    }

    /**
     * Get a list of Product on Database
     * @param  string $where
     * @param  string $order
     * @param  string $limit
     * @return array(Product)
     */
    public function getProducts($where = null, $order = null, $limit = null){
        $conn = new Database('products');
        return $conn->get($where,$order,$limit)
                                ->fetchAll(PDO::FETCH_CLASS,self::class);
    }

     /**
     * Get a Product based on its ID
     * @param  integer $id
     * @return Product
     */
    public static function getProduct($id){
        return (new Database('products'))->get('id = '.$id)
                                    ->fetchObject(self::class);
    }
}