package grupo10.gatoEncerrado_Controller

import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
//import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.json.JSONUtils
import org.omg.CORBA.UserException
import grupo10.gatoEncerrado_Dominio.DominioMinimo.GatoMinimizado
import grupo10.gatoEncerrado_Dominio.Dominio.Juego

/**
 * 
 * @author Grupo10 - Victoria - Alan
 */
@Controller
class LaberintosController {
    extension JSONUtils = new JSONUtils
  
   //---ver---
    @Get("/usuario")
    def obtenerUsuarioEnSesion(){
    	
    	response.contentType = "application/json"
    	val juego = new Juego()// o creamos la instancia de juego o hacemos static al getNombre
    	val usuario = juego.getUsuario() // tenemos un solo usuario 
    	ok(usuario.toJson) // verificar si necesitamos nombre o todo el usuario
    }
    
    @Get("/usuario/:participanteId")
    def obtenerInventario(){
    	
    	val juego = new Juego ()//idem comentario anterior
    	ok(juego.getUsuario().getInventario().toJson)
    }
    //--- fin de zona de ver ---
    
    
    @Get("/laberintos/:participanteId")
    def mostrarLaberintosDeUsuario() {
    	
        response.contentType = "application/json"
        
        val idParticipante = Integer.valueOf(participanteId) 
        val laberintos = Juego.getLaberintosParaParticipante(idParticipante)
        //en laberintos obtengo los laberintos completos, los minimizare
        val minimo = new GatoMinimizado (laberintos)
        val labMin = minimo.minimizarLaberintos()
        ok(labMin.toJson)
    }
     

    @Get('/iniciarLaberinto/:idUser:idLab')
    def iniciarLaberintoNuevo() {
    	
        response.contentType = "application/json"
        
        val idParticipante = Integer.valueOf(idUser)
        val idLaberinto = Integer.valueOf(idLab)
        
        val juego = new Juego()// necesitamos una instancia de juego...
        val laberinto = Juego.getLaberinto(idParticipante, idLaberinto)
        //obtengo un laberinto entero, lo achicaremos
        val minimo = new GatoMinimizado (laberinto)
       
        val labMin = minimo.iniciarLaberinto(juego, idLaberinto, idParticipante)
        try {
        	// Devuelve un laberinto o primer habitacion
            ok(labMin.toJson)
        }
        catch (UserException e) {
        	
            notFound("No existe laberinto con el id " + idLaberinto + " para el participante con id " + idParticipante);
        }
    }

    @Get('/realizar-accion/:idHabitacion/:idAccion/:idParticipante')
    def getRealizarAccion() {
    	
    	/*
    	 * realizar accion intermanente ejecutara la accion para el participante
    	 * y para la habitacion, pero nos devolvera un string con el nombre de la
    	 * accion que se llevo a cabo
    	 */
            response.contentType = "application/json"
            val habitacionId = Integer.valueOf(idHabitacion)
            val accionId = Integer.valueOf(idAccion)
            val participanteId = Integer.valueOf(idParticipante)
            val juego = new Juego()// necesitaremos una instancia de juego
            val minificador = new GatoMinimizado()// necesitamos crear un GatoMin o hacer estatico el metodo realizar accion
            val juegoAfter = juego.realizarAccion(habitacionId,accionId, participanteId)// hace internamente la accion,  no retorna nada
        try {
            val resultadoRealizarAccion = minificador.realizarAccion(juegoAfter, habitacionId,accionId, participanteId)
            // Devolver lo que resulta como json
            ok(resultadoRealizarAccion .toJson);
        }
        catch (UserException e) {
            return notFound("No se puede realizar accion '" + idAccion + "'");
        }
    }
    
    
    @Get('/obtenerAcciones/:participanteId/:habitacionId')
    def buscarAcciones() {
    	
        response.contentType = "application/json"
        val idParticipante1 = Integer.valueOf(participanteId)
        val idHabitacion1 = Integer.valueOf(habitacionId)
        val juego = new Juego()
        val mini = new GatoMinimizado()
        val accionesMinimas = mini.obtenerAcciones(juego,idParticipante1, idHabitacion1)
        try {
        	// Devuelve un listado de strings que representan las acciones
            ok(accionesMinimas.toJson)
        }
        catch (UserException e) {
            notFound("No existe la habitacion con el id " + idHabitacion1 + " para el participante con id " + idParticipante1);
        }
    }

    def static void main(String[] args) {
        XTRest.start(LaberintosController, 9000)
    }
}
