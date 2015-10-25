import Ember from 'ember';

export default Ember.Controller.extend({
  session: Ember.inject.service('session'),

  actions: {
    authenticate() {
      var nameRegex = /^[a-z0-9_-]{1,16}$/;
      var passwordRegex = /^[A-Za-z0-9_-]{8,18}$/;
      
      const { name, password } = this.getProperties('name', 'password');
      if (nameRegex.test(name) && passwordRegex.test(password)) {
        return this.get('session').authenticate('authenticator:custom', name, password);
        debugger;
      }
      else {
        this.notifications.addNotification({
          message: 'that name and password combo does not exist',
          type: 'error',
          autoClear: true,
          clearDuration: 1200
        });
      }
    }
  }
});

