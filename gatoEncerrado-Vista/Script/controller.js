var gatoEncerradoApp = angular.module("gatoEncerradoApp",['ngResource']);

gatoEncerradoApp.factory('Labs', function($resource) {
    return $('laberintos/:participanteId', {'participanteId': '@participanteId'}, {
    	'mostrarLaberintosDeUsuario': { method: 'GET', isArray: true}
    });
});

gatoEncerradoApp.factory('Habs', function($resource) {
    return $('/iniciarLaberinto/:idUser:idLab', {'idUser': '@idUser'}, {'idLab': '@idLab'} , {
    	'habitacionesDelNuevoLab': { method: 'GET', isArray: true}
    });
});  


gatoEncerradoApp.factory('Accs', function($resource) {
    return $('/realizar-accion/:idHabitacion/:idAccion/:idParticipante', {'idHabitacion': '@idHabitacion'}, {'idAccion': '@idAccion'} , {'idParticipante': '@idParticipante'} , {
    	'todosLasHabitaciones': { method: 'GET', isArray: false}
    });
});



gatoEncerradoApp.controller('gatoEncerradoControlador', function($scope,$http, Labs, Habs, Accs){

$scope.idUsuario = "24";

	
	$http.get("http://127.0.0.1:9000/usuario" ).success(function(data){
	 
    $scope.usuario= data; 
    }, function errorCallback(data) { 
   	console.error(data);
   });
	
	$http.get("http://127.0.0.1:9000/laberintos/"+ $scope.idUsuario).success(function(data) {
	$scope.laberintos = data;
	}, function errorCallback(data) { 
   	console.error(data);
   });

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
			$scope.laberintoActual= data;
			$scope.habitaciones = data.habitaciones;
			$scope.accion = data.buscarIdHab(idHabitacion).buscarIdAccion(idAccion)
			$scope.esFinal = data.habFinal
			// $scope.habitacionActual.acciones = data.habitacion.acciones;
			/*como terminamos el juego?*/
			
			console.log(data);
		}).error(errorHandler);
		}
	});
		