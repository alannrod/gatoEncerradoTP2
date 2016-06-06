package grupo10.gatoEncerrado_Dominio.Dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Accessors
class Habitacion {
	
	String nombreHabitacion
	Integer idHabitacion
	ArrayList<Accion> acciones
	Integer idAccion
	ArrayList<String> items
	ArrayList<Habitacion> linderas
		
	new(Integer unInteger, String unNombre,String unaAccion) {
		this.idHabitacion = unInteger
		this.nombreHabitacion= unNombre
		this.idAccion = 1
		this.acciones = newArrayList()
		this.items = newArrayList()
		this.linderas = newArrayList()
		this.addAcciones(unaAccion)
		
	}
	
	def addAcciones(String unString) {
		this.idAccion = this.idAccion +20
	    switch unString {
	    	case unString.startsWith("ir") : this.acciones.add (new AccionIr(idAccion,unString))
	    	case unString.startsWith("agarrar") : this.acciones.add (new AccionAgarrar(idAccion,unString))
	    	default : this.acciones.add (new AccionUsar(idAccion,unString))
	    } 
    }
    
	def Accion buscarIdAccion(Integer idAcc) {
		return acciones.findFirst[it.getIdAccion() == idAcc]
	}
	
	def quitarItemDeLaHabitacion(String elItem) {
		this.items.remove(elItem)
	}
	
	def boolean puedeIrA(Habitacion esaHabitacion
	) {
		return this.linderas.contains(esaHabitacion)
	}
	
}
