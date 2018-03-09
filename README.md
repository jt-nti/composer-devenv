# composer-devenv

[Vagrant](https://www.vagrantup.com) environment to help get started with [Hyperledger Composer](https://hyperledger.github.io/composer/).


## Ingredients

You'll need to stock your machine with all these healthy ingredients if you don't have them already:

1. [VirtualBox](https://www.virtualbox.org/)
2. [Vagrant](https://www.vagrantup.com/docs/installation/)
3. [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

## Method

To configure a development environment for the latest stable release of Composer, run the following command:

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

For example, to install a slightly less stable weekly release of Composer with all the hyperlegendary new features:

```
COMPOSER_VERSION=next vagrant up
```

Or on Windows:

```
set COMPOSER_VERSION=next
vagrant up
```
