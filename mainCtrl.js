myApp.controller('MainCtrl', [
  '$scope', 
  'posts',
  function($scope, posts) {
    $scope.posts = posts.posts;

    $scope.addPost = function() {
      if (!$scope.title || $scope.title === '') { return; }
      $scope.posts.push({
        title: $scope.title, 
        link: $scope.link,
        upvotes: 0,
        comments: [
          {author: 'sheep', body: 'Baaaah', upvotes: 0},
          {author: 'cat', body: 'Meooow', upvotes: 2}
        ]
      });
      $scope.title = '';
      $scope.link = '';
    };

    $scope.incrementUpvotes = function(post) {
      post.upvotes += 1;
    };
  }
]);
