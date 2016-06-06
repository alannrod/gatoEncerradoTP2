package grupo10.gatoEncerrado_Dominio.DominioMinimo

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import grupo10.gatoEncerrado_Dominio.Dominio.Laberinto
import grupo10.gatoEncerrado_Dominio.Dominio.Juego
import grupo10.gatoEncerrado_Dominio.Dominio.Participante
import grupo10.gatoEncerrado_Dominio.Dominio.Habitacion
import grupo10.gatoEncerrado_Dominio.Dominio.Accion

@Accessors
class LaberintoMin{
	String idLaberinto
	String nombreLaberinto
	String path
	
	new(Integer identificador, String nombre, String path) {
		this.idLaberinto = identificador.toString //conviene tenerlo en string para mostralo en la web
		this.nombreLaberinto = nombre
		this.path = path
	}
	
}