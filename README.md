# Varnish training

## Depencencies

These exercises depend on [Vagrant](http://vagrantup.com) and [Virtualbox](http://www.virtualbox.org). Depending on your system, you might need to download [Ruby](http://www.ruby-lang.org). And don't forget to install [Git](http://git-scm.com), otherwise you can't clone this repo to your computer.

## Setup

If your internet connection is fast enough, Vagrant will automatically download the base box and set up the machine.

1.  `vagrant up`
2.  Add `10.10.10.6 varnish.dev` to your hosts file
3.  Go to [http://varnish.dev/](http://varnish.dev/) to continue

## Customizing your VM or using your own base box

If you want to customize your VM or use your own base box, you can use the Puppet manifests that are located in the *tools* folder.

1.  Remove or rename *VagrantFile*
2.  Copy *Vagrantfile-puppet* from *tools* into your project root
3.  Customize the VagrantFile or Puppet manifests
4.  `vagrant up`
5.  Add `10.10.10.6 varnish.dev` to your hosts file
6.  Go to [http://varnish.dev/](http://varnish.dev/) to continue
