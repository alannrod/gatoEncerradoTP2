package grupo10.gatoEncerrado_Dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Accessors
class Laberinto {
	
	Integer idLaberinto 
	String nombreLaberinto
	String descripcion 
	Integer idHabitacion
	ArrayList<String> items
	ArrayList<Habitacion> habitaciones
	ArrayList<String> nombreHabitaciones
	String habInicial
	String habFinal
	String path 
	
	new(Integer idLaberinto, String nombreLaberinto, String descripcion, String nombreHabitacion1,String nombreHabitacion2, String accion1, String accion2, String item, String itemDos, String path) {
		this.idHabitacion = 1
		this.habitaciones = newArrayList()
		this.items = newArrayList()
		this.nombreHabitaciones = newArrayList()
		this.idLaberinto = idLaberinto
		this.nombreLaberinto = nombreLaberinto
		this.descripcion = descripcion
		this.addHabitacion(nombreHabitacion1, accion1)
		this.addHabitacion(nombreHabitacion2, accion2)
		this.items.add(item)
		this.items.add(itemDos)
		this.path = path
		
		
	}
	
	def addHabitacion(String unstring,String accion) {
		
		val Habitacion habitacionNueva = new Habitacion (idHabitacion, unstring,accion)
		
		if (this.idHabitacion == 1){
			this.habInicial = habitacionNueva.getNombreHabitacion()
		}
		else this.habFinal = habitacionNueva.getNombreHabitacion()
		this.idHabitacion = this.idHabitacion +1
		this.habitaciones.add(habitacionNueva)
	}
	
	
	def buscarIdHab(Integer idHab) {
		return habitaciones.findFirst[it.idHabitacion == idHab]
     }

}