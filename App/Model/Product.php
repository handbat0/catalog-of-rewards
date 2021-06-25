<?php
namespace App\Model;

use App\DB;

class Product
{
    private $id;
    private $name;
    private $vendor;
    private $model;
    private $vendorCode;
    private $typePrefix;
    private $groupId;
    private $dealerID;
    private $inStock;
    private $available;
    private $downloadable;
    private $price;
    private $discountPrice;
    private $category;
    private $picture;
    private $annotation;
    private $termsConditions;
    private $activationRules;
    private $termsOfUse;

    static private $product;

    public static $fields = [
        'id',
        'name',
        'vendor',
        'model',
        'vendorCode',
        'typePrefix',
        'groupId',
        'dealerID',
        'inStock',
        'available',
        'downloadable',
        'price',
        'discountPrice',
        'category',
        'picture',
        'annotation',
        'termsConditions',
        'activationRules',
        'termsOfUse',
    ];

    public static $required = [
        'id',
        'name',
        'dealerID',
        'inStock',
        'available',
        'downloadable',
        'price',
        'category',
    ];

    public function __construct(array $fields)
    {
        $req = self::$required;
        foreach ($fields as $field => $val) {
            $f = lcfirst($field);
            $this->setField(lcfirst($f), $val);
            if (in_array($f, $req))
                unset($req[array_search($f, $req)]);
        }

        if (count($req) > 0) return false;
    }

    public static function create(array $fields)
    {
        self::$product = new self($fields);
        self::$product->save();
        return self::$product;
    }

    public function getField($field)
    {
        return !empty($this->$field) ? $this->$field : null;
    }

    public function setField($field, $value)
    {
        return $this->$field = $value ?? null;
    }

    public function getId()
    {
        return $this->id;
    }

    public function setId(int $id)
    {
        return $this->id = $id;
    }

    public function getName()
    {
        return $this->name;
    }
    
    public function setName(string $name)
    {
        return $this->name = $name;
    }

    public function getvendor()
    {
        return $this->vendor;
    }

    public function setVendor($vendor)
    {
        return $this->vendor = $vendor;
    }

    public function getModel()
    {
        return $this->model;
    }

    public function setModel($model)
    {
        return $this->model = $model;
    }

    public function getVendorCode()
    {
        return $this->vendorCode;
    }

    public function setVendorCode($vendorCode)
    {
        return $this->vendorCode = $vendorCode;
    }

    public function getTypePrefix()
    {
        return $this->typePrefix;
    }

    public function setTypePrefix($typePrefix)
    {
        return $this->typePrefix = $typePrefix;
    }

    public function getGroupId()
    {
        return $this->groupId;
    }

    public function setGroupId($groupId)
    {
        return $this->groupId = $groupId;
    }

    public function getDealerID()
    {
        return $this->dealerID;
    }

    public function setDealerID($dealerID)
    {
        return $this->dealerID = $dealerID;
    }

    public function getInStock()
    {
        return $this->inStock;
    }

    public function setInStock($inStock)
    {
        return $this->inStock = $inStock;
    }

    public function getAvailable()
    {
        return $this->available;
    }

    public function setAvailable($available)
    {
        return $this->available = $available;
    }

    public function getDownloadable()
    {
        return $this->downloadable;
    }

    public function setDownloadable($downloadable)
    {
        return $this->downloadable = $downloadable;
    }

    public function getPrice()
    {
        return $this->price;
    }

    public function setPrice($price)
    {
        return $this->price = $price;
    }

    public function getDiscountPrice()
    {
        return $this->discountPrice;
    }

    public function setDiscountPrice($discountPrice)
    {
        return $this->discountPrice = $discountPrice;
    }

    public function getCategory()
    {
        return $this->category;
    }

    public function setCategory($category)
    {
        return $this->category = $category;
    }

    public function getPicture()
    {
        return $this->picture;
    }

    public function setPicture($picture)
    {
        return $this->picture = $picture;
    }

    public function getAnnotation()
    {
        return $this->annotation;
    }

    public function setAnnotation($annotation)
    {
        return $this->annotation = $annotation;
    }

    public function getTermsConditions()
    {
        return $this->termsConditions;
    }

    public function setTermsConditions($termsConditions)
    {
        return $this->termsConditions = $termsConditions;
    }

    public function getActivationRules()
    {
        return $this->activationRules;
    }

    public function setActivationRules($activationRules)
    {
        return $this->activationRules = $activationRules;
    }

    public function getTermsOfUse()
    {
        return $this->termsOfUse;
    }

    public function setTermsOfUse($termsOfUse)
    {
        return $this->termsOfUse = $termsOfUse;
    }

    public static function getAll()
    {
        $collection = [];
        $result = DB::query("SELECT * FROM products");
        if (is_array($result) && count($result) > 0) {
            foreach ($result as $el) {
                $data = [];
                foreach (self::$fields as $k => $field) {
                    $data[$field] = $el[$k];
                }
                $collection[] = new Product($data);
            }
        }

        return $collection;
    }

    public static function getById($id, $forApi = true)
    {
        if (\is_array($id) && array_key_exists('id', $id)) $id = $id['id'];
        $product = null;
        $result = DB::query("SELECT * FROM products WHERE id=" . $id);
        if (is_array($result) && count($result) > 0) {
            foreach ($result as $el) {
                $data = [];
                foreach (self::$fields as $k => $field) {
                    $data[$field] = $el[$k];
                }
                $tmp = new Product($data);
                $product = $forApi ? get_object_vars($tmp) : $tmp;
            }
        }

        if ($forApi) {
            header('Content-Type: application/json');
            echo json_encode($product, JSON_PRETTY_PRINT);
        } else {
            return $product;
        }
    }

    public static function getAllByCategory($category, $forApi = true)
    {
        $collection = [];
        if (\is_numeric($category)) {
            if ($category > 0) {
                $category = Category::getById($category, false);
                $category = $category->getName();
            } else {
                $category = '';
            }
        }
        $where = $category ? "WHERE category='$category'" : "";
        $result = DB::query("SELECT * FROM products $where ORDER BY id DESC LIMIT 20");
        if (is_array($result) && count($result) > 0) {
            foreach ($result as $el) {
                $data = [];
                foreach (self::$fields as $k => $field) {
                    $data[$field] = $el[$k];
                }
                $collection[] = new Product($data);
            }
        }

        return $collection;
    }

    public function save()
    {
        $result = DB::query("SELECT * FROM products WHERE id=" . $this->id);
        if (is_array($result) && count($result) > 0) {
            $q = 'UPDATE products SET';
            $q .= " name='" . $this->name . "'";
            $q .= ", vendor='" . $this->vendor . "'";
            $q .= ", model='" . $this->model . "'";
            $q .= ", vendorCode='" . $this->vendorCode . "'";
            $q .= ", typePrefix='" . $this->typePrefix . "'";
            $q .= ", groupId=" . $this->groupId;
            $q .= ", dealerID=" . $this->dealerID;
            $q .= ", inStock=" . $this->inStock;
            $q .= ", available=" . $this->available;
            $q .= ", downloadable=" . $this->downloadable;
            $q .= ", price=" . $this->price;
            $q .= ", discountPrice=" . $this->discountPrice;
            $q .= ", category='" . $this->category . "'";
            $q .= ", picture='" . $this->picture . "'";
            $q .= ", annotation='" . is_array($this->annotation) ? implode(', ', $this->annotation) : $this->annotation . "'";
            $q .= ", termsConditions='" . is_array($this->termsConditions) ? null : $this->termsConditions . "'";
            $q .= ", activationRules='" . is_array($this->activationRules) ? null : $this->activationRules . "'";
            $q .= ", termsOfUse='" . is_array($this->termsOfUse) ? null : $this->termsOfUse . "'";
            $q .= ' WHERE id=' . $this->id;
        } else {
            $values = [];
            foreach (self::$fields as $field) {
                switch ($field) {
                    case 'price':
                    case 'discountPrice':
                        $values[] = floatval(str_replace(',', '.', $this->$field));
                        break;
                    case 'available':
                    case 'downloadable':
                        $values[] = boolval($this->$field);
                        break;
                    case 'id':
                    case 'groupId':
                    case 'dealerID':
                    case 'inStock':
                        $values[] = intval($this->$field);
                        break;
                    default:
                        $values[] = $this->$field && !is_array($this->$field) ? "'" . $this->$field . "'" : "''";
                        break;
                }
            }

            $q = "INSERT INTO products (" . \implode(', ', self::$fields) . ")";
            $q .= " VALUES (" . \implode(', ', $values) . ")";
        }

        return DB::query($q);
    }

}
