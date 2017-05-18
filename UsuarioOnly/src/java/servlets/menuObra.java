/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Artista;
import models.Obra;
import java.util.HashMap;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "menuObra", urlPatterns = {"/menuObra"})
public class menuObra extends HttpServlet {

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
            out.println("<title>Servlet menuObra</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet menuObra at " + request.getContextPath() + "</h1>");
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
        HttpSession Session = request.getSession();
        HashMap<String, Obra> obras = new HashMap<>();
        try {
            Artista artista = (Artista) Session.getAttribute("usuarioActual");
            int idObras;
            if (null != Session.getAttribute("Obras")) {
                obras = (HashMap<String, Obra>) Session.getAttribute("Obras");
                //getDataSession.setAttribute("Usuarios", usuarios);
            } else {
                Session.setAttribute("Obras", obras);
            }
            if (null != Session.getAttribute("ObrasID")) {
                idObras = Integer.parseInt((String.valueOf(Session.getAttribute("ObrasID"))));
                Session.setAttribute("ObrasID", idObras + 1);
            } else {
                idObras = 1;
                Session.setAttribute("ObrasID", idObras+1);
            }
            String titulo = request.getParameter("titulo");
            double precio = Double.valueOf(request.getParameter("precio"));
            String url = String.valueOf(request.getParameter("url"));
            String descripcion = String.valueOf(request.getParameter("descripcion"));
            String autor = artista.getNombres();

            Obra obra = new Obra(titulo, precio, url, descripcion, artista, String.valueOf(idObras));
            artista.addObra(obra);
            HashMap<String, Artista> artistas = (HashMap<String,Artista>) Session.getAttribute("Artistas");
            artistas.put(artista.getId(),artista);
            obras.put(String.valueOf(idObras), obra);
            
            RequestDispatcher view = request.getRequestDispatcher("menuUsuario.jsp");
            view.forward(request, response);
        } catch (ClassCastException c) {
            request.setAttribute("success", false);
            RequestDispatcher view = request.getRequestDispatcher("menuUsuario.jsp");
            view.forward(request, response);
        }
        
       
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
