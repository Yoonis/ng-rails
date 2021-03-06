var myApp = angular.module('readIt', ['ui.router', 'templates', 'Devise']);

myApp.run(($rootScope) => {
  $rootScope.$on("$stateChangeError", console.log.bind(console));
});

myApp.config([
  '$stateProvider',
  '$urlRouterProvider',
  function($stateProvider, $urlRouterProvider) {
    $stateProvider
      // .state('devise', {
      //   url: '/devise/*',
      //   views: {
      //     "devise": {
      //       controller: 'MainCtrl',
      //       templateUrl: 'home/_home.html'
      //     }
      //   }
      // })
      .state('home', {
        url: '/home',
        views: {
          "main": {
            controller: 'MainCtrl',
            templateUrl: 'home/_home.html'
          }
        }
      })
      .state('posts', {
        url: '/posts/{id}',
        views: {
          "posts": {
            controller: 'PostsCtrl',
            templateUrl: 'posts/_posts.html'
          }
        }
      });
    $urlRouterProvider.otherwise('home');
  }
]);
