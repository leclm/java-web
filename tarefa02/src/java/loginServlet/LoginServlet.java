/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package loginServlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author lelim
 */
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("user_email");  
            String pw = request.getParameter("user_pw");  
            if (email.equals(pw) && !email.isEmpty() && !pw.isEmpty()) {
                out.println("<html><head>");
                out.println("<title>Sucesso no Login</title><link rel=\"stylesheet\" href=\"./style.css\"></head><body>");
                out.println("<header><h1>Login realizado com sucesso!</h1></header>");            
                out.println("<section class=\"content-cards\">");
                out.println("<div class=\"container\">");
                out.println("<div class=\"vector-card\">");
                out.println("<ul>");
                out.println("<li>");
                out.println("<p style=\"text-align: center;\">Acesse o Portal Servlet clicando no botão abaixo</p>");
                out.println("</li>"); 
                out.println("<li class=\"button\">");
                out.println("<button><a href=\"PortalServlet\">Portal Servlet</a></button>");
                out.println("</li>"); 
                out.println("</ul></div></div></section>");
                out.println("</body></html>");
            } else {
                out.println("<html><head>");
                out.println("<title>Erro no Login</title><link rel=\"stylesheet\" href=\"./style.css\"></head><body>");
                out.println("<header><h1>Usuário/Senha não encontrado!</h1></header>");             
                out.println("<section class=\"content-cards\">");
                out.println("<div class=\"container\">");
                out.println("<div class=\"vector-card\">");
                out.println("<ul>");
                out.println("<li>");
                out.println("<p style=\"text-align: center;\">Tente novamente clicando no botão abaixo</p>");
                out.println("</li>"); 
                out.println("<li class=\"button\">");
                out.println("<button><a href=\"./index.html\">Refazer login</a></button>");
                out.println("</li>"); 
                out.println("</ul></div></div></section>");
                out.println("</body></html>");
            }
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


/*
out.println("<html><head>");
out.println("<title>Teste</title><link rel=\"stylesheet\" href=\"./style.css\"></head><body>");
out.println("<header><h1>É diferente</h1></header>");            
out.println("<section class=\"content-cards\">");
out.println("<div class=\"container\">");
out.println("<div class=\"vector-card\">");
out.println("<ul>");
out.println("<li>");
out.println("<label for=\"mail\">E-mail:</label><input type=\"email\" id=\"mail\" name=\"user_email\" placeholder=\"example@example.com\">");
out.println("</li>");        
out.println("<li>");
out.println("<label for=\"senha\">Senha:</label><input id=\"senha\" type=\"password\" name=\"user_senha\" placeholder=\"digite sua senha\">");
out.println("</li>");  
out.println("<li class=\"button\">");
out.println("<button type=\"submit\" value=\"Entrar\">Entrar</button>");
out.println("</li>");  
out.println("</ul></div></div></section></form>");
out.println("</body></html>");
*/