


angular.module('directoryApp').directive('companyContacts', function(companiesFactory) {
    return {
        scope:{companyid:'@'},
        restrict: 'A',
        replace: false,
        link : function(scope, element, attrs){
            scope.contactImageSrc = '';
            scope.thisCompany = attrs.companyid;
            scope.displayImage = function(src){
                scope.showImage = true;
                scope.contactImageSrc = 'app/images/'+src;
            };
            scope.hideImage = function(){
                scope.showImage = false;
            };
            scope.showDetails = function(contactId){
                window.location.href = '#/details/'+contactId;
            };
            scope.showImage = false;
            getContactsViewByCompanyId(attrs.companyid);
            
            function getContactsViewByCompanyId(companyId){
                companiesFactory.getContactsViewByCompanyId(companyId)
                    .success(function(contacts) {
                        scope.contacts = contacts.ROWS;
                    })
                    .error(function(data, status, headers, config) {
                        console.error('Http Ajax Error:companyContacts',data, status, headers, config);
                    });
            }; //getContactsViewByCompanyId
     
        },
        template: '<div ng-show="showImage" class="contactsImage"><img src="{{contactImageSrc}}" /></div>'+'<div class="contactsTable">'+
                    '<div ng-repeat="contact in contacts">'+
                        '<div class="contactsRow clearfix">'+
                            '<div ng-mouseover="displayImage(contact.image)" ng-mouseleave="hideImage()" class="fullname" ng-click="showDetails(contact.idcontacts)">{{contact.firstname}} {{contact.lastname}}</div>'+
                            '<div class="phoneNumber" ng-click="showDetails(contact.idcontacts)">{{contact.phone}}</div>'+
                            '<div class="emailAddress"><a ng-href="mailto:{{contact.email}}">{{contact.email}}</a></div>'+
                        '</div>'+
                    '</div>'+
                '</div>'
    };
});

