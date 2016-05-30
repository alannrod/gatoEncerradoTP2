package grupo10.gatoEncerrado_Dominio

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
		this.addAcciones(unaAccion)
		this.idAccion = 1
		this.items = newArrayList()
		this.linderas = newArrayList()
	}
	
	def addAcciones(String unString) {
		idAccion = idAccion +20
	    switch unString {
	    	case unString.startsWith("ir") : this.acciones.add (new AccionIr(idAccion,unString))
	    	case unString.startsWith("agarrar") : this.acciones.add (new AccionAgarrar(idAccion,unString))
	    	default : this.acciones.add (new AccionUsar(idAccion,unString))
	    } 
    }
    
	def Accion buscarIdAccion(Integer idAcc) {
		for(var i = 0 ;i <this.acciones.size() ; i++){
            if(this.acciones.get(i).getIdAccion()== idAcc){
            	return this.acciones.get(i);
            }
        }
	}
	
	def quitarItemDeLaHabitacion(String elItem) {
		this.items.remove(elItem)
	}
	
	def boolean puedeIrA(Habitacion esaHabitacion
	) {
		return this.linderas.contains(esaHabitacion)
	}
	
}