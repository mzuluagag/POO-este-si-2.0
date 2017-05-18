/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Artista;
import models.Obra;
import models.Usuario;
import models.Comentario;

/**
 *
 * @author Usuario
 */
@WebServlet(name = "dataLoaderC", urlPatterns = {"/dataLoaderC"})
public class dataLoaderC extends HttpServlet {

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
            out.println("<title>Servlet dataLoaderC</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet dataLoaderC at " + request.getContextPath() + "</h1>");
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
        try {
            HttpSession loadDataSession = request.getSession();
            HashMap<String, Usuario> usuarios = new HashMap<>();
            HashMap<String, Obra> obras = new HashMap<>();
            ArrayList<Comentario> comentarios = new ArrayList<>();
            
            if (null != loadDataSession.getAttribute("Obras")) {
                obras = (HashMap<String, Obra>) loadDataSession.getAttribute("Obras");
                loadDataSession.setAttribute("Obras", obras);
            } else {
                loadDataSession.setAttribute("Obras", obras);
            }
            if (null != loadDataSession.getAttribute("Usuarios")) {
                usuarios = (HashMap<String, Usuario>) loadDataSession.getAttribute("Usuarios");
                loadDataSession.setAttribute("Usuarios", usuarios);
            } else {

                loadDataSession.setAttribute("Artistas", usuarios);
            }
            if (null != loadDataSession.getAttribute("Comentarios")) {
                comentarios = (ArrayList<Comentario>) loadDataSession.getAttribute("Comentarios");
                loadDataSession.setAttribute("Comentarios", comentarios);
            } else {
                loadDataSession.setAttribute("Comentarios", comentarios);
            }
            
            FileReader users = new FileReader("C:\\Users\\ASUS\\Documents\\NetBeansProjects\\POO-este-si-2.0\\UsuarioOnly\\workbooks\\Comentarios.txt");
            BufferedReader bf = new BufferedReader(users);
            String user = bf.readLine();
            Comentario ct;
            String[] uA;
            while (user != null) {
                uA = user.split(";");
                //String descripcion, double puntuacion, Obra articulo, Usuario usuario
                comentarios.add(new Comentario(uA[0],Double.parseDouble(uA[1]),obras.get(uA[2]),usuarios.get(uA[3])));
                user = bf.readLine();

            }
            loadDataSession.setAttribute("Obras", obras);
            users.close();
        } catch (IOException e) {
            System.out.println("File not found");

        } finally {
            RequestDispatcher view = request.getRequestDispatcher("index.jsp");
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
