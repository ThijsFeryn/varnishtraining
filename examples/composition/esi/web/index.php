<?php
header('Cache-control: public, s-maxage=10');
header('Surrogate-control: content="ESI/1.0"');
echo "<esi:include src=\"/header.php\" />";
echo date('Y-m-d H:i:s').'<br />'.PHP_EOL;