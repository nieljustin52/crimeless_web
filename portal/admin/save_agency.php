<?php

session_start();
include('includes/connect.php');

$a = $_POST['agency_name'];
$b = $_POST['phone_number'];
$c = $_POST['email'];
$e = $_POST['username'];
$f = $_POST['password'];
$h = $_POST['address'];
$i = $_POST['agency_id'];

// query

$file_name  = strtolower($_FILES['photo']['name']);
$file_ext = substr($file_name, strrpos($file_name, '.'));
$prefix = 'agency'.md5(time()*rand(1, 9999));
$file_name_new = $prefix.$file_ext;
$path = '../../uploads/'.$file_name_new;


    /* check if the file uploaded successfully */
    if(@move_uploaded_file($_FILES['photo']['tmp_name'], $path)) {

  //do your write to the database filename and other details   
        $sql = "INSERT INTO agency (agency_name,phone_number,email,username,password,address,agency_id,photo) VALUES (:a,:b,:c,:e,:f,:h,:i,:j)";
$q = $db->prepare($sql);
$q->execute(array(':a'=>$a,':b'=>$b,':c'=>$c,':e'=>$e,':f'=>$f,':h'=>$h,':i'=>$i,':j'=>$file_name_new));
if($q){
      header("location:add-agency.php?success=true");
        }else{
            header("location:add-agency.php?failed=true");
        } 
		}
		?>