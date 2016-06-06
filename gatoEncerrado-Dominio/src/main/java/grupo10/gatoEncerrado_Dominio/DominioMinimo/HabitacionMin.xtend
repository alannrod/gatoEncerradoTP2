package grupo10.gatoEncerrado_Dominio.DominioMinimo

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import grupo10.gatoEncerrado_Dominio.Dominio.Accion

@Accessors
class HabitacionMin{
	//estos datos nos serviran al iniciar juego en un laberinto
	String idHabitacion
	ArrayList<String> acciones

	
	new(Integer identificador, ArrayList<Accion> actions) {
		this.idHabitacion = identificador.toString()
		for (Accion each: actions){
			this.acciones.add(each.getNombreAccion())
		}
	}
	
}