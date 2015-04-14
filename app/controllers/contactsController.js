(function() {
    
    var ContactsController = function ($scope, $routeParams, contactsFactory) {
        var contactId = $routeParams.contactId;
        $scope.thisContact = null;
        
        contactsFactory.getContactsById(contactId)
            .success(function(contactDetails) {
                $scope.contacts = contactDetails.ROWS;
            })
            .error(function(data, status, headers, config) {
                //handle error
            });
        
    };
    
    ContactsController.$inject = ['$scope', '$routeParams', 'contactsFactory'];

    angular.module('directoryApp')
      .controller('ContactsController', ContactsController);
    
}());