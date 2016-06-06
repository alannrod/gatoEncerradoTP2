var app = angular.module("gatoEncerradoApp",['ngResource']);

app.factory('LaberintosDeUsuario', function($resource) {
    return $('laberintos/:participanteId', {'participanteId': '@participanteId'}, {
    	'mostrarLaberintosDeUsuario': { method: 'GET', isArray: true}
    });
});

app.factory('HabitacionesDeUsuario', function($resource) {
    return $('/iniciarLaberinto/:idUser:idLab', {'idUser': '@idUser'}, {'idLab': '@idLab'} , {
    	'nuevoLaberintoDeUsuario': { method: 'GET', isArray: true}
    });
});  


app.factory('AccionesDeUsuario', function($resource) {
    return $('/realizar-accion/:idHabitacion/:idAccion/:idParticipante', {'idHabitacion': '@idHabitacion'}, {'idAccion': '@idAccion'} , {'idParticipante': '@idParticipante'} , {
    	'todosLasHabitaciones': { method: 'GET', isArray: false}
    });
});




gatoEncerradoApp.controller('laberintoController', function($scope, LaberintoS, HabitacioneS, AccioneS, $http)