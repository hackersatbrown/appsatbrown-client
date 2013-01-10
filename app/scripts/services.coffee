'use strict'

### Sevices ###

angular.module('app.services', ['ngResource']).
  factory('App', ($resource) ->
    return $resource('apps/:appId.json', {}, {
      query: {method:'GET', params:{appId:'apps'}, isArray:true}
    })
  )