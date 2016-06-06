package grupo10.gatoEncerrado_Dominio.Dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList



@Accessors
//@Observable
class Juego {
	
	static final Juego instance = new Juego()
	
	Participante usuario
	ArrayList<Laberinto> laberintos = new ArrayList<Laberinto>
	Integer idLaberinto
	Laberinto laberintoActual
	
	
	
	new(){	
		this.usuario = new Participante("Pablo24", 24)
		this.usuario.agregarItemAlInventario("tijera escolar")
		this.idLaberinto = 0
		this.addLaberinto("Laberinto 1", "MacGyverInt", "Habitacion del Mal","Habitacion del bien", "Ir a escalera","No hacer nada", "Lentes", "Pila AA", "laberintos_1.jpg")
		this.addLaberinto("Laberinto 2", "Date un respiro", "Habitacion para novatos","Habitacion para genios", "Caminar a la derecha", "Correr", "Escalera", "Largavista", "laberintos_2.jpg")
		this.addLaberinto("Laberinto 3", "El tiempo es oro", "Habitacion dorada","Habitacion plateada", "Saltar la pared","Sentarse", "Bomba", "Pizza", "laberintos_3.png")
		this.addLaberinto("Laberinto 4", "Aprobando la materia", "Habitacion Tenes un 7","Habitacion Tenes un 10", "Aprobar","Rezar", "Angular", "CSS", "laberintos_4.jpg")
	}
	
	def static Juego getInstance(){	
		return instance
	}	
	
	def void addLaberinto(String nombreLaberinto, String descripcion, String nombreHabitacion1, String nombreHabitacion2, String accion1, String accion2, String item, String itemDos, String path){
		this.usuario.addLab(new Laberinto(idLaberinto,nombreLaberinto, descripcion, nombreHabitacion1, nombreHabitacion2, accion1, accion2, item, itemDos, path))
		this.idLaberinto = this.idLaberinto+1
	} 
	
	def static ArrayList<Laberinto> getLaberintosParaParticipante(Integer integer ) {
		if (integer == instance.usuario.getIdUsuario()){
			return instance.usuario.laberintos} 
		else
		 	throw new IllegalArgumentException("no se encontro participante")
	}
	
	def Laberinto getLaberinto(Integer idUsuario, Integer idLaberinto) {
        
        instance.laberintoActual=instance.buscarId(idLaberinto)
        return instance.laberintoActual
	}
	
	def Laberinto buscarId(Integer idLab){
		return laberintos.findFirst[it.idLaberinto  == idLab]
	}
	
	def static Juego realizarAccion(Integer idHabitacion, Integer idAccion, Integer idUsuario) {
		val hab = instance.laberintoActual.buscarIdHab(idHabitacion)
		val accion = hab.buscarIdAccion(idAccion)
		
		accion.realizarAccion(instance.usuario,hab)
		return instance
	}
	
	def buscarIdUser(Integer idUsuario) {
		if (instance.usuario.getIdUsuario()== idUsuario)
		return instance.usuario
	}
	
	def static getUsuarioStatic() {
		return instance.getUsuario()
	}
	
	
	
}
