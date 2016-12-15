(function(){
	angular.module('app', []);
})();

;

(function(){
    angular.module('app')
		.controller('CtrlMain', ['$scope', '$http', function($scope, $http){
			
			$scope.users = [];
			$scope.wait = false;
			$scope.field_sort = 'id';
			$scope.modal = {};
			
			$scope.init = function()
			{
				$scope.wait = true;
				$http.post('model.php?action=get_users_all', {}).success(function(data, status) {
					$scope.users = $.map(data['data'], function(value, index) {
						return [value];
					});
					$scope.wait = false;
				});
			}
			
			$scope.edit_user = function(id)
			{
				for(var i in $scope.users)
				{
					if (id == $scope.users[i].id)
					{
						$scope.modal.id = $scope.users[i].id;
						$scope.modal.first_name = $scope.users[i].first_name;
						$scope.modal.last_name = $scope.users[i].last_name;
						$scope.modal.phone = $scope.users[i].phone;
					}
				}
				
				$('#add_modal').modal('show');
			}
			
			$scope.save_user = function()
			{
				$http({
					method: "post",
					url: 'model.php?action=save_user',
					headers: {'Content-Type': 'application/x-www-form-urlencoded'},
					data: $.param($scope.modal)
				}).success(function(result){
					$scope.wait = false;
					$scope.init();
				});
			}
			
			$scope.change_field = function(field)
			{
				$scope.field_sort = $scope.field_sort != field ? field : '-' + field;
			}
			
			$scope.remove_user = function(id)
			{
				$scope.wait = true;
				$http({
					method: "post",
					url: 'model.php?action=remove_user',
					headers: {'Content-Type': 'application/x-www-form-urlencoded'},
					data: 'id=' + id
				}).success(function(result){
					$scope.wait = false;
					$scope.init();
				});
			}
			
			$scope.init();
		}]);
})();


