/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import model.bean.Usuario;
import connection.ConnectionFactory;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

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
        
        ArrayList<Usuario> listaUsuarios = new ArrayList<Usuario>();

        String sql = "SELECT * FROM tb_usuario";

        //abre conexão com o BD
        Connection con = ConnectionFactory.getConnection();
        System.out.println("conectou");
        
        try {
            Statement st = con.createStatement();
            st.executeQuery(sql);
            ResultSet rs = st.getResultSet();            
            while (rs.next()){
              Usuario user = new Usuario();
              user.setEmail(rs.getString("login_usuario"));
              user.setPw(rs.getString("senha_usuario"));
              user.setName(rs.getString("nome_usuario"));
              listaUsuarios.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
                
        HttpSession lista = request.getSession();
        Usuario userSession = (Usuario)lista.getAttribute("usuario");
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            if (userSession.getName() == null) {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/ErroServlet");
            
                request.setAttribute("msg", "Usuário não está logado.");

                request.setAttribute("page", "index.html");
                rd.forward(request, response);
            } else {
                out.println("<!DOCTYPE html>");
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
