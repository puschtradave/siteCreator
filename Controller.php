<?php

require_once "model/connect.php";

setlocale(LC_ALL, 'de_DE');
setlocale(LC_TIME, 'de_DE', 'deu_deu');

if (isset($_REQUEST)) {
    $controller = new Controller();
    $controller->handle();
}


function __autoload($class_name)
{
    require_once 'model/' . $class_name . '.php';
    require_once('model/connect.php');
}


class Controller
{

    function __construct()
    {

    }

    /**
     * request handler.
     */
    public function handle()
    {

        if (isset($_REQUEST["view"])) {
            echo $this->getData("view/" . $_REQUEST["view"]);
        } else if (isset($_REQUEST["model"])) {
            return $this->callModel($_REQUEST["model"]);
        }
//        else if (empty($_REQUEST)) {
//            return $this->getData("main");
//        } else if (isset($_REQUEST["model"]) && $_REQUEST["model"] == "Login") {
//            return Member::login($_REQUEST["email"], $_REQUEST["password"]);
//        } else if (isset($_REQUEST["model"]) && $_REQUEST["model"] == "Logout") {
//            return Member::logout();
//        } else if (isset($_REQUEST["model"])) {
//            return $this->callModel($_REQUEST["model"], $_REQUEST);
//        }
    }

//    public function render($view)
//    {
//        ob_start();
//        include $view;
//        $output = ob_get_contents();
//        ob_end_clean();
//        return $output;
//    }

    /**
     * get data from view.
     *
     * @return content.
     */
    public function getData($fileDir)
    {
        $file = $fileDir;
        if (file_exists($file)) {
            ob_start();
            include $file;
            $output = ob_get_contents();
            ob_end_clean();
            return $output;
        } else {
            return false;
        }
    }

    public function callModel($model)
    {
        switch ($model) {
            case "Customer":
                $classCust = new Customer;
                $classCust->custRequest();
                break;
            case "Other":
                $classCust = new Other;
                $classCust->otherRequest();
                break;
        }
    }

    public function getAll($table, $sort = false)
    {
        $sql = "SELECT * FROM $table";
        if ($sort) $sql = $sql . " ORDER BY " . $sort . " ASC;";
//        echo $sql;
        return getFromDB($sql);
    }

    public function getByOne($table, $colname, $colval, $sort = false, $shorten = true)
    {
        if ($shorten == "noshorten") $shorten = false;
        if ($sort == "nosort") $sort = false;
        $sql = "SELECT * FROM $table WHERE $colname = $colval";
        if ($sort) $sql = $sql . " ORDER BY " . $sort . " ASC;";
//        echo $sql;
        return getFromDB($sql, $shorten);
    }

    public function getByTwo($table, $col1name, $col1val, $col2name, $col2val, $sort = false, $shorten = true)
    {
        if ($shorten == "noshorten") $shorten = false;
        if ($sort == "nosort") $sort = false;
        $sql = "SELECT * FROM $table WHERE $col1name = $col1val AND $col2name = $col2val";
        if ($sort) $sql = $sql . " ORDER BY " . $sort . " ASC;";
//        echo $sql;
        return getFromDB($sql, $shorten);
    }

    public function getJoin2($table1, $table2, $on1, $on2, $shorten = false)
    {
        $sql = "SELECT * FROM $table1 INNER JOIN $table2 WHERE $table1.$on1 = $table2.$on2";
        echo $sql;
        return getFromDB($sql, $shorten);
    }

}
