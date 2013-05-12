define ['cs!my/tpl', 'angular'], (tpl, angular) ->
	'use strict'

	# Declare app level module which depends on filters, and services
	angular.module('App', [])
	.config(['$routeProvider', ($routeProvider) ->
		$routeProvider.when('/demo/bs/:catSubCat', {templateUrl: 'partial/bs/demo.html', controller: 'BsDemoCtrl'})
		$routeProvider.when('/view1', {templateUrl: 'partial/partial1.html', controller: 'MyCtrl1'})
		$routeProvider.when('/view2', {templateUrl: 'partial/partial2.html', controller: 'MyCtrl2'})
		$routeProvider.otherwise({redirectTo: '/demo/bs/button-groups'})
	])
	.controller('AppCtrl', ['$scope', ($scope) ->
		$scope.site =
			title: 'Get Angular!',
			user: 'Paolo'
	])
	.controller('BsDemoCtrl', ['$scope', '$routeParams', '$location', ($scope, $routeParams, $location) ->
		$scope.templates = [
			{ name: 'button-defaults', url: 'partial/bs/button-defaults.html'}
			{ name: 'button-groups', url: 'partial/bs/button-groups.html'}
			{ name: 'button-sizes', url: 'partial/bs/button-sizes.html'}
			{ name: 'button-dropdowns', url: 'partial/bs/button-dropdowns.html'}
			{ name: 'button-dropups', url: 'partial/bs/button-dropups.html'}
			{ name: 'button-others', url: 'partial/bs/button-others.html'}
		]

		$scope.$watch 'template', ->
			$location.path('/demo/bs/'+$scope.template.name)		

		for template in $scope.templates then do (template) =>
			if template.name is $routeParams.catSubCat then $scope.template = template

		$scope.template = $scope.templates[0] if (! $scope.template) 


		$scope.isActive = (tFileName) ->
			return tFileName is $scope.template.name
			


		$scope.page =
			title: 'Buttons'
	])
	.controller('MyCtrl1', [->])
	.controller('MyCtrl2', [->])

	# when all is done, execute bootstrap angular application
	return angular.bootstrap(document, ['App'])
