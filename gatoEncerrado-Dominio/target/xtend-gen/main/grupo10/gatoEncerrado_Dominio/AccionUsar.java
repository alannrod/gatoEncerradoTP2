package grupo10.gatoEncerrado_Dominio;

import grupo10.gatoEncerrado_Dominio.Accion;
import grupo10.gatoEncerrado_Dominio.Habitacion;
import grupo10.gatoEncerrado_Dominio.Participante;

@SuppressWarnings("all")
public class AccionUsar extends Accion {
  private String item;
  
  public String definirItem(final String itemDado) {
    return this.item = itemDado;
  }
  
  public AccionUsar(final Integer integer, final String string) {
    super(integer, string);
  }
  
  public void realizarAccion(final Participante user, final Habitacion hab) {
    user.usarItem(this.item);
  }
}
