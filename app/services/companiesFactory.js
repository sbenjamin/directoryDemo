(function() {
    var companiesFactory = function($http) {
    
        var factory = {};
        
        factory.getCompanies = function(){

            var url = 'http://www.stevenbenjamin.com/assets/cfc/directory_services.cfc?method=getcompanies'
                +'&token=dhd7dteg56dd43d'
                +'&callback=JSON_CALLBACK'
            
            return $http.jsonp(url,{timeout:6000});
        };
        
        factory.getContactsViewByCompanyId = function(companyId){
            var url = 'http://www.stevenbenjamin.com/assets/cfc/directory_services.cfc?method=getContactsViewByCompanyId'
                +'&companyId='+companyId
                +'&token=dhd7dteg56dd43d'
                +'&callback=JSON_CALLBACK'
            
            return $http.jsonp(url,{timeout:6000});
        };
            
        return factory;
    };
    
    companiesFactory.$inject = ['$http'];
        
    angular.module('directoryApp').factory('companiesFactory', companiesFactory);
                                           
}());