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
	
	new(Integer idLaberinto, String nombreLaberinto, String descripcion, String nombreHabitacion1,String nombreHabitacion2, String accion1, String accion2, String item, String itemDos) {
		this.idLaberinto = idLaberinto
		this.nombreLaberinto = nombreLaberinto
		this.descripcion = descripcion
		this.habitaciones.addHabitacion("nombreHabitacion1", accion1)
		this.habitaciones.addHabitacion("nombreHabitacion2", accion2)
		this.items.add("item")
		this.items.add("itemDos")
		this.idHabitacion = 1
	}
	
	def addHabitacion(ArrayList<Habitacion> habitaciones, String unstring,String accion) {
		val habitacionNueva = new Habitacion (idHabitacion, unstring,accion)
		idHabitacion = idHabitacion +1
		if (idHabitacion == 1){
			habInicial = habitacionNueva.getNombreHabitacion()
		}
		else habFinal = habitacionNueva.getNombreHabitacion()
	}
	
	def buscarIdHab(Integer idHab) {
		for(var i = 0 ;i <this.habitaciones.size() ; i++){
            if(this.habitaciones.get(i).getIdHabitacion()== idHab){
            	return this.habitaciones.get(i);
            	}
            }
     }

}