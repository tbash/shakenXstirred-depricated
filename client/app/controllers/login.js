import Ember from 'ember';

export default Ember.Controller.extend({
  session: Ember.inject.service('session'),

  actions: {
    authenticate() {
      const { name, password } = this.getProperties('name', 'password');
      return this.get('session').authenticate('authenticator:custom', name, password);
    }
  }
});

