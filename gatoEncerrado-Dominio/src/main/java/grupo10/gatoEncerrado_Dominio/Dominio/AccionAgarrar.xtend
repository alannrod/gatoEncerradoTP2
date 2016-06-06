package grupo10.gatoEncerrado_Dominio.Dominio

import grupo10.gatoEncerrado_Dominio.Dominio.Accion

class AccionAgarrar extends Accion {
	String item
	
	new(Integer integer, String string) {
		super(integer, string)
	}
	
	def definirItem(String itemDelUsuario){
		this.item = itemDelUsuario
	}
	
	override realizarAccion(Participante user, Habitacion hab) {
		user.agregarItemAlInventario(item)
		hab.quitarItemDeLaHabitacion(item)
	}
	
	
}
