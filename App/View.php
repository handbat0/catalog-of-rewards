<?php
namespace App;

class View
{
    public static function main(array $args = [])
    {
        echo \file_get_contents('./App/Views/main.php');
    } 
}
