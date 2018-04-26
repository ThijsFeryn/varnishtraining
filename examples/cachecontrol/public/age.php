<?php
header("Age: 25");
header('Cache-control: s-maxage=30');
echo date('Y-m-d H:i:s').'<br />'.PHP_EOL;