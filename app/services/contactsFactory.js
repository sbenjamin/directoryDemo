(function() {
    var contactsFactory = function($http) {
    
        var factory = {};
        
        factory.getContactsById = function(contactId){

            var url = 'http://www.stevenbenjamin.com/assets/cfc/directory_services.cfc?method=getContactsById'
                +'&token=dhd7dteg56dd43d'
                +'&contactId='+contactId
                +'&callback=JSON_CALLBACK'
            
            return $http.jsonp(url,{timeout:6000});
        };
                    
        return factory;
    };
    
    contactsFactory.$inject = ['$http'];
    angular.module('directoryApp').factory('contactsFactory', contactsFactory);
                                           
}());