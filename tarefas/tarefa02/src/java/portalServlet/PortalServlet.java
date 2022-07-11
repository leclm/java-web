/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package portalServlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import usuario.Usuario;

/**
 *
 * @author lelim
 */
@WebServlet(name = "PortalServlet", urlPatterns = {"/PortalServlet"})
public class PortalServlet extends HttpServlet {

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
        
        HttpSession lista = request.getSession();
        ArrayList<Usuario> listaUsuarios = (ArrayList<Usuario>)lista.getAttribute("lista");

        if (listaUsuarios == null) {
            listaUsuarios = new ArrayList<>();
            listaUsuarios.add(new Usuario("123","123","123"));
            listaUsuarios.add(new Usuario("root","root","root"));
        }
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<html><head>");
            out.println("<title>Portal Servlet</title><link rel=\"stylesheet\" href=\"./style.css\"></head><body>");
            out.println("<header><h1>Cadastro</h1></header>"); 
            out.println("<form action=\"CadastrarUsuarioServlet\" method=\"POST\">");            
            out.println("<section class=\"content-cards\">");
            out.println("<div class=\"container\">");
            out.println("<div class=\"vector-card\">");
            out.println("<ul>");
            out.println("<li>");
            out.println("<label for=\"name\">Nome:</label>");
            out.println("<input type=\"text\" id=\"name\" name=\"user_name\" placeholder=\"nome completo\">");
            out.println("</li>");
            out.println("<li>");
            out.println("<label for=\"mail\">Login:</label>");
            out.println("<input type=\"text\" id=\"mail\" name=\"user_email\" placeholder=\"example@example.com\">");
            out.println("</li>");        
            out.println("<li>");
            out.println("<label for=\"senha\">Senha:</label>");
            out.println("<input id=\"senha\" type=\"password\" name=\"user_pw\" placeholder=\"digite sua senha\">");
            out.println("</li>");  
            out.println("<li class=\"button\">");
            out.println("<button type=\"submit\" value=\"Salvar\">Salvar</button>");
            out.println("</li>");  
            out.println("</ul></div></div></section></form>");
            
            out.println("<div class=\"content-cards users-table\"><table border='1'><tr><th>Nome</th><th>Login</th><th>Senha</th></tr>");            
            for(Usuario user : listaUsuarios){
                out.println("<tr>");
                out.println("<td>");
                out.println(user.getName());
                out.println("</td>");

                out.println("<td>");
                out.println(user.getEmail());
                out.println("</td>");

                out.println("<td>");
                out.println(user.getPw());
                out.println("</td>");
                out.println("</tr>");                
            }                        
            out.println("</table></div>");
            
            lista.setAttribute("lista", listaUsuarios);
            out.println("<div class=\"users-btn\"><button><a href=\"LogoutServlet\">Logout</a></button></div>");
            
            out.println("</body></html>");
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
