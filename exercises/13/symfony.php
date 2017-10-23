<?php
require_once dirname(__FILE__) . '/silex/vendor/autoload.php';
use Symfony\Component\HttpKernel\HttpCache\Esi;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

$esi = new Esi;
$request = Request::createFromGlobals();
$response = new Response();

$content  = '<h1>Exercise 13</h1>';
$content .= '<h2>Edge Side Includes</h2>';
$content .= date("Y-m-d H:i:s").'<br/>';

if($esi->hasSurrogateCapability($request)){
        $content .= $esi->renderIncludeTag($request->getBasePath().'/edge.php?ttl=5',null,false).'<br />';
        $content .= $esi->renderIncludeTag($request->getBasePath().'/edge.php?ttl=0',null,false).'<br />';
}

$content .= '<br /><a href="/">Back to index</a>';

$response->setContent($content);
$esi->addSurrogateControl($response);
$response->setSharedMaxAge(10);
$response->send();