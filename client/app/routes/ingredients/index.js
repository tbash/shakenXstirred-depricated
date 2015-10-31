import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  model: function() {
    return this.store.findAll('ingredient');
  },
  actions: {
    addToInventory() {
      this.get('ingredient');
      debugger;
    },

    updateInventory() {
      var checkedIngredients = this.get('checkedIngredients');
      Ember.$.ajax({
        type: "PUT",
        url: (this.store.adapterFor('this.constructor.typeKey').host + "/update_ingredients"),
        data: { API_KEY: this.get("session.data.authenticated.access_token"), ingredients: checkedIngredients }
      });
    },

    updateWarning() {
      this.notifications.clearAll();
      this.notifications.addNotification({
          message: 'press the Update Inventory button when finished updating',
          type: 'warning',
          autoClear: true,
          clearDuration: 4000
      });
    }
  }
});
