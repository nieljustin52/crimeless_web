<?php
session_start();
include('includes/connect.php');

// Get the admin ID and form data
$id = $_GET['id'];
$a = $_POST['name'];
$b = $_POST['email'];
$d = $_POST['phone'];
$e = $_POST['address'];

// Check if email or phone already exists (excluding the current ID)
$query = "SELECT * FROM admin WHERE (email = :email OR phone = :phone) AND id != :id";
$stmt = $db->prepare($query);
$stmt->execute(array(':email' => $b, ':phone' => $d, ':id' => $id));

if ($stmt->rowCount() > 0) {
    echo "<script>alert('Email or phone number already exists. Please choose a different one.');</script>";
    echo "<script>window.location.href ='users.php'</script>";
} else {
    // Check if a new profile picture was uploaded
    if (isset($_FILES['photo']) && $_FILES['photo']['error'] === UPLOAD_ERR_OK) {
        $file_name  = strtolower($_FILES['photo']['name']);
        $file_ext = substr($file_name, strrpos($file_name, '.'));
        $prefix = 'admin_' . md5(time() * rand(1, 9999));
        $file_name_new = $prefix . $file_ext;
        $path = '../../uploads/' . $file_name_new;

        // Move the uploaded file to the uploads directory
        if (move_uploaded_file($_FILES['photo']['tmp_name'], $path)) {
            // Update the admin record with the new profile picture
            $sql = "UPDATE admin SET name = :a, email = :b, phone = :d, address = :e, photo = :f WHERE id = :id";
            $q = $db->prepare($sql);
            $q->execute(array(':a' => $a, ':b' => $b, ':d' => $d, ':e' => $e, ':f' => $file_name_new, ':id' => $id));
            
            if ($q) {
                // Update session variables
                $_SESSION['SESS_FIRST_NAME'] = $a;
                $_SESSION['SESS_EMAIL'] = $b;
                $_SESSION['SESS_PHONE_NUMBER'] = $d;
                $_SESSION['SESS_ADDRESS'] = $e;
                
                echo "<script>alert('Your account has been updated successfully!');</script>";
                echo "<script>window.location.href ='users.php'</script>";
            } else {
                echo "<script>alert('Something went wrong, please try again.');</script>";
                echo "<script>window.location.href ='users.php'</script>";
            }
        } else {
            echo "<script>alert('Error uploading the file.');</script>";
            echo "<script>window.location.href ='users.php'</script>";
        }
    } else {
        // Update the admin record without changing the profile picture
        $sql = "UPDATE admin SET name = :a, email = :b, state = :c, phone = :d, address = :e WHERE id = :id";
        $q = $db->prepare($sql);
        $q->execute(array(':a' => $a, ':b' => $b, ':d' => $d, ':e' => $e, ':id' => $id));
        
        if ($q) {
            // Update session variables
            $_SESSION['SESS_FIRST_NAME'] = $a;
            $_SESSION['SESS_EMAIL'] = $b;
            $_SESSION['SESS_PHONE_NUMBER'] = $d;
            $_SESSION['SESS_ADDRESS'] = $e;
            
            echo "<script>alert('Your account has been updated successfully!');</script>";
            echo "<script>window.location.href ='users.php'</script>";
        } else {
            echo "<script>alert('Something went wrong, please try again.');</script>";
            echo "<script>window.location.href ='users.php'</script>";
        }
    }
}
?>
