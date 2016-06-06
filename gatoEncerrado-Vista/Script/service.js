var app = angular.module("gatoEncerradoApp", []); 

app.factory('gatoEncerradoService', function($resource) {
    return $resource('/laberintos/:participanteId', {'participanteId': '@participanteId'}, {
    	'query': { method: 'GET', isArray: true}
    });
});