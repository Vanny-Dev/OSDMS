<?php

$dbpswd = file_get_contents("passwd");

define("DB_PASSWORD", !$dbpswd ? "" : $dbpswd);

$conn = new mysqli('localhost', 'root', DB_PASSWORD, 'odss_db') 
	or die("Could not connect to mysql" . mysqli_error($con));
