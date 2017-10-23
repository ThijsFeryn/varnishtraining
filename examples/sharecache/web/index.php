<?php
header('Cache-control: public, s-maxage=10');
echo date('Y-m-d H:i:s').'<br />'.PHP_EOL;
echo "Run <pre>varnishlog -g request -i VCL_Log,ReqUrl</pre> on both servers to analyze <br />".PHP_EOL;