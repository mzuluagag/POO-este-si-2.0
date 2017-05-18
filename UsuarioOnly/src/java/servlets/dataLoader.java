/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import models.*;

/**
 *
 * @author Sergio
 */
@WebServlet(name = "dataLoader", urlPatterns = {"/dataLoader"})
public class dataLoader extends HttpServlet {

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
            out.println("<title>Servlet dataLoader</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet dataLoader at " + request.getContextPath() + "</h1>");
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
            HashMap<String,Usuario> usuarios = new HashMap<>();
            HashMap<String,Artista> artistas = new HashMap<>();
            if (null != loadDataSession.getAttribute("Usuarios")) {
                usuarios = (HashMap<String,Usuario>) loadDataSession.getAttribute("Usuarios");
                loadDataSession.setAttribute("Usuarios", usuarios);
            } else {

                loadDataSession.setAttribute("Usuarios", usuarios);
            }
            if (null != loadDataSession.getAttribute("Artistas")) {
                artistas = (HashMap<String,Artista>) loadDataSession.getAttribute("Artistas");
                loadDataSession.setAttribute("Artistas", artistas);
            } else {

                loadDataSession.setAttribute("Artistas", artistas);
            }
            FileReader users = new FileReader("C:\\Users\\Usuario\\Documents\\NetBeansProjects\\POO3ESTESI\\UsuarioOnly\\workbooks\\Usuarios.txt");
            BufferedReader bf = new BufferedReader(users);
            String user = bf.readLine();
            Artista art;
            String[] uA;
            while (user != null) {
                uA = user.split(";");
            
                if(uA[6].equals("Usuario")){
                    
                    usuarios.put(uA[4],new Usuario(uA[0], uA[1], uA[2], uA[3],
                        uA[4], uA[5], Double.parseDouble(uA[7])));
                    user = bf.readLine();
                
                }else{
                    art = new Artista(uA[0], uA[1], uA[2], uA[3],
                    uA[4], uA[5], Double.parseDouble(uA[7]));
                    usuarios.put(uA[4],art);
                    artistas.put(uA[4],art);
                    user = bf.readLine();
                }
            }
            loadDataSession.setAttribute("Usuarios", usuarios);
            users.close();
            RequestDispatcher view = request.getRequestDispatcher("index.jsp");
            view.forward(request, response);
        } catch (IOException e) {
            System.out.println("File not found");

        } finally{
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
