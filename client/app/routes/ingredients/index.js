import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  model: function() {
    return this.store.findAll('ingredient');
  },
  actions: {

    addToInventory() {
      debugger;
    },

    updateInventory() {
      debugger;
      var spirits = this.get('spirits');
      
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
