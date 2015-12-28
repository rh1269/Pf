var postControllers = angular.module('postControllers', []);

postControllers.controller('homeFeedCtrl', ['$scope', '$http', '$location', '$sce', function($scope, $http, $location, $sce) {
	$http.get('/home/json').success(function(data) {
   		$scope.posts = data;
   		console.log(data);
	});

	//$scope.trustUrl = function(url) {
    //return $sce.trustAsResourceUrl(url);
	//}
}]);