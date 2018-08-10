# composer-devenv

[Vagrant](https://www.vagrantup.com) environment to help get started with [Hyperledger Composer](https://hyperledger.github.io/composer/).


## Ingredients

You'll need to stock your machine with all these healthy ingredients if you don't have them already:

1. [VirtualBox](https://www.virtualbox.org/)
2. [Vagrant](https://www.vagrantup.com/docs/installation/)
    - **Note:** composer-devenv requires Vagrant 2.0.3 or greater
3. [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

## Method

To configure a development environment for the latest stable release of Composer (the **0.20.x** stream), run the following commands:

```
git clone https://github.com/jt-nti/composer-devenv.git
cd composer-devenv
vagrant up
```

When the development environment has finished cooking, log in using:

```
vagrant ssh
```

## Serving suggestion

Now that you have a working development environment, why not try one of the [Composer tutorials](https://hyperledger.github.io/composer/latest/tutorials/tutorials)?

## Alternative toppings

To install specific versions of Composer, set a `COMPOSER_VERSION` environment variable before running `vagrant up`. 

For example, to install an older version of Composer with Fabric 1.1 support (the **0.19.x** stream) use:

```
COMPOSER_VERSION=0.19.14 vagrant up
```

Or on Windows:

```
set COMPOSER_VERSION=0.19.14
vagrant up
```

Supported `COMPOSER_VERSION` values:

- `latest` for the latest **0.20.x** release
- Specific `0.16`, `0.18`, `0.19` or `0.20` version numbers
- `none` to skip the Composer install

## Cooking tips

### Extra dishes

If you want to set up several VMs with different versions, or for different purposes, you can clone the _composer-devenv_ repository into different directories. For example,

```
git clone https://github.com/jt-nti/composer-devenv.git composer-tutorial
```

Or simply copy an existing clone. The different directory names should show up in the VirtualBox UI after running `vagrant up` if you need to update the VM settings for any of your environments.

### Clearing up

When you've finished with a development environment you can suspend it using `vagrant suspend` and resume later using `vagrant up`

Alternatively, if you've finished with Composer or want to start again, `vagrant destroy` will completely remove the virtual machine.
