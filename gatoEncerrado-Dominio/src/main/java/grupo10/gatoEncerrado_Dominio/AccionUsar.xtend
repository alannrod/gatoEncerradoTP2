package grupo10.gatoEncerrado_Dominio

import grupo10.gatoEncerrado_Dominio.Accion

class AccionUsar extends Accion {
	String item
	
	def definirItem(String itemDado){
		this.item= itemDado
	}
	new(Integer integer, String string) {
		super(integer, string)
	}
	
	override realizarAccion(Participante user, Habitacion hab) {
		user.usarItem(item)
	}
	
}