package grupo10.gatoEncerrado_Dominio;

import grupo10.gatoEncerrado_Dominio.Accion;
import grupo10.gatoEncerrado_Dominio.Habitacion;
import grupo10.gatoEncerrado_Dominio.Participante;

@SuppressWarnings("all")
public class AccionAgarrar extends Accion {
  private String item;
  
  public AccionAgarrar(final Integer integer, final String string) {
    super(integer, string);
  }
  
  public String definirItem(final String itemDelUsuario) {
    return this.item = itemDelUsuario;
  }
  
  public void realizarAccion(final Participante user, final Habitacion hab) {
    user.agregarItemAlInventario(this.item);
    hab.quitarItemDeLaHabitacion(this.item);
  }
}
