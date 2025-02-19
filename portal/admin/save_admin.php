<?php

session_start();
include('includes/connect.php');

$a = $_POST['name'];
$b = $_POST['email'];
$d = $_POST['username'];
$e = $_POST['password'];
$f = $_POST['phone'];
$g = $_POST['agency_id'];
$h = $_POST['address'];


// Check if username, email, or phone already exist
$query = "SELECT * FROM admin WHERE username = :username OR email = :email OR phone = :phone";
$stmt = $db->prepare($query);
$stmt->execute(array(':username' => $d, ':email' => $b, ':phone' => $f));

if ($stmt->rowCount() > 0) {
    echo "<script>alert('Username, email, or phone number already exists. Please choose a different one.');</script>";
    echo "<script>window.location.href ='users.php'</script>";
} else {
    // check if a file was uploaded
    if(isset($_FILES['photo']) && $_FILES['photo']['error'] === UPLOAD_ERR_OK) {
        $file_name  = strtolower($_FILES['photo']['name']);
        $file_ext = substr($file_name, strrpos($file_name, '.'));
        $prefix = 'admin'.md5(time()*rand(1, 9999));
        $file_name_new = $prefix.$file_ext;
        $path = '../../uploads/'.$file_name_new;

        // move uploaded file to destination
        if(move_uploaded_file($_FILES['photo']['tmp_name'], $path)) {
            // insert record into database with filename
            $sql = "INSERT INTO admin (name,email,state,username,password,phone,agency_id,address,photo) VALUES (:a,:b,:c,:d,:e,:f,:g,:h,:i)";
            $q = $db->prepare($sql);
            $q->execute(array(':a'=>$a,':b'=>$b,':d'=>$d,':e'=>$e,':f'=>$f,':g'=>$g,':h'=>$h,':i'=>$file_name_new));
            if($q){
                echo "<script>alert('Your account is created successfully! Login');</script>";
                echo "<script>window.location.href ='users.php'</script>";
            } else {
                echo "<script>alert('Something went wrong please try again');</script>";
                echo "<script>window.location.href ='users.php'</script>";
            } 
        }
    } else {
        // insert record into database without filename
        $sql = "INSERT INTO admin (name,email,state,username,password,phone,agency_id,address) VALUES (:a,:b,:c,:d,:e,:f,:g,:h)";
        $q = $db->prepare($sql);
        $q->execute(array(':a'=>$a,':b'=>$b,':d'=>$d,':e'=>$e,':f'=>$f,':g'=>$g,':h'=>$h));
        if($q){
            echo "<script>alert('Your account is created successfully! Login');</script>";
            echo "<script>window.location.href ='users.php'</script>";
        } else {
            echo "<script>alert('Something went wrong please try again');</script>";
            echo "<script>window.location.href ='users.php'</script>";
        } 
    }
}

?>
