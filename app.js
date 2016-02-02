angular.module('readIt', ['ui.router'])

.run(($rootScope) => {
  $rootScope.$on("$stateChangeError", console.log.bind(console));
})

.config([
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
])

.factory('posts', [
  function() {
    var o = { posts: [ ] };
    return o;
  }
])

.controller('MainCtrl', [
  '$scope', 
  'posts',
  function($scope, posts) {
    $scope.posts = posts.posts;

    $scope.addPost = function() {
      if (!$scope.title || $scope.title === '') { return; }
      $scope.posts.push({
        title: $scope.title, 
        link: $scope.link,
        upvotes: 0
      });
      $scope.title = '';
      $scope.link = '';
    };

    $scope.incrementUpvotes = function(post) {
      post.upvotes += 1;
    };
  }
]);
