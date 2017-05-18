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
import java.util.*;
import models.*;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author Sergio
 */
@WebServlet(name = "edtiarArticulo", urlPatterns = {"/editarArticulo"})
public class edtiarArticulo extends HttpServlet {

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
            out.println("<title>Servlet edtiarArticulo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet edtiarArticulo at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        HashMap<String, Obra> obras;
        obras = (HashMap<String,Obra>) session.getAttribute("Obras");
        Usuario artista = (Artista) session.getAttribute("usuarioActual");
        String nombre =(String.valueOf(request.getParameter("nombre")));
        String descripcion = (String.valueOf(request.getParameter("descripcion")));
        double precio = Double.parseDouble((String.valueOf(request.getParameter("precio"))));
        String id = (String.valueOf(request.getParameter("id")));
        Obra obra = obras.get(id);
        if(artista.getId().equals(obra.getArtista().getId())){
            obra.editarObra(nombre, precio, descripcion);
            obras.put(id,obra);
            session.setAttribute("Obras",obras);
            request.setAttribute("success", true);
        }else{
            request.setAttribute("success", false);
        }
        RequestDispatcher view = request.getRequestDispatcher("menuObra.jsp");
        view.forward(request,response);
        
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
