var commentControllers = angular.module('commentControllers', []);

commentControllers.directive("replyform", function(){
	return function(scope, element, attrs){
		element.bind("click", function(){	
			angular.element(document.getElementById('space-for-buttons'))
			.append($compile("<div><button class='btn btn-default' data-alert="+scope.count+">Show alert #"+scope.count+"</button></div>")(scope));
		});
	};
});