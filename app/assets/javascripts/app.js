var myApp = angular.module('readIt', ['ui.router', 'templates']);

myApp.run(($rootScope) => {
  $rootScope.$on("$stateChangeError", console.log.bind(console));
});

myApp.config([
  '$stateProvider',
  '$urlRouterProvider',
  function($stateProvider, $urlRouterProvider) {
    $stateProvider
      .state('home', {
        url: '/home',
        templateURL: '/home.html',
        controller: 'MainCtrl'
      })
      .state('posts', {
        url: '/posts/{id}',
        templateUrl: '/posts.html',
        controller: 'PostsCtrl'
      });
    $urlRouterProvider.otherwise('home');
  }
]);

myApp.factory('posts', [
  function() {
    var o = { posts: [ ] };
    return o;
  }
]);
