import Ember from 'ember';

export default Ember.Controller.extend({
  session: Ember.inject.service('session'),

  actions: {
    create: function() {
      var nameRegex = /^[a-z0-9_-]{3,16}$/;
      var passwordRegex = /^[A-Za-z0-9_-]{8,18}$/;
      var name = this.get('name').toLowerCase();
      var password = this.get('password');
      var password_confirmation = this.get('password_confirmation');
      var dob = this.get('date');
      var today = Date.now();
      var twentyOne = today - Date.parse("January 1, 1991, 00:00:00 UTC");
      dob = Date.parse(dob);
      if (nameRegex.test(name) === false || passwordRegex.test(password) === false) {
        this.notifications.addNotification({
          message: 'letters, numbers, underscores, or hyphens only please',
          type: 'error',
          autoClear: true,
          clearDuration: 4000
        });
      }
      else if (password !== password_confirmation) {
        this.notifications.addNotification({
          message: 'password confirmation does not match password',
          type: 'error',
          autoClear: true,
          clearDuration: 3000
        });
      }
      else if (dob > twentyOne) {
        this.notifications.addNotification({
          message: 'you must 21, older, or lying to use this service',
          type: 'error',
          autoClear: true,
          clearDuration: 4000
        });
      }
      else {
        var user = this.store.createRecord('user', {
          name: name,
          password: password,
          password_confirmation: password_confirmation
        });
        var self = this;
        user.save().then(function() {
          self.get('session').authenticate('authenticator:custom', name, password).then(function(){
            self.notifications.addNotification({
              message: 'you have successfully signed up as ' + name,
              type: 'success',
              autoClear: true,
              clearDuration: 3000
            });
          });
          }, function(error) {
            self.notifications.addNotification({
              message: 'that username already exists',
              type: 'error',
              autoClear: true,
              clearDuration: 3000
            });
        });
      }
    }
  }
});
