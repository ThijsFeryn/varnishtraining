<?php
try {
    $site = 'fcb.support';
    $file = '/Users/'.get_current_user().'/Library/Application Support/Google/Chrome/Default/Cookies';
    if(PHP_OS != 'Darwin') {
        throw new Exception("only works on Mac");
    }
    if(!is_readable($file)) {
        throw new Exception("cookie file not found");
    }
    $db = new SQLite3($file);
    $db->exec('DELETE FROM cookies WHERE host_key=\''.$site.'\'');
    $db->exec('DELETE FROM cookies WHERE host_key=\'.'.$site.'\'');
    unset($db);
    exit(0);
} catch (Exception $e) {
    echo "An error occured while trying to delete the 'varnishtraining.dev' cookies from Chrome: ".$e->getMessage().PHP_EOL;
    exit(1);
}