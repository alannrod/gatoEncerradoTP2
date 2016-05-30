package grupo10.gatoEncerrado_Dominio;

import grupo10.gatoEncerrado_Dominio.Accion;
import grupo10.gatoEncerrado_Dominio.Habitacion;
import grupo10.gatoEncerrado_Dominio.Participante;
import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class AccionIr extends Accion {
  private Habitacion adonde;
  
  public AccionIr(final Integer integer, final String string) {
    super(integer, string);
  }
  
  public Habitacion definirHabitacion(final Habitacion otra) {
    return this.adonde = otra;
  }
  
  public void realizarAccion(final Participante user, final Habitacion hab) {
    boolean _puedeIrA = hab.puedeIrA(this.adonde);
    if (_puedeIrA) {
      InputOutput.<String>println("Vayase de esta habitacion");
    } else {
      InputOutput.<String>println("No puede irse");
    }
  }
}
