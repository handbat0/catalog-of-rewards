<?php
namespace App;

class View
{
    public static function main()
    {
        include("./App/Views/main.php");
    }

    public static function category(array $args = [])
    {
        // $q = '?';
        // foreach ($args as $key => $value) {
        //     if ($key && $value) $q .= "$key=$value&";
        // }
        
        include("./App/Views/category.php");
    }
}
