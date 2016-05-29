package grupo10.gatoEncerrado_Dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Accion{
	
	Integer idAccion
	String nombreAccion
		
	new(Integer integer, String string) {
		this.idAccion = integer
		this.nombreAccion = string
	}
	
}