# Installation

- install [brew](http://brew.sh/#install)

    ```
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ```

- install software dependencies

    ```
    brew tap caskroom/cask
    brew cask install virtualbox
    brew cask install vagrant
    ```

- setup project

    ```
    cd ~/Code
    git clone git@github.com:mdzhang/sinatra-vagrant-test.git
    cd sinatra-vagrant-test
    vagrant up
    ```

- view app at

    ```
    http://localhost:4567
    ```

### Resources

- http://brew.sh/#install
- https://caskroom.github.io/
- http://sourabhbajaj.com/mac-setup/Vagrant/README.html
- https://www.vagrantup.com/docs/getting-started/project_setup.html
- https://atlas.hashicorp.com/vagrant
- https://gorails.com/setup/ubuntu/14.04