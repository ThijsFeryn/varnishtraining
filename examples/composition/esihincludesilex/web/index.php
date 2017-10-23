<?php
use Symfony\Component\HttpFoundation\Response;
require_once dirname(__DIR__).'/vendor/autoload.php';
$app = new Silex\Application();
$app['debug'] = true;
$app->register(new Silex\Provider\TwigServiceProvider(), [
    'twig.path' => dirname(__DIR__).'/views'
]);
$app->register(new Silex\Provider\HttpCacheServiceProvider());
$app->register(new Silex\Provider\HttpFragmentServiceProvider());
$app->get('/', function() use($app) {
    $response = new Response($app['twig']->render('index.twig'));
    $response->setSharedMaxAge(10);
    return $response;
});
$app->get('/header', function() use($app) {
    $response = new Response($app['twig']->render('header.twig'));
    $response->setPrivate();
    return $response;
})->bind('header');
$app->get('/footer', function() use($app) {
    $response = new Response($app['twig']->render('footer.twig'));
    $response->setSharedMaxAge(3);
    return $response;
})->bind('footer');
$app->run();