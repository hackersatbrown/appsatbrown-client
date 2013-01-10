'use strict'

### Sevices ###

angular.module('app.services', ['ngResource'])
  .factory('App', ($resource) ->
    return $resource('apps/:appId', {}, {
      query: {method:'GET', params:{appId:'apps'}, isArray:true}
    })
  )
  .factory('User', ($resource) ->
    return $resource('users/:userId', {}, {})
  )