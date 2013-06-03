<?php
$challenge = $argv[1];
$secret = trim(fgets(STDIN));
$pack = $challenge . "\x0A" . $secret . "\x0A" . $challenge . "\x0A";
$key = hash('sha256', $pack);
echo $key.PHP_EOL;