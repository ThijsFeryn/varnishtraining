<?php
if(isset($_GET['no'])) {
   header('Cache-control: private, no-cache, no-store');
} else {
   header('Cache-control: public, s-maxage=10');
} 

if(!isset($_COOKIE['lang'])){
    setcookie('lang',$_SERVER['HTTP_ACCEPT_LANGUAGE']);
}
echo "Lang: ".$_COOKIE['lang']." ".date('Y-m-d H:i:s');
