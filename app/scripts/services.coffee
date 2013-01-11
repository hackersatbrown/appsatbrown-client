'use strict'

### Sevices ###

angular.module('app.services', ['ngResource'])
  .factory('App', ($resource) ->
    return $resource('apps/:appId', {}, {
      query: {method:'GET', params:{appId:'apps'}, isArray:true}
      edit: {method:'PUT'}
    })
  )
  .factory('User', ($resource) ->
    return $resource('users/:userId', {}, {})
  )