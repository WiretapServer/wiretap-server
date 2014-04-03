'use strict';


/* App Module */

angular.module('wiretap', []).
  config(['$routeProvider', function($routeProvider) {
  $routeProvider.
  	  when('/', {controller: PingCtrl}).
      when('/phones', {templateUrl: 'partials/phone-list.html',   controller: PhoneListCtrl}).
      when('/phones/:phoneId', {templateUrl: 'partials/phone-detail.html', controller: PhoneDetailCtrl}).
      otherwise({redirectTo: '/'});
}]);