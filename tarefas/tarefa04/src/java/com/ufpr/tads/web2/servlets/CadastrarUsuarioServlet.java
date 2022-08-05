/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ufpr.tads.web2.servlets;

import com.ufpr.tads.web2.beans.LoginBean;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.ufpr.tads.web2.dao.UsuarioDAO;
import com.ufpr.tads.web2.beans.Usuario;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author lelim
 */
@WebServlet(name = "CadastrarUsuarioServlet", urlPatterns = {"/CadastrarUsuarioServlet"})
public class CadastrarUsuarioServlet extends HttpServlet {

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
            out.println("<title>Servlet sa</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sa at " + request.getContextPath() + "</h1>");
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
        HttpSession session = (HttpSession) request.getSession();

        LoginBean loginBeanSession = (LoginBean)session.getAttribute("loginBean");

        if (loginBeanSession.getUserName() == null) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/erro.jsp");            
            rd.forward(request, response);
            
            request.setAttribute("msg", "pagina cadastrarUsuarioServlet.java: Usuário não está logado");  
            request.setAttribute("page", "index.html");
        } else {
            Usuario objUsuario = new Usuario();
            UsuarioDAO userDAO = new UsuarioDAO();

            objUsuario.setName(request.getParameter("name"));
            objUsuario.setEmail(request.getParameter("email"));
            objUsuario.setPw(request.getParameter("pw"));

            userDAO.save(objUsuario);
            
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
           
            out.println("<!DOCTYPE html>");
            out.println("<html><head>");
            out.println("<title>Cadastrar Usuário</title><link rel=\"stylesheet\" href=\"./style.css\"></head><body>");
            out.println("<header><h1>Usuario '" + objUsuario.getName() + "' foi cadastrado com sucesso!</h1></header>");      
            out.println("<section class=\"content-cards\">");
            out.println("<div class=\"container\">");
            out.println("<div class=\"vector-card\">");
            out.println("<ul>");
            out.println("<li>");
            out.println("Nome: " + objUsuario.getName());
            out.println("</li>"); 
            out.println("<li>");
            out.println("E-mail: " + objUsuario.getEmail());
            out.println("</li>"); 
            out.println("<li>");
            out.println("Senha: " + objUsuario.getPw());
            out.println("</li>"); 
            out.println("<li class=\"button\">");
            out.println("<button><a href='./portal.jsp'>Portal Servlet</a></button>");
            out.println("</li>"); 
            out.println("</ul></div></div></section>");
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
