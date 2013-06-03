# Varnish training

## When your internet connection is fast enough

If your internet connection is fast enough, Vagrant will automatically download the base box and set up the machine.

1.  `vagrant up`
2.  Add `10.10.10.6 varnish.dev` to your hosts file
3.  Go to [http://varnish.dev/exercises](http://varnish.dev/exercises) to continue

## When your internet connection is rather slow

If your internet connection is too slow, you might want to download the base box first before heading out to a place that has a slow internet connection.  Register your base box in Vagrant and you're good to go.

1.  Download [the vagrant base box](http://download.feryn.eu/varnishtraining.box) on a fast connection
2.  `vagrant box add varnishtraining varnishtraining.box`

    Execute on a slow connection to add the downloaded box
    
3.  `vagrant up`

    Boot the VM 
    
4.  Add `10.10.10.6 varnish.dev` to your hosts file
5.  Go to [http://varnish.dev/exercises](http://varnish.dev/exercises) to continue

## Customizing your VM or using your own base box

If you want to customize your VM or use your own base box, you can use the Puppet manifests that are located in the *tools* folder.

1.  Remove or rename *VagrantFile*
2.  Copy *Vagrantfile-puppet* from *tools* into your project root
3.  Customize the VagrantFile or Puppet manifests
4.  `vagrant up`
5.  Add `10.10.10.6 varnish.dev` to your hosts file
6.  Go to [http://varnish.dev/exercises](http://varnish.dev/exercises) to continue