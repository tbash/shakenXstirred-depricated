import Ember from 'ember';

export default Ember.Route.extend({
  model: function(params) {
    return this.store.findRecord('cocktail', params.cocktail_id);
  }
});
