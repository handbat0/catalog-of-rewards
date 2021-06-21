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
        return $this->id;
    }
    
    public function setName(string $name)
    {
        return $this->name = $name;
    }

    public static function getAll()
    {
        $collection = [];
        $result = DB::query("SELECT * FROM categories");
        if (is_array($result) && count($result) > 0) {
            foreach ($result as $el) {
                $collection[] = new Category($el[0], $el[1], $el[2]);
            }
        }

        return $collection;
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
