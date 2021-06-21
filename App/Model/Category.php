<?php
namespace App\Model;

require_once('./App/DB.php');
use App\DB;

class Category
{
    private $id;
    private $parent;
    private $name;
    static private $category;

    public function __construct(int $id, int $parent, string $name)
    {
        $this->setId($id);
        $this->setParentId($parent);
        $this->setName($name);
    }

    public static function create(int $id, int $parent, string $name)
    {
        self::$category = new self($id, $parent, $name);
        self::$category->save();
        return self::$category;
    }

    public function getId()
    {
        return $this->id;
    }

    public function setId(int $id)
    {
        return $this->id = $id;
    }

    public function getParentId()
    {
        return $this->parent;
    }
    
    public function setParentId(int $id)
    {
        return $this->parent = $id;
    }

    public function getName()
    {
        return $this->name;
    }
    
    public function setName(string $name)
    {
        return $this->name = $name;
    }

    public static function getAll($forApi = true)
    {
        $collection = [];
        $result = DB::query("SELECT * FROM categories");
        if (is_array($result) && count($result) > 0) {
            foreach ($result as $el) {
                $tmp = new Category($el[0], $el[1], $el[2]);
                $collection[] = $forApi ? get_object_vars($tmp) : $tmp;
            }
        }

        if ($forApi) {
            echo json_encode($collection, JSON_PRETTY_PRINT);
        } else {
            return $collection;
        }
    }

    public static function getByParentId($parent = 0, $forApi = true)
    {
        $collection = [];
        $result = DB::query("SELECT * FROM categories WHERE parent=" . $parent);
        if (is_array($result) && count($result) > 0) {
            foreach ($result as $el) {
                $tmp = new Category($el[0], $el[1], $el[2]);
                $collection[] = $forApi ? get_object_vars($tmp) : $tmp;
            }
        }

        if ($forApi) {
            echo json_encode($collection, JSON_PRETTY_PRINT);
        } else {
            return $collection;
        }
    }

    public static function getById($id, $forApi = true)
    {
        $el = null;
        $result = DB::query("SELECT * FROM categories WHERE id=" . $id);
        if (is_array($result) && count($result) > 0) {
            $tmp = new Category($result[0][0], $result[0][1], $result[0][2]);
            $el = $forApi ? get_object_vars($tmp) : $tmp;
        }

        if ($forApi) {
            echo json_encode($el, JSON_PRETTY_PRINT);
        } else {
            return $el;
        }
    }

    public function save()
    {
        $result = DB::query("SELECT * FROM categories WHERE id=" . $this->id);
        if (is_array($result) && count($result) > 0) {
            $q = 'UPDATE categories SET';
            $q .= ' parent=' . intval($this->parent);
            $q .= ", name='" . $this->name . "'";
            $q .= ' WHERE id=' . $this->id;
        } else {
            $q = "INSERT INTO categories (id, parent, name)";
            $q .= " VALUES ($this->id, $this->parent, '$this->name')";
        }

        return DB::query($q);
    }

}
