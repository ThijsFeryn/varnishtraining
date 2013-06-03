<?php
if(!isset($_COOKIE['time'])){
    setcookie('time',date('Y-m-d H:i:s'));
}
?>
<h1>Exercise 3</h1>
<h2>Cookies</h2>
<?php
echo 'Current date/time: '.date("Y-m-d H:i:s").'<br/>';
if(isset($_COOKIE['time'])){
    echo "Cookie detected: ".$_COOKIE['time'].'<br />';
}
?>
<a href="/">Back to index</a>