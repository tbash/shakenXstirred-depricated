import Ember from 'ember';
import DS from 'ember-data';

export default DS.ActiveModelAdapter.extend({
  host: 'http://33.33.33.100:3000',
  headers: Ember.computed('session.data.authenticated.access_token', function() {
    return {
       "API_KEY": this.get("session.data.authenticated.access_token")
    };
  })
});
