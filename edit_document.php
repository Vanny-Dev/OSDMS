<?php
include 'db_connect.php';
$qry = $conn->query("SELECT * FROM documents where id = ".$_GET['id'])->fetch_array();
foreach($qry as $k => $v){
	if ($k == 'title')
		$k = 'ftitle';
	$$k = $v;
}
define("IS_EDIT", true);
include 'document_form.php';
?>