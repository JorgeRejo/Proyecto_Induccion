/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Users;
import modelo.UsersDAO;

/**
 *
 * @author E7440
 */
@WebServlet(name = "login_servlet", urlPatterns = {"/login_servlet"})
public class login_servlet extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        try {
            if (action != null) {
                switch (action) {
                    case "login":
                        login(request, response);
                        break;
                    case "logout":
                        logout(request, response);
                    default:
                        response.sendRedirect("index.jsp");
                }
            } else {
                response.sendRedirect("index.jsp");
            }
        } catch (Exception ex) {
            try {
                this.getServletConfig().getServletContext().getRequestDispatcher("/").forward(request, response);
            } catch (IOException | ServletException e) {
                System.out.println("Error" + e.getMessage());
            }
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession sesion;
        UsersDAO userdao;
        Users users;
        users = this.obtenerUsuario(request);
        userdao = new UsersDAO();
        users = userdao.identificar(users);
        
        if(users!=null && users.getGrupos().getNombre_grupo().equals("Administrador")){
            sesion = request.getSession();
            sesion.setAttribute("username",users);
            request.setAttribute("msje","Welcome Back!");
            this.getServletConfig().getServletContext().getRequestDispatcher("/menu.jsp").forward(request,response);
        }else if(users!=null && users.getGrupos().getNombre_grupo().equals("Empleado")){
            sesion = request.getSession();
            sesion.setAttribute("username",users);
            request.setAttribute("msje","Welcome Back!");
            this.getServletConfig().getServletContext().getRequestDispatcher("/menu_empleados.jsp").forward(request,response);
        }else{
           request.setAttribute("msje","Datos incorrectos");
           request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
    

    private void logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession sesion = request.getSession();
        sesion.setAttribute("username",null);
        sesion.invalidate();
        response.sendRedirect("index.jsp");
    }

    private Users obtenerUsuario(HttpServletRequest request) {
        Users us = new Users();
        us.setUsername(request.getParameter("username"));
        us.setPassword(request.getParameter("password"));
        return us;
    }

}