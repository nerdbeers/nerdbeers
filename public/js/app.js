var App = Ember.Application.create({
  LOG_TRANSITIONS: true
});

App.ApplicationAdapter = DS.RESTAdapter.extend({
});

DS.RESTAdapter.reopen({
  namespace: ''
});

App.Router.map(function() {
	this.route('codeofconduct');
});

App.IndexRoute = Ember.Route.extend({
  model: function() {
    return $.ajax({
        dataType: "json",
        url: '/api/'});
      }
});