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

    .when('/apps', {templateUrl: '/partials/apps.html'})
    .when('/apps/:appId', {templateUrl: 'partials/app-detail.html'})
    .when('/view1', {templateUrl: '/partials/partial1.html'})
    .when('/view2', {templateUrl: '/partials/partial2.html'})

    # Catch all
    .otherwise({redirectTo: '/apps'})

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
    id: 0
    name: "Convos"
    description: "Sketchy phone app."
  ,
    id: 1
    name: "Best of Brown"
    description: "App for finding good courses"
  ]
  $httpBackend.whenGET('apps/apps').respond(apps)
  $httpBackend.whenGET('apps/0').respond(apps[0])
  $httpBackend.whenGET('apps/1').respond(apps[1])
  # TODO: Mock backend.
  $httpBackend.whenGET().passThrough()
)