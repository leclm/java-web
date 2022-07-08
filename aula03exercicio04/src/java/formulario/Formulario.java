/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package formulario;

import jakarta.mail.internet.ParseException;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lelim
 */
@WebServlet(name = "Formulario", urlPatterns = {"/Formulario"})
public class Formulario extends HttpServlet {

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
            out.println("<title>Servlet Formulario</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Formulario at " + request.getContextPath() + "</h1>");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String usuario = request.getParameter("user_name");
        
        String num = request.getParameter("user_age");
        int age = Integer.parseInt(num); 
        
        String dt = request.getParameter("user_bday");
        Date user_bday = null;
        SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
        try {
            user_bday = format.parse(dt);
        } catch(Exception e) {
            System.out.println("Error occurred "+ e.getMessage());
        }
        
        String email = request.getParameter("user_email");        
        String pretty = request.getParameter("is_pretty");
        String tall = request.getParameter("is_tall");
        String funny = request.getParameter("is_funny");
        String gender = request.getParameter("gender");
        String msg = request.getParameter("user_message");
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<html><head>");
            out.println("<title>Teste</title></head><body>");
            out.println("<h1>Form data</h1>");
            out.println("User: " + usuario + "<br/>");
            out.println("Age: " + age + "<br/>");
            out.println("Birthday: " + user_bday + "<br/>");
            out.println("Email: " + email + "<br/>");
            out.println("Pretty: " + pretty + "<br/>");
            out.println("Tall: " + tall + "<br/>");
            out.println("Funny: " + funny + "<br/>");
            out.println("Gender: " + gender + "<br/>");
            out.println("Message: " + msg + "<br/>");
            out.println("</body></html>");
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
