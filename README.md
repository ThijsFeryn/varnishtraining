# Varnish training

## When your internet connection is fast enough
1.  `vagrant up`
2.  Add `10.10.10.6 varnish.dev` to your hosts file
3.  Go to [http://varnish.dev/exercises](http://varnish.dev/exercises) to continue

## When your internet connection is rather slow
1.  Download [the vagrant base box](http://download.feryn.eu/varnishtraining.box) on a fast connection
2.  `vagrant box add varnishtraining varnishtraining.box`

    Execute on a slow connection to add the downloaded box
    
3.  `vagrant up`

    Boot the VM 
    
4.  Add `10.10.10.6 varnish.dev` to your hosts file
5.  Go to [http://varnish.dev/exercises](http://varnish.dev/exercises) to continue