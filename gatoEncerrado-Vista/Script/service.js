angular.module('gatoEncerradoApp')
.service('LaberintosService',function(){
	this.todosLosLaberintos=function(){
		return  [
		         {
		        	 url:"labfirst.html",
		        	 imagen:"laberintos_1.jpg",
		        	 nombre:"laberinto 1"
		         },{
		        	 url:"labsecond.html",
		        	 imagen:"laberintos_2.jpg",
		        	 nombre:"Laberinto 2"		     		
		         },{
		        	 url:"labthird.html",
		        	 imagen:"laberintos_3.png",
		        	 nombre: "Laberinto 3"
		         },{
		        	 url:"labfourth.html",
		        	 imagen:"laberintos_4.jpg",
		        	 nombre:"Laberinto 4"
		         }
		];
	}
});