[![Stories in Ready](https://badge.waffle.io/teebash/shakenXstirred.png?label=ready&title=Ready)](https://waffle.io/teebash/shakenXstirred)
## Shaken/Stirred


#### Separate front-end and back-end
* Separated by client and JSON API
* Trying rails 5 and the --api flag
* [Rails5!!](http://github.com/rails/rails)
* [Git](http://git-scm.com/)
* [Node.js](http://nodejs.org/) (with NPM)

##### Dev Env setup
* Clone it
* `vagrant up`
* `vagrant ssh`
* `cd /srv/shaken_slash_stirred/api`
* `bundle`
* `./bin/rails s`
* `./bin/rake db:create db:migrate db:seed`
* Check out the back-end [here](http://33.33.33.33:3000)
* In another tab, `cd client`
* `npm install`
* `npm start`
* Check out the front-end [here](http://localhost:8000)
* Please note that in this project the use of ./bin/rails or bin/rails is required for normal rails ops


### Example cURL usage
* POST Login: `$ curl -H "Content-Type:application/json" -d '{"username":"tbash","password":"password"}' http://33.33.33.33:3000/sessions`
* POST Update Inventory: `$ curl -H "Content-Type:application/json" -H "auth_token:1:3a6528ef0b0ee1bc6b8dfbfbd39677cc" -d '{"ingredient_ids":[1, 2]}' http://33.33.33.33:3000/update_inventory`
* GET Feed: `curl -H "Content-Type:application/json" -H "auth_token:1:3a6528ef0b0ee1bc6b8dfbfbd39677cc" http://33.33.33.33:3000/feed`
* POST Follow: `$ curl -H "Content-Type:application/json" -H "auth_token:1:3a6528ef0b0ee1bc6b8dfbfbd39677cc" -X POST http://33.33.33.33:3000/users/7/follow`
