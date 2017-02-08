App.User = DS.Model.extend({
  name: DS.attr('string'),
  verified: DS.attr('boolean'),
  appName: DS.attr('string')
});


