package grupo10.gatoEncerrado_Dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList



@Accessors
//@Observable
class Juego {
	
	static final Juego instance = new Juego()
	
	Participante idUsuario
	ArrayList<Laberinto> laberintos = new ArrayList<Laberinto>
	Integer idLaberinto
	Laberinto laberintoActual
	
	
	new(){	
		this.idUsuario = new Participante("Pablo24")
		this.addLaberinto("Laberinto 1", "MacGyverInt", "Habitacion del Mal","Habitacion del bien", "Ir a escalera","No hacer nada", "Lentes", "Pila AA")
		this.addLaberinto("Laberinto 2", "Date un respiro", "Habitacion para novatos","Habitacion para genios", "Caminar a la derecha", "Correr", "Escalera", "Largavista")
		this.addLaberinto("Laberinto 3", "El tiempo es oro", "Habitacion dorada","Habitacion plateada", "Saltar la pared","Sentarse", "Bomba", "Pizza")
		this.addLaberinto("Laberinto 4", "Aprobando la materia", "Habitacion Tenes un 7","Habitacion Tenes un 10", "Aprobar","Rezar", "Angular", "CSS")
	}
	
	def static Juego getInstance(){	
		return instance
	}	
	
	def void addLaberinto(String nombreLaberinto, String descripcion, String nombreHabitacion1, String nombreHabitacion2, String accion1, String accion2, String item, String itemDos){
		idUsuario.addLab(new Laberinto(idLaberinto,nombreLaberinto, descripcion, nombreHabitacion1, nombreHabitacion2, accion1, accion2, item, itemDos))
		idLaberinto = idLaberinto+1
	}
	
	def static ArrayList<Laberinto> getLaberintosParaParticipante(Integer integer) {
		if (integer == "Pablo24"){
		return instance.idUsuario.laberintos} 
		else
		 throw new IllegalArgumentException("no se encontro participante")
	}
	
	def static Laberinto getLaberinto(Integer idUsuario, Integer idLaberinto) {
        instance.laberintos = getLaberintosParaParticipante(idUsuario)
        instance.laberintoActual=instance.buscarId(idLaberinto)
        return instance.laberintoActual
	}
	
	def Laberinto buscarId(Integer idLab){
		for(var i = 0 ;i <this.laberintos.size() ; i++){
            if(this.laberintos.get(i).getIdLaberinto()== idLab){
            	return this.laberintos.get(i);
			} 
		}
	}
	
	def static realizarAccion(Integer idHabitacion, Integer idAccion, Integer idUsuario) {
		val Accion queHace = instance.laberintoActual.buscarIdHab(idHabitacion).buscarIdAccion(idAccion)
		queHace.realizarAccion(instance.idUsuario,instance.laberintoActual.buscarIdHab(idHabitacion))
	}
}
