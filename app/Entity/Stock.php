<?php

namespace App\Entity;
use Lib\Database\Database;

class Stock{

    /**
     * Product Indentifier
     * @var integer
     */
    public $id;
    
    /**
     * The number of products is in stock
     * @var string
     */
    public $amount;

     /**
     * Get the Stock of Product based on its ID
     * @param  integer $id
     * @return Stock
     */
    public static function getStock($id){
        return (new Database('stock'))->get('id = '.$id)
                                    ->fetchObject(self::class);
    }
}

?>