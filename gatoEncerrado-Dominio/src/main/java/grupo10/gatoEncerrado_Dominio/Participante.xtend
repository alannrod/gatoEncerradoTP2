package grupo10.gatoEncerrado_Dominio

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors 
class Participante {
	
	
	String idUsuario 
	ArrayList <String> inventario
	
	new (String usuario){ 
		
		this.idUsuario = usuario
		this.inventario = new ArrayList<String>() 
	}
	
	/*
	def void elegirLaberinto(List<Laberinto> laberintos, Laberinto jugarEste){
		
		for (Laberinto lab : laberintos){
			if (lab.nombreLaberinto.contains(jugarEste.nombreLaberinto)){
					this.laberintoActual = jugarEste
					this.habitacionActual = jugarEste.habitacionInicial
			}
		}
		
	}*/
	
	
	def void agregarItemAlInventario(String item){
		if (this.inventario.size < 15){
			inventario.add(item)
		} // deberÃ­a tirar una excepciÃ³n si ya son 15
	}
	
	def void usarItem(String item){
		this.inventario.remove(item)		
	}
	
}