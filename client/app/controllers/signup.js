import Ember from 'ember';
 
export default Ember.Controller.extend({
  actions: {
    create: function() {
      var name = this.get('name');
      var password = this.get('password');
      var password_confirmation = this.get('password_confirmation');                         
      var user = this.store.createRecord('user', {
        name: name,
        password: password,
        password_confirmation: password_confirmation
      });

      user.save();
    }
  }
});
