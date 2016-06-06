var app = angular.module("gatoEncerradoApp",['ngResource']);

app.factory('Labs', function($resource) {
    return $('laberintos/:participanteId', {'participanteId': '@participanteId'}, {
    	'mostrarLaberintosDeUsuario': { method: 'GET', isArray: true}
    });
});

app.factory('Habs', function($resource) {
    return $('/iniciarLaberinto/:idUser:idLab', {'idUser': '@idUser'}, {'idLab': '@idLab'} , {
    	'habitacionesDelNuevoLab': { method: 'GET', isArray: true}
    });
});  


app.factory('Accs', function($resource) {
    return $('/realizar-accion/:idHabitacion/:idAccion/:idParticipante', {'idHabitacion': '@idHabitacion'}, {'idAccion': '@idAccion'} , {'idParticipante': '@idParticipante'} , {
    	'todosLasHabitaciones': { method: 'GET', isArray: false}
    });
});



gatoEncerradoApp.controller('gatoEncerradoControlador', function($scope,$http, Labs, Habs, Accs){

$scope.idUsuario = "24";
	
	 $http.get("usuario" )
    .then(function successCallback(response) {
    $scope.usuario= response.data; 
   }, function errorCallback(response) { 
   	console.error(response);
   });
	
	$http.get("laberintos/"+ $scope.idUsuario).success(function(data) {
	$scope.laberintos = data;
		console.log(data);
	}).error(errorHandler);

	$scope.iniciarLaberinto = function(idUsuario, idLaberinto) {
		$http.get("iniciarLaberinto/"+ $scope.idUsuario +"/" + $scope.idLaberinto).success(function(data) {
			$scope.habitaciones = data.habitaciones;
			$scope.primeraHab= $scope.habitaciones[0];
			$scope.inventarioAsignado = data.inventario
			console.log(data);
		}).error(errorHandler);
		}
		
		$scope.realizarAccion = function(idHabitacion, idAccion, idParticipante) {
		$http.get("realizarAccion/"+ $scope.idHabitacion +"/" + $scope.idAccion + "/" + $scope.idParticipante).success(function(data) {
			/*$scope.laberintoActual ...*/
			$scope.esFinal = data.habFinal
			// $scope.habitacionActual.acciones = data.habitacion.acciones;
			/*como terminamos el juego?*/
	}
		