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
  
   
    @Get("/usuario")
    def obtenerUsuarioEnSesion(){
    	ok(Juego.getUsuario().getNombre())
    }
    
    @Get("/usuario/:participanteId")
    def obtenerInventario(){
    	ok(Juego.getUsuario().getInventario().toJson)
    }
    
    @Get("/laberintos/:participanteId")
    def laberintos() {
        response.contentType = "application/json"
        val idParticipante = Integer.valueOf(participanteId) 
        val laberintos = Juego.getLaberintosParaParticipante(idParticipante)
        
        ok(laberintos.toJson)
    }
     

    @Get('/iniciarLaberinto/:laberintoIde/:participanteIde')
    def iniciarLaberinto() {
        response.contentType = "application/json"
        val idParticipante1 = Integer.valueOf(participanteIde)
        val idLaberinto1 = Integer.valueOf(laberintoIde)
        
        try {
        	// Devuelve un laberinto o primer habitacion
            ok(Juego.getLaberinto(idParticipante1, idLaberinto1).toJson)
        }
        catch (UserException e) {
            notFound("No existe laberinto con el id " + idLaberinto1 + " para el participante con id " + idParticipante1);
        }
    }

    @Get('/realizar-accion/:idHabitacion/:idAccion/:idParticipante')
    def getRealizarAccion() {
            response.contentType = "application/json"
            val habitacionId = Integer.valueOf(idHabitacion)
            val accionId = Integer.valueOf(idAccion)
            val participanteId = Integer.valueOf(idParticipante)
            
        try {
            val resultadoRealizarAccion = Juego.realizarAccion(accionId, habitacionId, participanteId)
            // Devolver lo que resulta como json
            ok(resultadoRealizarAccion .toJson);
        }
        catch (UserException e) {
            return notFound("No se puede realizar accion '" + idAccion + "'");
        }
    }
    @Get('/iniciarLaberinto/:laberintoIde/:participanteIde/:habitacionId')
    def buscarAcciones() {
        response.contentType = "application/json"
        val idParticipante1 = Integer.valueOf(participanteIde)
        val idLaberinto1 = Integer.valueOf(laberintoIde)
        val lab = Juego.getLaberinto(idParticipante1, idLaberinto1)
        try {
        	// Devuelve un laberinto o primer habitacion
            ok(Juego.getLaberinto(idParticipante1, idLaberinto1).toJson)
        }
        catch (UserException e) {
            notFound("No existe laberinto con el id " + idLaberinto1 + " para el participante con id " + idParticipante1);
        }
    }

    def static void main(String[] args) {
        XTRest.start(LaberintosController, 9000)
    }
}
