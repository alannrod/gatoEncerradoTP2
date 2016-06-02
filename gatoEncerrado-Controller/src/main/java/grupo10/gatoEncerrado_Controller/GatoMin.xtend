package grupo10.gatoEncerrado_Controller

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import grupo10.gatoEncerrado_Dominio.Laberinto
import grupo10.gatoEncerrado_Dominio.Juego
import grupo10.gatoEncerrado_Dominio.Participante
import grupo10.gatoEncerrado_Dominio.Habitacion
import grupo10.gatoEncerrado_Dominio.Accion

@Accessors
class LaberintoMin{
	String idLaberinto
	String nombreLaberinto
	String path
	String imagen
	
	new(Integer identificador, String nombre) {
		this.idLaberinto = identificador.toString //conviene tenerlo en string para mostralo en la web
		this.nombreLaberinto = nombre
	}
	
}

@Accessors
class IniciarLaberinto{
	//estos datos los necesitaremos en el metodo GET:/laberinto:idParticipante
	String idLaberinto
	ArrayList<HabitacionMin> habitaciones
	ArrayList<String> inventario
	
	new(Laberinto laberinto, Participante participante) {
		var GatoMin chiquitolina = new GatoMin(laberinto)//GatoMin sabe achicar las clases
		this.idLaberinto = laberinto.getIdLaberinto().toString//lo mostramos como texto
		this.habitaciones= chiquitolina.minimizarHabitaciones()
		this.inventario = participante.getInventario()
	}
	
}

@Accessors
class HabitacionMin{
	//estos datos nos serviran al iniciar juegp en un laberinto
	String idHabitacion
	ArrayList<String> acciones

	
	new(Integer identificador, ArrayList<Accion> actions) {
		this.idHabitacion = identificador.toString()
		for (Accion each: actions){
			this.acciones.add(each.getNombreAccion())
		}
	}
	
}



@Accessors
class GatoMin {
	//Aqui "achicaremos" nuestras clases del dominio de acuerdo a los datos que necesitemos
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
			resultado.add(new LaberintoMin(each.getIdLaberinto(), each.getNombreLaberinto()))
		}
		return resultado		
	}
	
	def ArrayList<HabitacionMin> minimizarHabitaciones() {
		var ArrayList <HabitacionMin> resultado = newArrayList()
		var habitaciones = this.laberinto.getHabitaciones()
		for (Habitacion each: habitaciones){
			resultado.add (new HabitacionMin (each.getIdHabitacion(),each.getAcciones()))
			}
		return resultado
	}
	
	//las necesitaremos en nuestros get del controller para no traer todo
	
	def IniciarLaberinto iniciarLaberinto(Juego juego, Integer idLaberinto, Integer idUsuario){
		var lab = juego.buscarId(idLaberinto)
		var usuario = juego.buscarIdUser(idUsuario)
		return new IniciarLaberinto(lab, usuario)
	}
	
	def String realizarAccion(Juego juego, Integer idHab, Integer idAccion,  Integer idUsuario){
		var habActual = juego.getLaberintoActual().buscarIdHab(idHab)
		var accion = habActual.buscarIdAccion(idAccion)
		var jugador = juego.buscarIdUser (idUsuario)
		accion.realizarAccion(jugador, habActual)
		return accion.getNombreAccion()//el string devuelto puede servirnos para devolver un alerta
	}
	
	def ArrayList<String> obtenerAcciones (Juego juego, Integer idUsuario, Integer idHab){
		var habActual = juego.getLaberintoActual().buscarIdHab(idHab)
		var habMin = new HabitacionMin(idHab, habActual.getAcciones())
		return habMin.getAcciones()
	}
	
}