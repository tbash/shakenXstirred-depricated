import Ember from 'ember';
 
export default Ember.Controller.extend({
  session: Ember.inject.service('session'),
  
  actions: {
    create: function() {
      var nameRegex = /^[a-z0-9_-]{1,16}$/;
      var passwordRegex = /^[a-z0-9_-]{8,18}$/;
      var name = this.get('name');
      var password = this.get('password');
      var password_confirmation = this.get('password_confirmation');
      if (nameRegex.test(name) === false) {

      }
      else if (password !== password_confirmation === false) {

      }
      else if (passwordRegex.test(password)) {
        
      }
      else {
        var user = this.store.createRecord('user', {
          name: name,
          password: password,
          password_confirmation: password_confirmation
        });
        var self = this;
        user.save().then(function() {
          self.get('session').authenticate('authenticator:custom', name, password);
        });
      }
    }
  }
});
