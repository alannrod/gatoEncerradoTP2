package grupo10.gatoEncerrado_Dominio.DominioMinimo

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import grupo10.gatoEncerrado_Dominio.Dominio.Laberinto
import grupo10.gatoEncerrado_Dominio.Dominio.Juego
import grupo10.gatoEncerrado_Dominio.Dominio.Habitacion



@Accessors
class GatoMinimizado {
	
	var ArrayList<Laberinto> laberintos
	var Laberinto laberinto
	
	new(){}//constructor vacio
	
	new (Laberinto unLaberinto){//
		this.laberinto= unLaberinto 
	}
	
	new (ArrayList<Laberinto> losLaberintos){//
		this.laberintos = losLaberintos
	}
	
	def ArrayList<LaberintoMin> minimizarLaberintos(){
		var ArrayList<LaberintoMin> resultado = new ArrayList<LaberintoMin>()
		for (Laberinto each: laberintos){
			resultado.add(new LaberintoMin(each.getIdLaberinto(), each.getNombreLaberinto(),each.getPath()))
		}
		return resultado		
	}
	
	def ArrayList<Habitacion> getHabitaciones(){
		this.laberinto.getHabitaciones()
	}
	
	def static ArrayList<HabitacionMin> minimizarHabitaciones(Laberinto lab) {
		var ArrayList <HabitacionMin> resultado = newArrayList()
		var habitaciones = lab.getHabitaciones()
		for (Habitacion each: habitaciones){
			resultado.add (new HabitacionMin (each.getIdHabitacion(),each.getAcciones()))
			}
		return resultado
	}
	
	//las necesitaremos en nuestros get del controller para no traer todo
	

	
	def String realizarAccion(Juego juego, Integer idHab, Integer idAccion,  Integer idUsuario){
		var habActual = juego.getLaberintoActual().buscarIdHab(idHab)
		var accion = habActual.buscarIdAccion(idAccion)
		var jugador = juego.buscarIdUser(idUsuario)
		accion.realizarAccion(jugador, habActual)
		return accion.getNombreAccion()//el string devuelto puede servirnos para devolver un alerta
	}
	
	def ArrayList<String> obtenerAcciones (Juego juego, Integer idUsuario, Integer idHab){
		var habActual = juego.getLaberintoActual().buscarIdHab(idHab)
		var habMin = new HabitacionMin(idHab, habActual.getAcciones())
		return habMin.getAcciones()
	}
	
}
