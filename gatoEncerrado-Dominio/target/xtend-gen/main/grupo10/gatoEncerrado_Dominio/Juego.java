package grupo10.gatoEncerrado_Dominio;

import com.google.common.base.Objects;
import grupo10.gatoEncerrado_Dominio.Accion;
import grupo10.gatoEncerrado_Dominio.Habitacion;
import grupo10.gatoEncerrado_Dominio.Laberinto;
import grupo10.gatoEncerrado_Dominio.Participante;
import java.util.ArrayList;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Juego {
  private final static Juego instance = new Juego();
  
  private Participante idUsuario;
  
  private ArrayList<Laberinto> laberintos = new ArrayList<Laberinto>();
  
  private Integer idLaberinto;
  
  private Laberinto laberintoActual;
  
  public Juego() {
    Participante _participante = new Participante("Pablo24");
    this.idUsuario = _participante;
    this.addLaberinto("Laberinto 1", "MacGyverInt", "Habitacion del Mal", "Habitacion del bien", "Ir a escalera", "No hacer nada", "Lentes", "Pila AA");
    this.addLaberinto("Laberinto 2", "Date un respiro", "Habitacion para novatos", "Habitacion para genios", "Caminar a la derecha", "Correr", "Escalera", "Largavista");
    this.addLaberinto("Laberinto 3", "El tiempo es oro", "Habitacion dorada", "Habitacion plateada", "Saltar la pared", "Sentarse", "Bomba", "Pizza");
    this.addLaberinto("Laberinto 4", "Aprobando la materia", "Habitacion Tenes un 7", "Habitacion Tenes un 10", "Aprobar", "Rezar", "Angular", "CSS");
  }
  
  public static Juego getInstance() {
    return Juego.instance;
  }
  
  public void addLaberinto(final String nombreLaberinto, final String descripcion, final String nombreHabitacion1, final String nombreHabitacion2, final String accion1, final String accion2, final String item, final String itemDos) {
    Laberinto _laberinto = new Laberinto(this.idLaberinto, nombreLaberinto, descripcion, nombreHabitacion1, nombreHabitacion2, accion1, accion2, item, itemDos);
    this.laberintos.add(_laberinto);
    this.idLaberinto = Integer.valueOf(((this.idLaberinto).intValue() + 1));
  }
  
  public static ArrayList<Laberinto> getLaberintosParaParticipante(final Integer integer) {
    boolean _equals = Objects.equal(integer, "Pablo24");
    if (_equals) {
      return Juego.instance.laberintos;
    }
    return null;
  }
  
  public static Laberinto getLaberinto(final Integer idUsuario, final Integer idLaberinto) {
    Laberinto _buscarId = Juego.instance.buscarId(idLaberinto);
    return Juego.instance.laberintoActual = _buscarId;
  }
  
  public Laberinto buscarId(final Integer idLab) {
    for (int i = 0; (i < this.laberintos.size()); i++) {
      Laberinto _get = this.laberintos.get(i);
      Integer _idLaberinto = _get.getIdLaberinto();
      boolean _equals = Objects.equal(_idLaberinto, idLab);
      if (_equals) {
        return this.laberintos.get(i);
      }
    }
    return null;
  }
  
  public static Accion realizarAccion(final Integer idHabitacion, final Integer idAccion, final Integer idUsuario) {
    Habitacion _buscarIdHab = Juego.instance.laberintoActual.buscarIdHab(idHabitacion);
    return _buscarIdHab.buscarIdAccion(idAccion);
  }
  
  @Pure
  public Participante getIdUsuario() {
    return this.idUsuario;
  }
  
  public void setIdUsuario(final Participante idUsuario) {
    this.idUsuario = idUsuario;
  }
  
  @Pure
  public ArrayList<Laberinto> getLaberintos() {
    return this.laberintos;
  }
  
  public void setLaberintos(final ArrayList<Laberinto> laberintos) {
    this.laberintos = laberintos;
  }
  
  @Pure
  public Integer getIdLaberinto() {
    return this.idLaberinto;
  }
  
  public void setIdLaberinto(final Integer idLaberinto) {
    this.idLaberinto = idLaberinto;
  }
  
  @Pure
  public Laberinto getLaberintoActual() {
    return this.laberintoActual;
  }
  
  public void setLaberintoActual(final Laberinto laberintoActual) {
    this.laberintoActual = laberintoActual;
  }
}
