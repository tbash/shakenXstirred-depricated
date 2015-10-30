import Ember from 'ember';
import DS from 'ember-data';

export default DS.ActiveModelAdapter.extend({
  host: 'http://33.33.33.100:3000'
});
