/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author jmess
 */
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import modelo.conexion_bd;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author E7440
 */

public class UsersDAO extends conexion_bd{
    Users use = null;
    conexion_bd con;
    Connection cn = null; 
    Statement st = null;
    ResultSet rs = null;
    public Users identificar(Users user) throws Exception{
        String query = "select u.idusuarios, g.nombre_grupo from usuarios u "
                + "inner join grupos g on u.id_grupo = g.id_grupo "
                + "where u.estado = 1 and u.username = '"+ user.getUsername() +"' and u.password = '"+ user.getPassword() +"';";
        con = new conexion_bd();
        
        try{
            cn = con.abrir_conexion_bd();
            st = cn.createStatement();
            rs = st.executeQuery(query);
            if(rs.next() == true){
                use = new Users();
                use.setIdusuarios(rs.getInt("idusuarios"));
                use.setUsername(user.getUsername());
                use.setGrupos(new grupos());
                use.getGrupos().setNombre_grupo(rs.getString("nombre_grupo"));
                use.setEstado(true);
            }
        }catch(Exception ex){
            System.out.println("Error" + ex.getMessage());
        }finally{
            if(rs!=null && rs.isClosed() == false){
                rs.close();
            }
            rs = null;
            if(st!=null && st.isClosed() == false){
                st.close();
            }
            st = null;
            if(cn!=null & cn.isClosed() == false){
                cn.close();
            }
            cn = null;
        }
        return use;
    }

    
    
}
