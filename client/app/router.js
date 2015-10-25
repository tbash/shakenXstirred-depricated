import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('login');
  this.route('signup');

  this.resource('cocktails', function() {
    this.resource('cocktail', { path: '/:cocktail_id' });
  });

  this.route('ingredients', {}, function() {});
});

export default Router;
