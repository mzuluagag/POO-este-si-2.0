/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import models.Usuario;
import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import models.Artista;

/**
 *
 * @author Sergio
 */
@WebServlet(name = "getData", urlPatterns = {"/getData"})
public class getData extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet getData</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet getData at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession getDataSession = request.getSession();
        HashMap<String,Usuario> usuarios = new HashMap<>();
        HashMap<String,Artista> artistas = new HashMap<>();
        ArrayList<String> ids = new ArrayList<>();
        if (null != getDataSession.getAttribute("Usuarios")) {
            usuarios = (HashMap<String,Usuario>) getDataSession.getAttribute("Usuarios");
        } else {
            getDataSession.setAttribute("Usuarios", usuarios);
        }
        if (null != getDataSession.getAttribute("Artistas")) {
            artistas = (HashMap<String,Artista>) getDataSession.getAttribute("Artistas");
        } else {
            getDataSession.setAttribute("Artistas", artistas);
        }
        String nombres = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String sobrenombre = request.getParameter("sobrenombre");
        String email = String.valueOf(request.getParameter("email"));
        String id = request.getParameter("id");
        String fechaDeNacimiento = String.valueOf(request.getParameter("fdn"));
        String rol = (request.getParameter("rol"));
        if (rol.equals("Artista")) {
            usuarios.put(id,new Artista(nombres, apellidos, sobrenombre, email, id, fechaDeNacimiento));
            artistas.put(id,new Artista(nombres, apellidos, sobrenombre, email, id, fechaDeNacimiento));
        }else{
            usuarios.put(id,new Usuario(nombres, apellidos, sobrenombre, email, id, fechaDeNacimiento));
        }
        

        RequestDispatcher view = request.getRequestDispatcher("inicioSesion.jsp");
        view.forward(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
