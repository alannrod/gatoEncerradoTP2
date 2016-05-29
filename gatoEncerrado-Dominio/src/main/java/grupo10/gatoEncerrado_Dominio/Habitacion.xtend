package grupo10.gatoEncerrado_Dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Accessors
class Habitacion {
	
	String nombreHabitacion
	Integer idHabitacion
	ArrayList<Accion> acciones
	Integer idAccion
		
	new(Integer unInteger, String unNombre,String unaAccion) {
		this.idHabitacion = unInteger
		this.nombreHabitacion= unNombre
		this.addAcciones(unaAccion)
		this.idAccion = 1
	}
	
	def addAcciones(String unString) {
		val accionNueva = new Accion(idAccion,unString)
		idAccion = idAccion +20
		this.acciones.add(accionNueva)
		}
	
	def buscarIdAccion(Integer idAcc) {
		for(var i = 0 ;i <this.acciones.size() ; i++){
            if(this.acciones.get(i).getIdAccion()== idAcc){
            	return this.acciones.get(i);
            }
        }
	}
	
}