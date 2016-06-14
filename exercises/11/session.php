<?php
session_start();
header("Cache-Control: public,must-revalidate,s-maxage= 3600");
if(isset($_GET['logout'])){
    session_destroy();
    header("Location: ".$_SERVER['PHP_SELF']);
    exit();
}
?>
<h1>Exercise 11</h1>
<h2>Session cookies</h2>
<?php
echo 'Current date/time: '.date("Y-m-d H:i:s").'<br/>';
if(!isset($_SESSION['name'])){
    if(!isset($_POST['name'])){
?>
        <h4>Please enter your name</h4>
        <form method="POST">
            <label>Name:</label><input type="text" name="name" /><br />
            <label>Submit:</label><input type="submit" value="Login" /><br />
        </form>
<?php
    } else {
        $_SESSION['name'] = $_POST['name'];
        header("Location: ".$_SERVER['PHP_SELF']);
    }
} else {
    echo "<h4>Welcome {$_SESSION['name']}</h4>";
    echo "<a href='".$_SERVER['PHP_SELF']."?logout=true'>Logout</a><br />";
}
?>
<a href="/">Back to index</a>