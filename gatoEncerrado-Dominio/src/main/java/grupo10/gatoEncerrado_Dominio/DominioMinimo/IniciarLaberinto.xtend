package grupo10.gatoEncerrado_Dominio.DominioMinimo

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import grupo10.gatoEncerrado_Dominio.Dominio.Laberinto
import grupo10.gatoEncerrado_Dominio.Dominio.Participante


@Accessors
class IniciarLaberinto{
	//estos datos los necesitaremos en el metodo GET:/laberinto:idParticipante
	Integer idLaberinto
	ArrayList<HabitacionMin> habitaciones
	ArrayList<String> inventario
	
	new(Laberinto laberinto, Participante participante) {
		var GatoMinimizado chiquitolina = new GatoMinimizado(laberinto)//GatoMin sabe achicar las clases
		this.idLaberinto = laberinto.getIdLaberinto()
		this.habitaciones= GatoMinimizado.minimizarHabitaciones(laberinto)
		this.inventario = participante.getInventario()
	}
	
	
	def devolverHabInicial(){
		//falta 
	}
	
	
	
}
	