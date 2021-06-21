<?php
    $categories = App\Model\Category::getByParentId($args['id'], false);
    $current = App\Model\Category::getById($args['id'], false);
    $parent = $current->getParentId() > 0 ? App\Model\Category::getById($current->getParentId(), false) : null;
    var_dump($args);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

    <style>
        body {
            font-family: "Lato", sans-serif;
        }

        .sidenav {
            height: 100%;
            width: 350px;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #111;
            overflow-x: hidden;
            padding-top: 20px;
        }

        .sidenav a {
            padding: 6px 8px 6px 16px;
            text-decoration: none;
            font-size: 25px;
            color: #818181;
            display: block;
        }

        .sidenav a:hover {
            color: #f1f1f1;
        }

        .main {
            margin-left: 160px; /* Same as the width of the sidenav */
            font-size: 28px; /* Increased text to enable scrolling */
            padding: 0px 10px;
        }

        @media screen and (max-height: 450px) {
            .sidenav {padding-top: 15px;}
            .sidenav a {font-size: 18px;}
        }
</style>
</head>

<body>

    <div class="sidenav">
        <a href="/">Main page</a>
        <?php
            if ($parent) {
                echo "<a href='/category/" . $parent->getId() . "'  class='my-3'>Back - " . $parent->getName() . "</a>";
            }

            if ($current) {
                echo "<a href='/category/" . $current->getId() . "'  class='my-3 fs-3 text-warning'>" . $current->getName() . "</a>";
            }

            foreach ($categories as $el) {
                echo "<a href='/category/" . $el->getId() . "'>" . $el->getName() . "</a>";
            }
        ?>
    </div>

    <div class="main">

    </div>
    <script>
        function send() {
            fetch('/test', {
                method: 'POST',
            }).then(function (response) {
                console.log(response)
            }).catch(function (error) {
                console.log(error);
            });
        }

        function go($id) {
            fetch('/test', {
                method: 'POST',
            }).then(function (response) {
                console.log(response)
            }).catch(function (error) {
                console.log(error);
            });
        }
    </script>
</body>

</html>