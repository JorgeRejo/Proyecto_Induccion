/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo_empleado;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import javax.swing.table.DefaultTableModel;
import modelo.conexion_bd;
/**
 *
 * @author jmess
 */
public class Empleado extends Persona{
    
    private conexion_bd cn;
    private String codigoEmpleado;
    private String DPI;
    private String direccion;
    private String puesto;
    private int idempleado;
    
    public Empleado() {}

    public Empleado(int idempleado, String codigoEmpleado, String nombre, String apellido, String DPI, String direccion, String telefono, String puesto) {
        super(nombre, apellido, telefono);
        this.codigoEmpleado = codigoEmpleado;
        this.direccion = direccion;
        this.puesto = puesto;
        this.idempleado = idempleado;
        this.DPI = DPI;
    }
    

    public String getDPI() {
        return DPI;
    }

    public void setDPI(String DPI) {
        this.DPI = DPI;
    }
    
    public String getCodigoEmpleado() {
        return codigoEmpleado;
    }

    public void setCodigoEmpleado(String codigo) {
        this.codigoEmpleado = codigo;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getPuesto() {
        return puesto;
    }

    public void setPuesto(String puesto) {
        this.puesto = puesto;
    }
    
    public int getIdempleado() {
        return idempleado;
    }

    public void setIdempleado(int idempleado) {
        this.idempleado = idempleado;
    }
    
    
    public DefaultTableModel leer(){
    DefaultTableModel tabla = new DefaultTableModel();
    try{
        cn = new conexion_bd();
        cn.abrir_conexion_bd();
        String query = "SELECT * FROM empleados;";
        ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
        String encabezado[]={"Idempleados","CodigoEmpleado","Nombre","Apellido", "DPI","Direccion","Telefono","Puesto"};
        tabla.setColumnIdentifiers(encabezado);
        String datos[] = new String [8];
        while (consulta.next()){
            datos[0] = consulta.getString("idempleados");
            datos[1] = consulta.getString("codigoEmpleado");
            datos[2] = consulta.getString("nombre");
            datos[3] = consulta.getString("apellido");
            datos[4] = consulta.getString("DPI");
            datos[5] = consulta.getString("direccion");
            datos[6] = consulta.getString("telefono");
            datos[7] = consulta.getString("puesto");
            
            tabla.addRow(datos);
        }
        
        cn.cerrar_conexion();
    }catch (SQLException ex){
        System.out.println(ex.getMessage());
    }
      return tabla; 
    }
    @Override
   public int agregar(){
       int retorno = 0;
       try {
           PreparedStatement parametro;
           cn = new conexion_bd();
           String query="INSERT INTO empleados(codigoEmpleado, nombre, apellido, DPI, direccion, telefono, puesto) VALUES (?,?,?,?,?,?,?);";
           cn.abrir_conexion_bd();
           parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
           parametro.setString(1, getCodigoEmpleado());
           parametro.setString(2, getNombre());
           parametro.setString(3, getApellido());
           parametro.setString(4, getDPI());
           parametro.setString(5, getDireccion());
           parametro.setString(6, getTelefono());
           parametro.setString(7, getPuesto());
           
           retorno = parametro.executeUpdate();
           cn.cerrar_conexion();
       }catch(SQLException ex){
           System.out.println(ex.getMessage());
           retorno = 0;
       }
       return retorno;
   }
    @Override
   public int modificar(){ 
   int retorno = 0;
       try {
           PreparedStatement parametro;
           cn = new conexion_bd();
           String query="UPDATE empleados SET codigoEmpleado=?, nombre=?, apellido=?, DPI=?, direccion=?, telefono=?, puesto=? WHERE idempleado=?;";
           cn.abrir_conexion_bd();
           parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
           parametro.setString(1, getCodigoEmpleado());
           parametro.setString(2, getNombre());
           parametro.setString(3, getApellido());
           parametro.setString(4, getDireccion());
           parametro.setString(5, getTelefono());
           parametro.setString(6, getPuesto());
           parametro.setInt(7, getIdempleado());
           
           retorno = parametro.executeUpdate();
           cn.cerrar_conexion();
       }catch(SQLException ex){
           System.out.println(ex.getMessage());
           retorno = 0;
       }
       return retorno;
   }
   
    @Override
   public int eliminar(){ 
   int retorno = 0;
       try {
           PreparedStatement parametro;
           cn = new conexion_bd();
          /* String query="DELETE FROM empleados WHERE idempleado=?";*/
           String query="DELETE FROM `bd_idream2`.`empleados` WHERE `idempleado` = ?;";
           cn.abrir_conexion_bd();
           parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
           parametro.setInt(1, getIdempleado());
           
           retorno = parametro.executeUpdate();
           cn.cerrar_conexion();
       }catch(SQLException ex){
           System.out.println(ex.getMessage());
           retorno = 0;
       }
       return retorno;
   }
    
    
}
