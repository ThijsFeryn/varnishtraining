<?php
if(isset($_GET['ttl'])){
    $ttl = (int)$_GET['ttl'];
} else {
    $ttl = 0;
}
header("Cache-Control: public,must-revalidate,s-maxage= {$ttl}");
echo "Edge side include expiring in {$ttl} seconds: ".date("Y-m-d H:i:s");