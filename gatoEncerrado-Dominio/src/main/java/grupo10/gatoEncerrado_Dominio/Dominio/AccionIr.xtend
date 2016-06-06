package grupo10.gatoEncerrado_Dominio.Dominio

import grupo10.gatoEncerrado_Dominio.Dominio.Accion

class AccionIr extends Accion {
	Habitacion adonde
	
	new(Integer integer, String string) {
		super(integer, string)
	}
	def definirHabitacion(Habitacion otra){
		this.adonde= otra
	}
	override realizarAccion(Participante user, Habitacion hab) {
		if (hab.puedeIrA(adonde))
		println("Vayase de esta habitacion")
		else
		println("No puede irse")
	}
	
}
