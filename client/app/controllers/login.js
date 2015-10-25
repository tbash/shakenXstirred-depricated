import Ember from 'ember';

export default Ember.Controller.extend({
  session: Ember.inject.service('session'),

  actions: {
    authenticate() {
      var nameRegex = /^[a-z0-9_-]{1,16}$/;
      var passwordRegex = /^[a-z0-9_-]{8,18}$/;
      
      const { name, password } = this.getProperties('name', 'password');
      if (nameRegex.test(name) && nameRegex.test(password)) {
        return this.get('session').authenticate('authenticator:custom', name, password);
      }
    }
  }
});

