import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  ingredients: DS.hasMany('ingredient'),
  cocktails: DS.hasMany('cocktail')
});
