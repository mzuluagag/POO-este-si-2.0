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
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import models.*;
import java.util.*;

/**
 *
 * @author Sergio
 */
@WebServlet(name = "agregarComentario", urlPatterns = {"/agregarComentario"})
public class agregarComentario extends HttpServlet {

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
            out.println("<title>Servlet agregarComentario</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet agregarComentario at " + request.getContextPath() + "</h1>");
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
        ArrayList<Comentario> comentarios = new ArrayList<>();
        if (null != session.getAttribute("Comentarios")) {
            comentarios = (ArrayList<Comentario>) session.getAttribute("Comentarios");
            //getDataSession.setAttribute("Usuarios", usuarios);
        } else {
            session.setAttribute("Comentarios", comentarios);
        }
        
        Obra obra = (Obra) session.getAttribute("ObraActual");
        Usuario user = (Usuario) session.getAttribute("usuarioActual");
        String descripcion = String.valueOf(request.getParameter("descripcion"));
        String s1 = String.valueOf(request.getParameter("s1"));
        String s2 = String.valueOf(request.getParameter("s2"));
        String s3 = String.valueOf(request.getParameter("s3"));
        String s4 = String.valueOf(request.getParameter("s4"));
        String s5 = String.valueOf(request.getParameter("s5"));
        
        double puntuacion;
        if(s1.equals("on")){
            puntuacion = 1;
        }else if(s2.equals("on")){
            puntuacion= 2;
        }else if(s3.equals("on")){
            puntuacion = 3;
        }else if(s4.equals("on")){
            puntuacion = 4;
        }else if(s5.equals("on")){
            puntuacion =5;
        }else{
            puntuacion = 0;
        }
        
        Comentario coment = new Comentario(descripcion,puntuacion, obra, user);
        comentarios.add(coment);
        obra.getComentarios().add(coment);
        HashMap<String, Obra> obras = (HashMap) session.getAttribute("Obras");
        obras.put(obra.getId(),obra);
        
        
        RequestDispatcher view = request.getRequestDispatcher("infoObra.jsp");
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
