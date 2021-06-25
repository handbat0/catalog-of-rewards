<?php
namespace App;

use App\Model\Category;
use App\Model\Product;
class View
{
    public static function category(array $args = [])
    {
        if (!array_key_exists('id', $args)) $args['id'] = 0;
        $links = self::getLinks($args);
        $products = self::getProductLists($args['id']);
        include("./App/Views/category.php");
    }

    public static function detail(array $args = [])
    {
        if (!array_key_exists('id', $args)) return;
        $product = self::getDetailProduct($args['id']);
        include("./App/Views/detail.php");
    }

    public static function getLinks($args)
    {
        $categories = Category::getByParentId($args['id'], false);
        $current = $args['id'] > 0 ? Category::getById($args['id'], false) : null;
        if ($current)
            $parent = $current->getParentId() > 0 ? Category::getById($current->getParentId(), false) : null;

        $links = '';
        if ($parent) {
            $links .= "<a href='/category/" . $parent->getId() . "'  class='my-3'>Back - " . $parent->getName() . "</a>";
        }

        if ($current) {
            $links .= "<a href='/category/" . $current->getId() . "'  class='my-3 fs-3 text-warning'>" . $current->getName() . "</a>";
        }

        foreach ($categories as $el) {
            $links .= "<a href='/category/" . $el->getId() . "'>" . $el->getName() . "</a>";
        }

        return $links;
    }

    public static function getProductLists($category)
    {
        $products = Product::getAllByCategory($category, false);

        $return = '';
        if (count($products) < 1) return $return;

        foreach ($products as $product) {
            $id = $product->getId();
            $name = $product->getName();
            $price = $product->getPrice();
            $img = $product->getPicture();
            $return .= '<div class="card" style="width: 18rem;">' . 
            "<img src='$img' class='card-img-top' alt='$name'>" . 
            "<div class='card-body'>" .
              "<h5 class='card-title'>$name</h5>" . 
              "<p class='card-text'>Price: $price</p>" . 
              "<a href='/product/$id' class='btn btn-primary'>Detail</a>" .
            "</div></div>";
        }

        return $return;
    }

    public static function getDetailProduct($id)
    {
        $product = Product::getById($id, false);

        $return = '<ul>';
        foreach (Product::$fields as $field) {
            $f = $product->getField($field);
            $return .= "<li><b>$field:</b> $f</li>";
        }
        $return .= '</ul>';

        return $return;
    }
}
