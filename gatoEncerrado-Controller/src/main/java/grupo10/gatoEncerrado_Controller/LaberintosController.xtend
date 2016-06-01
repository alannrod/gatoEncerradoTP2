package grupo10.gatoEncerrado_Controller

import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
//import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.json.JSONUtils
import org.omg.CORBA.UserException
import grupo10.gatoEncerrado_Dominio.Juego

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
    	val juego = new Juego()// o creamos la instancia de juego o hacemos static al getNombre
    	ok(juego.getUsuario().getNombre())
    }
    
    @Get("/usuario/:participanteId")
    def obtenerInventario(){
    	val juego = new Juego ()//idem comentario anterior
    	ok(juego.getUsuario().getInventario().toJson)
    }
    //--- fin de zona de ver ---
    
    
    @Get("/laberintos/:participanteId")
    def laberintos() {
        response.contentType = "application/json"
        val idParticipante = Integer.valueOf(participanteId) 
        val laberintos = Juego.getLaberintosParaParticipante(idParticipante)
        //en laberintos obtengo los laberintos completos, los minimizare
        val minimo = new GatoMin (laberintos)
        val labMin = minimo.minimizarLaberintos()
        ok(labMin.toJson)
    }
     

    @Get('/iniciarLaberinto/:laberintoIde/:participanteIde')
    def iniciarLaberinto() {
        response.contentType = "application/json"
        val idParticipante1 = Integer.valueOf(participanteIde)
        val idLaberinto1 = Integer.valueOf(laberintoIde)
        val laberinto = Juego.getLaberinto(idParticipante1, idLaberinto1)
        //obtengo un laberinto entero, lo achicaremos
        val minimo = new GatoMin (laberinto)
        val juego = new Juego()// necesitamos una instancia de juego...
        val labMin = minimo.iniciarLaberinto(juego, idParticipante1, idLaberinto1)
        try {
        	// Devuelve un laberinto o primer habitacion
            ok(labMin.toJson)
        }
        catch (UserException e) {
            notFound("No existe laberinto con el id " + idLaberinto1 + " para el participante con id " + idParticipante1);
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
            val minificador = new GatoMin()// necesitamos crear un GatoMin o hacer estatico el metodo realizar accion
            juego.realizarAccion(accionId,habitacionId, participanteId)// hace internamente la accion,  no retorna nada
        try {
            val resultadoRealizarAccion = minificador.realizarAccion(juego, habitacionId,accionId, participanteId)
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
        val mini = new GatoMin()
        val accionesMinimas = mini.obtenerAcciones(juego,idHabitacion1, idParticipante1)
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
