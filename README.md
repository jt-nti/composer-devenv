# composer-devenv

[Vagrant](https://www.vagrantup.com) environment to help get started with [Hyperledger Composer](https://hyperledger.github.io/composer/).

To configure a development environment for the latest stable release of Composer, run the following command:

```
git clone https://github.com/jt-nti/composer-devenv.git
cd composer-devenv
COMPOSER_VERSION=latest vagrant up
```

For a slightly less stable weekly release of Composer with all the hyperlegendary new features, use `COMPOSER_VERSION=next` instead.
