angular.module('gatoEncerradoApp')
.controller('LaberintosController',funtion($scope,LaberintosService)){
  $scope.usuario="Esteban Quito";
  $scope.laberintos= LaberintosService.todosLosLaberintos();
}
