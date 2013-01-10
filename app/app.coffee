'use strict'

# Declare app level module which depends on filters, and services
App = angular.module('app', [
  'ngCookies'
  'ngResource'
  'app.controllers'
  'app.directives'
  'app.filters'
  'app.services'
])

App.config([
  '$routeProvider'
  '$locationProvider'

($routeProvider, $locationProvider, config) ->

  $routeProvider

    .when('/app', {templateUrl: '/partials/app.html'})
    .when('/view1', {templateUrl: '/partials/partial1.html'})
    .when('/view2', {templateUrl: '/partials/partial2.html'})

    # Catch all
    .otherwise({redirectTo: '/app'})

  # Without server side support html5 must be disabled.
  $locationProvider.html5Mode(false)
])

### Fake Backend for Testing ###
App.config(($provide) ->
  $provide.decorator('$httpBackend', angular.mock.e2e.$httpBackendDecorator)
)

# Define our fake backend.
App.run(($httpBackend) ->
  apps = [
    name: "Convos"
    description: "Sketchy phone app."
  ,
    name: "Best of Brown"
    description: "App for finding good courses"
  ]
  $httpBackend.whenGET('apps/apps.json').respond(apps)
  
  # TODO: Mock backend.
  $httpBackend.whenGET().passThrough()
)