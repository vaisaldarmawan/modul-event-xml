<?php
        //get xml file
        $xml=simplexml_load_file("event2.xml") or die(" Error: Cannot create object ");
        //variable
        $id = $xml->attributes()->id;
        $lat = $xml->attributes()->lat;
        $lon = $xml->attributes()->lon;
        $mag = $xml->attributes()->mag;
        $datetime = $xml->attributes()->year."-".$xml->attributes()->month."-".$xml->attributes()->day;
        $datetime .= " ".$xml->attributes()->hour.":".$xml->attributes()->minute.":".$xml->attributes()->second;
        $timezone = $xml->attributes()->timezone;
        $depth = $xml->attributes()->depth;
        $type = $xml->attributes()->type;
        $created = $xml->attributes()->created;
        $locstring = $xml->attributes()->locstring;
        $upt = $argv[1];

        //get config data
        $data = parse_ini_file("../config.cfg");

        //login mysql
        $servername = $data['db_ip'];
        $username = $data['db_username'];
        $password = $data['db_password'];
        $dbname = $data['db_name'];
        $port = $data['db_port'];

        // Create connection
        $conn = new mysqli($servername, $username, $password, $dbname, $port);
        // Check connection
        if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
        }

        $sql = "INSERT INTO event
        VALUES (NULL,'$id', $lat, $lon, $mag, '$datetime', '$timezone', $depth, '$type', $created, '$locstring', '$upt')";

        if ($conn->query($sql) === TRUE) {
                //echo " OK ";
        } else {
                echo "Error: " . $sql . "\n" . $conn->error;
        }

        $conn->close();

?>
