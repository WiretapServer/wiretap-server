'use strict';

/* Services */

angular.module('pingServices', ['ngResource']).
    factory('Ping', function($resource){
  return $resource('phones/:phoneId.json', {}, {
    query: {method:'GET', params:{phoneId:'phones'}, isArray:true}
  });
});