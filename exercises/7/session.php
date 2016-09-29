<?php
session_start();
echo "Session ID: ".session_id().", listening on port: ".$_SERVER['SERVER_PORT'].PHP_EOL;
