/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import beans.LoginBean;
import database.ConnectionFactory;
import exceptions.LoginException;
import facade.LoginFacade;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Usuario;


@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter(); ConnectionFactory factory = new ConnectionFactory();) {
            String login = request.getParameter("login");
            String password = request.getParameter("senha");
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Login feito</title>");            
            out.println("</head>");
            out.println("<body>");
            
            if (LoginFacade.validLogin(login, password, factory)) {
                HttpSession session = request.getSession();
                Usuario user = LoginFacade.getUserByLogin(login, factory);
                LoginBean loginBean = new LoginBean(user.getId(), user.getName());
                session.setAttribute("loginBean", loginBean);
                response.sendRedirect("./jsp/portal.jsp");
            } else {
                request.setAttribute("msg", "Usuário/Senha inválidos.");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
                rd.forward(request, response);
                return;
            }
            
            out.println("</body>");
            out.println("</html>");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("jspException", e);
            request.setAttribute("status_code", 500);
            request.setAttribute("pageName", "Clientes");
            request.setAttribute("redirect", "./ClientesServlet?action=list");
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/jsp/erro.jsp");
            rd.forward(request, response);
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
        processRequest(request, response);
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
