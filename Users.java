/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author jmess
 */

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;
import modelo_empleado.Persona;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;


public class Users extends grupos {
    private int idusuarios, id_grupo;
    private String username, password;
    private grupos grupos;
    private boolean estado;
    private conexion_bd cn;
    
    public Users() {}

    public Users(String username, String password, boolean estado, int id_grupo) {
        this.username = username;
        this.password = password;
        this.estado = estado;
        this.id_grupo = id_grupo;
    }
    

    public int getIdusuarios(){
        return idusuarios;
    }
    
    public void setIdusuarios(int idusuarios){
        this.idusuarios = idusuarios;
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getPassword(){
        return password;
    }
    
    public void setPassword(String password){
        this.password = password;
    }
    
     public grupos getGrupos() {
        return grupos;
    }

    public void setGrupos(grupos grupos) {
        this.grupos = grupos;
    }

    @Override
    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public int getId_grupo() {
        return id_grupo;
    }

    public void setId_grupo(int id_grupo) {
        this.id_grupo = id_grupo;
    }
    
    
    
    public DefaultTableModel leer(){
        DefaultTableModel table = new DefaultTableModel();
        try{
            cn = new conexion_bd();
            cn.abrir_conexion_bd();
            String query = "select u.idusuarios, u.username, g.nombre_grupo from usuarios u "
                    + "inner join grupos g on u.id_grupo = g.id_grupo "
                    + "where u.estado = 1;";
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[]={"idusuarios", "Nombre de Usuario","Puesto"};
            table.setColumnIdentifiers(encabezado);
            String datos[] = new String [3];
            while (consulta.next()){
                datos[0] = consulta.getString("idusuarios");
                datos[1] = consulta.getString("username");
                datos[2] = consulta.getString("nombre_grupo");
            
                table.addRow(datos);
            }
             cn.cerrar_conexion();
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }
        return table;
    }
    
   public int agregar(){
       int retorno = 0;
       try {
           PreparedStatement parametro;
           cn = new conexion_bd();
           String query="INSERT INTO usuarios(username,password,estado,id_grupo) VALUES (?,?,?);";
           cn.abrir_conexion_bd();
           parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
           parametro.setString(1, getUsername());
           parametro.setString(2, getPassword());
           parametro.setBoolean(3, isEstado());
           parametro.setInt(4, getId_grupo());
           
           retorno = parametro.executeUpdate();
           cn.cerrar_conexion();
       }catch(SQLException ex){
           System.out.println(ex.getMessage());
           retorno = 0;
       }
       return retorno;
   }

    
}