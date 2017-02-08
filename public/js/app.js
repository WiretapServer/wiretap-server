App = Ember.Application.create();

App.Router.map(function() {
    this.resource('Users', { path: '/users' }); 
});

App.IndexRoute = Ember.Route.extend({
  model: function() {
    return ['red', 'yellow', 'blue'];
  }
});

App.UsersRoute = Ember.Route.extend({
    model: function () {
        return ['ali']
    }
})
