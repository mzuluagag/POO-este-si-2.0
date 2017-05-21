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

/**
 *
 * @author Usuario
 */
@WebServlet(name = "dataLoaderM", urlPatterns = {"/dataLoaderM"})
public class dataLoaderM extends HttpServlet {

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
            out.println("<title>Servlet dataLoaderM</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet dataLoaderM at " + request.getContextPath() + "</h1>");
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
            HashMap<String, Artista> artistas = new HashMap<>();
            HashMap<String, Obra> obras = new HashMap<>();
            int idObras;
            if (null != loadDataSession.getAttribute("Obras")) {
                obras = (HashMap<String, Obra>) loadDataSession.getAttribute("Obras");
                loadDataSession.setAttribute("Obras", obras);
            } else {
                loadDataSession.setAttribute("Obras", obras);
            }
            if (null != loadDataSession.getAttribute("ObrasID")) {
                idObras = Integer.parseInt((String.valueOf(loadDataSession.getAttribute("ObrasID"))));
                loadDataSession.setAttribute("ObrasID", idObras + 1);
            } else {
                idObras = 1;
                loadDataSession.setAttribute("ObrasID", idObras+1);
            }
            if (null != loadDataSession.getAttribute("Artistas")) {
                artistas = (HashMap<String, Artista>) loadDataSession.getAttribute("Artistas");
                loadDataSession.setAttribute("Artistas", artistas);
            } else {

                loadDataSession.setAttribute("Artistas", artistas);
            }


            FileReader users = new FileReader("C:\\Users\\Usuario\\Documents\\NetBeansProjects\\POO-este-si-2.0\\UsuarioOnly\\workbooks\\Obras.txt");

            BufferedReader bf = new BufferedReader(users);
            String user = bf.readLine();
            Obra ob;
            String[] uA;
            while (user != null) {
                uA = user.split(";");
                idObras ++;
                obras.put(uA[5], new Obra(uA[0], Double.parseDouble(uA[1]), uA[2], uA[3],
                        artistas.get(uA[4]), String.valueOf(idObras)));
                user = bf.readLine();

            }
            loadDataSession.setAttribute("ObrasID", idObras+1);
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
