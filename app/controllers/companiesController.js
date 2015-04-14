(function() {
    
    var CompaniesController = function ($scope, $log, $window, companiesFactory, appSettings) {
        $scope.sortBy = 'name';
        $scope.reverse = false;
        $scope.appSettings = appSettings;
        $scope.companies = [];
        $scope.showImage = false;
        
   
            
        var getCompaniesXHR = function(){
            companiesFactory.getCompanies()
            .success(function(companies) {
                $scope.companies = companies.ROWS
            })
            .error(function(data, status, headers, config) {
                $log.error('Http Ajax Error : data:',data,'status: ', status, 'headers: '.headers, 'config :',config);
            });
        };
     
        getCompaniesXHR();
        
   
        
        $scope.doSort = function(propName) {
           $scope.sortBy = propName;
           $scope.reverse = !$scope.reverse;
        };
        
        $scope.deleteCustomer = function(customerId) {
            customersFactory.deleteCustomer(customerId)
                .success(function(status) {
                    if (status) {
                        for (var i=0,len=$scope.customers.length;i<len;i++) {
                            if ($scope.customers[i].id === customerId) {
                               $scope.customers.splice(i,1);
                               break;
                            }
                        }  
                    }
                    else {
                        $window.alert('Unable to delete customer');   
                    }
                    
                })
                .error(function(data, status, headers, config) {
                    $log.log(data.error + ' ' + status);
                });
        };
    };
    
    CompaniesController.$inject = ['$scope', '$log', '$window', 'companiesFactory', 
                                   'appSettings'];

    angular.module('directoryApp')
      .controller('CompaniesController', CompaniesController);
    
}());