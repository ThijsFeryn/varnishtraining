<?php
header('Cache-control: no-cache');
require dirname(__DIR__).'/guzzle.phar';
if(gethostname() == 'php') {
    $client = new GuzzleHttp\Client(['base_uri' => 'http://varnish:6081/']);
} else {
    $client = new GuzzleHttp\Client(['base_uri' => 'http://localhost:6081/']);
}

$response = $client->request('PURGE', '/');
if($response->getStatusCode() == 200) {
    echo "PURGED".PHP_EOL;
} else {
    echo $response->getBody();
}