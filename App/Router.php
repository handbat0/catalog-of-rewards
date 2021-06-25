<?php
namespace App;

require_once('./App/DB.php');
require_once('./App/Api.php');
require_once('./App/View.php');
require_once('./App/Model/Category.php');
require_once('./App/Model/Product.php');

use App\API; 
use App\View; 
use App\Model\Category; 
use App\Model\Product; 

class Router
{
    private $get = [];
    private $post = [];
    private $uri;
    private $args;
    private $method;

    public function __construct()
    {
        $query = \explode('&', $_SERVER['QUERY_STRING']);
        $this->args = [];
        foreach ($query as $value) {
            $tmp = \explode('=', $value);
            $this->args[$tmp[0]] = $tmp[1];
        }

        $this->uri = \explode('?', $_SERVER['REQUEST_URI'], -1);
        if (!$this->uri) $this->uri = $_SERVER['REQUEST_URI'];

        $this->method = $_SERVER['REQUEST_METHOD'];
    }

    public function getUri() {
        return $this->uri;
    }

    public function getArgs() {
        return $this->args;
    }

    public function get($route, $fun) {
        $this->get[$route] = $fun;
    }
    
    public function post($route, $fun) {
        $this->post[$route] = $fun;
    }

    public function request($route)
    {
        $callback = null;
        if (\strpos($route, '/category/') !== false) {
            $this->args['id'] = str_replace('/category/', '', $route);
            $route = '/category/{id}';
        }

        if (\strpos($route, '/product/') !== false) {
            $this->args['id'] = str_replace('/product/', '', $route);
            $route = '/product/{id}';
        }
     
        if ($this->method == 'GET' && 
        array_key_exists($route, $this->get)) 
            $callback = $this->get[$route]; 
        if ($this->method == 'POST' && 
        array_key_exists($route, $this->post)) 
            $callback = $this->post[$route]; 

        return \call_user_func($callback, $this->args);
    }
}

$router = new Router;

$router->get('/', [View::class, 'category']);
$router->get('/category/{id}', [View::class, 'category']);
$router->get('/product/{id}', [View::class, 'detail']);
$router->post('/product/{id}', [Product::class, 'getById']);

// get data from API
$router->get('/api/getAllCategories', [API::class, 'getCategories']);
$router->get('/api/getAllProducts', [API::class, 'getProducts']);

$router->request($router->getUri());


