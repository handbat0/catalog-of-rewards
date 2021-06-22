<?php
namespace App;

use App\Model\Category;
class View
{
    public static function main()
    {
        $links = self::getLinks(['id' => 0]);
        include("./App/Views/category.php");
    }

    public static function category(array $args = [])
    {
        $links = self::getLinks($args);
        include("./App/Views/category.php");
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


}
