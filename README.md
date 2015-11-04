[![Stories in Ready](https://badge.waffle.io/teebash/shaken_slash_stirred.png?label=ready&title=Ready)](https://waffle.io/teebash/shaken_slash_stirred)
## Shaken/Stirred


#### Separate front-end and back-end
* Separated by client and JSON API
* Trying rails 5 and the --api flag
* [Rails5!!](http://github.com/rails/rails)
* [Git](http://git-scm.com/)
* [Node.js](http://nodejs.org/) (with NPM)
* [Bower](http://bower.io/)
* [Ember CLI](http://www.ember-cli.com/)
* [PhantomJS](http://phantomjs.org/)

##### Dev Env setup
* Clone
* `vagrant up`
* `vagrant ssh`
* `cd /srv/shaken_slash_stirred/api`
* `bundle`
* `bundle exec ./bin/rails s`
* Check out the back-end [here](http://33.33.33.33:3000)
* In another tab, `cd client`
* `npm install && bower install`
* `ember serve`
* Check out the front-end [here](http://localhost:4200)
* Please note that in this project the use of ./bin/rails or bin/rails is required for the rails cli
