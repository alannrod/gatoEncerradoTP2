var gatoEncerradoApp = angular.module("gatoEncerradoApp",[]);

gatoEncerradoApp.controller('LaberintosController', function LaberintosController($scope, $http) {

 /* $scope.listaLaberintos = [
    {nombre:'Laberinto 1', imagenUrl: 'WebContent/laberintos_1.jpg', link: 'labfirst.html'},
    {nombre:'Laberinto 2', imagenUrl: 'WebContent/laberintos_2.jpg', link: 'labsecond.html'},
    {nombre:'Laberinto 3', imagenUrl: 'WebContent/laberintos_3.png', link: 'labthird.html'},
    {nombre:'Laberinto 4', imagenUrl: 'WebContent/laberintos_4.jpg', link: 'labfourth.html'}
  ];*/
    
    $http.get( 'http://localhost:9000/usuario' )
    .then(function successCallback(response) {
    $scope.usuario= response.data; 
   }, function errorCallback(response) { 
   	console.error(response);
   });
   
   $http.get( 'http://localhost:9000/usuario/24' )
    .then(function successCallback(response) {
    $scope.obtenerInventario= response.data; 
   }, function errorCallback(response) { 
   	console.error(response);
   });
   
   
   $http.get( 'http://localhost:9000/laberintos/24' )
    .then(function successCallback(response) {
    $scope.laberintos= response.data; 
   }, function errorCallback(response) { 
   	console.error(response);
   });
   
   $http.get( 'http://127.0.0.1:9000/iniciarLaberinto/0/24' )
    .then(function successCallback(response) {
    $scope.iniciarLaberinto= response.data; 
   }, function errorCallback(response) { 
   	console.error(response);
   });
   
   $http.get( 'http://127.0.0.1:9000/realizar-accion/0/21/24' )
    .then(function successCallback(response) {
    $scope.getRealizarAccion= response.data; 
   }, function errorCallback(response) { 
   	console.error(response);
   });


/*
  $http.get(
    'http://127.0.0.1:9000/laberintos/1298382', //1298382 = participanteId
    function(err, resultadoGet){
      if(err) {
        console.error(err);
      } else {
        console.log(resultadoGet);
        $scope.listaLaberintos = resultadoGet;
      }
    }
  );
*/

/*
  $http.get('/dameListaLaberintos')
    .success(function(resultadoGet){
      $scope.listaLaberintos = resultadoGet;
    })
    .error(function(err){
      console.error(err);
    });
*/

});
