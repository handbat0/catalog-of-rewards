<?php
namespace App;

class DB
{
    static protected $server = "127.0.0.1:3306";
    static protected $user = "homestead";
    static protected $password = "secret";
    static protected $db = "test";
    
    static private $connect = null;
    static private $instance = null;

    public static function connect()
    {
        if (!isset(self::$connect)) {
            $mysqli = new \mysqli(self::$server, self::$user, self::$password, self::$db);

            if ($mysqli -> connect_errno) {
                echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
                exit();
            }

            self::$connect = $mysqli;
        }

        return self::$connect;
    }

    public static function query(string $q)
    {
        $db = self::connect();
    
        $return = [];
        $result = $db->query($q);

        if (is_object($result) && $result->num_rows > 0) {
            $return = $result->fetch_all();
            $result->close();
        } else if (is_bool($result)) {
            $return = $result;
        }

        return $return;
    }


}
