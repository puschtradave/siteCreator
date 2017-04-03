<?php

//define('HOST', 'https://web06.sbls.at/ ');
//define('USER', 'dav001rksql1');
//define('PASS', 'wtdbyhxvca');
//define('DB', 'dav001rksql1');

define('HOST', 'localhost');
define('USER', 'root');
define('PASS', '');
define('DB', 'invoicekoeberl');

//alter table saved_tours AUTO_INCREMENT = 112

function connectDB($sql){
    $conn = new mysqli(HOST, USER, PASS, DB);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $ret["result"] = $conn->query($sql);
    $ret["connect"] = $conn;
    $ret["insert_id"] = $conn->insert_id;
    return $ret;
}


function getFromDB($sql, $shorten = true){
    $data = array();
    // Create connection

    $db = connectDB($sql, false);
    $result = $db["result"];
    $conn = $db["connect"];

    if ($result && $result->num_rows > 0) {
        // output data of each row
        while ($row = $result->fetch_assoc()) {
            $tmp_row = array();
            foreach($row as $key => $value){
                $tmp_row[$key] = utf8_encode($value);
            }
            $data[] = $tmp_row;
        }
    }
    if(count($data) == 0) return false;
    $conn->close();
    if(count($data) == 1 && $shorten) return $data[0];
    else return $data;
}

function escape_string($string){
    $conn = new mysqli(HOST, USER, PASS, DB);
    $string = utf8_encode($string);
    return $conn->real_escape_string($string);
}

function hostile2Normal($string){
    $string = preg_replace("/[^\d\w@.]+/", "", $string);
    return $string;
}
