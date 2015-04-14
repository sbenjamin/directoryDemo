(function() {
    
    var app = angular.module('directoryApp', ['ngRoute', 'ngAnimate']);
    
    app.config(function($routeProvider) {
        $routeProvider
            .when('/', {
                controller: 'CompaniesController',
                templateUrl: 'app/views/companies.html'
            })
            .when('/details/:contactId', {
                controller: 'ContactsController',
                templateUrl: 'app/views/contactDetails.html'
            })
            .otherwise( { redirectTo: '/' } );
    });
    
}());