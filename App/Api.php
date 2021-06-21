<?php
namespace App;

class API
{
    const SUCCESS = 2;

    static protected $server = "https://test.mgc-loyalty.ru/v1/";
    static protected $login = "openbroker";
    static protected $password = "yw4Tb8vK";
    
    public static function getCategories()
    {
        $method = 'GetCategories';
        $url = self::$server . $method;
        $auth = self::setAuth($method);

        $request = <<<XML
<?xml version="1.0" encoding="utf-8"?>
<Request>
    {$auth}
</Request>
XML;

        $status = true;
        $response = self::sendRequest($url, $request);
        if ($response['Status'] == API::SUCCESS) {
            require_once('./App/Model/Category.php');
            foreach ($response['Categories']['Category'] as $value) {
                Model\Category::create($value['@attributes']['id'], $value['@attributes']['parentId'] ?? 0, $value['name']);
            }
        } else {
            $status = false;
        }

        return $status;
    }

    public static function getProductsByCategory($categoryId)
    {
        $method = 'GetProduct';
        $url = self::$server . $method;
        $auth = self::setAuth($method);

        $request = <<<XML
<?xml version="1.0" encoding="utf-8"?>
<Request>
    {$auth}

<Parameters>
    <Limit offset="0" row_count="500"/>
    <Categories>
        <Category>{$categoryId}</Category>
    </Categories>
 </Parameters>
</Request>
XML;

        $status = true;
        $response = self::sendRequest($url, $request);
        if ($response['Status'] == API::SUCCESS) {
            \file_put_contents('test1.txt', print_r($response, true));
            require_once('./App/Model/Product.php');
            foreach ($response['Products']['Product'] as $value) {
                if (is_array($value))
                    Model\Product::create($value);
            }
        } else {
            $status = false;
        }

        return $status;
    }

    public static function getProducts()
    {
        require_once('./App/Model/Category.php');
        $categories = Model\Category::getAll();

        foreach ($categories as $category) {
            self::getProductsByCategory($category->getId());
        }

        return true;
    }

    static function sendRequest(string $url, string $request)
    {
        $curl = curl_init($url);
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_HTTPHEADER, [
            'Content-Type: text/xml; charset=utf-8',
            'Content-Length: ' . strlen($request)
        ]);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $request);
        $response = self::XmlToArray(curl_exec($curl));
        curl_close($curl);

        return $response;
    }

    static function XmlToArray(string $str)
    {
        $xml = simplexml_load_string($str);
        $json = json_encode($xml);
        return json_decode($json, TRUE);
    }

    static private function setAuth(string $method)
    {
        $transationID = time();
        $login = self::$login;
        $password = self::$password;
        $hash = md5($transationID . $method . $login . $password);

        $auth = <<<XML
    <Authentication>
        <Login>{$login}</Login>
        <TransactionID>{$transationID}</TransactionID>
        <MethodName>{$method}</MethodName>
        <Hash>{$hash}</Hash>
    </Authentication>
XML;

        return $auth;
    }

}
