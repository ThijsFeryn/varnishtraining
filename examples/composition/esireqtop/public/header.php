<?php
header('Cache-control: no-cache');
echo '<ul>'.PHP_EOL;
echo '<li>Header: '.date('Y-m-d H:i:s').'</li>'.PHP_EOL;
echo '<li>URL: '.$_SERVER['REQUEST_URI'].'</li>'.PHP_EOL;
echo '<li>Parent URL: '.$_SERVER['HTTP_X_PARENT_URL'].'</li>'.PHP_EOL;
echo '</ul>'.PHP_EOL;
echo '<hr />'.PHP_EOL;