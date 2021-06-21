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
        include("./App/Views/category.php");
    }
}
