# Installation

- install [brew](http://brew.sh/#install)

    ```
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ```

- install software dependencies

    ```
    brew install rbenv ruby-build
    brew tap caskroom/cask
    brew cask install virtualbox
    brew cask install vagrant
    ```

- configure dependencies

    ```
    echo -e '\neval "$(rbenv init -)"' >> ~/.bash_profile
    source ~/.bash_profile
    rbenv install $(cat ./.ruby-version)
    rbenv global $(cat ./.ruby-version)
    gem update --system
    gem install bundler
    rbenv rehash
    ```

- install project dependencies

    ```
    bundle install
    ```

- start project

    ```
    ruby myapp.rb // View at: http://localhost:4567
    ```

### Resources

- http://brew.sh/#install
- https://caskroom.github.io/
- http://sourabhbajaj.com/mac-setup/Vagrant/README.html