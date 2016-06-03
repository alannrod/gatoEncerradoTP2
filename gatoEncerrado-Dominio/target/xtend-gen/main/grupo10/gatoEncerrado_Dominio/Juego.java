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
  
  private Participante usuario;
  
  private ArrayList<Laberinto> laberintos = new ArrayList<Laberinto>();
  
  private Integer idLaberinto;
  
  private Laberinto laberintoActual;
  
  public Juego() {
    Participante _participante = new Participante("Pablo24", Integer.valueOf(24));
    this.usuario = _participante;
    this.usuario.agregarItemAlInventario("tijera escolar");
    this.idLaberinto = Integer.valueOf(0);
    this.addLaberinto("Laberinto 1", "MacGyverInt", "Habitacion del Mal", "Habitacion del bien", "Ir a escalera", "No hacer nada", "Lentes", "Pila AA", "laberintos_1.jpg");
    this.addLaberinto("Laberinto 2", "Date un respiro", "Habitacion para novatos", "Habitacion para genios", "Caminar a la derecha", "Correr", "Escalera", "Largavista", "laberintos_2.jpg");
    this.addLaberinto("Laberinto 3", "El tiempo es oro", "Habitacion dorada", "Habitacion plateada", "Saltar la pared", "Sentarse", "Bomba", "Pizza", "laberintos_3.png");
    this.addLaberinto("Laberinto 4", "Aprobando la materia", "Habitacion Tenes un 7", "Habitacion Tenes un 10", "Aprobar", "Rezar", "Angular", "CSS", "laberintos_4.jpg");
  }
  
  public static Juego getInstance() {
    return Juego.instance;
  }
  
  public void addLaberinto(final String nombreLaberinto, final String descripcion, final String nombreHabitacion1, final String nombreHabitacion2, final String accion1, final String accion2, final String item, final String itemDos, final String path) {
    Laberinto _laberinto = new Laberinto(this.idLaberinto, nombreLaberinto, descripcion, nombreHabitacion1, nombreHabitacion2, accion1, accion2, item, itemDos, path);
    this.usuario.addLab(_laberinto);
    this.idLaberinto = Integer.valueOf(((this.idLaberinto).intValue() + 1));
  }
  
  public static ArrayList<Laberinto> getLaberintosParaParticipante(final Integer integer) {
    Integer _idUsuario = Juego.instance.usuario.getIdUsuario();
    boolean _equals = Objects.equal(integer, _idUsuario);
    if (_equals) {
      return Juego.instance.usuario.getLaberintos();
    } else {
      throw new IllegalArgumentException("no se encontro participante");
    }
  }
  
  public static Laberinto getLaberinto(final Integer idUsuario, final Integer idLaberinto) {
    ArrayList<Laberinto> _laberintosParaParticipante = Juego.getLaberintosParaParticipante(idUsuario);
    Juego.instance.laberintos = _laberintosParaParticipante;
    ArrayList<Laberinto> _laberintos = Juego.instance.usuario.getLaberintos();
    Laberinto _get = _laberintos.get(1);
    Juego.instance.laberintoActual = _get;
    return Juego.instance.laberintoActual;
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
  
  public void realizarAccion(final Integer idHabitacion, final Integer idAccion, final Integer idUsuario) {
    Habitacion _buscarIdHab = Juego.instance.laberintoActual.buscarIdHab(idHabitacion);
    final Accion queHace = _buscarIdHab.buscarIdAccion(idAccion);
    Habitacion _buscarIdHab_1 = Juego.instance.laberintoActual.buscarIdHab(idHabitacion);
    queHace.realizarAccion(Juego.instance.usuario, _buscarIdHab_1);
  }
  
  public Participante buscarIdUser(final Integer idUsuario) {
    Integer _idUsuario = this.usuario.getIdUsuario();
    boolean _equals = Objects.equal(_idUsuario, idUsuario);
    if (_equals) {
      return this.usuario;
    }
    return null;
  }
  
  @Pure
  public Participante getUsuario() {
    return this.usuario;
  }
  
  public void setUsuario(final Participante usuario) {
    this.usuario = usuario;
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
