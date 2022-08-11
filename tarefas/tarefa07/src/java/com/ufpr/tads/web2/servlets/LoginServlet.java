package com.ufpr.tads.web2.servlets;
import com.ufpr.tads.web2.beans.LoginBean;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.ufpr.tads.web2.beans.Usuario;
import com.ufpr.tads.web2.dao.UsuarioDAO;

@WebServlet(name = "LoginServlet", urlPatterns ={ "/LoginServlet"})
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Usuario user = new Usuario();
        UsuarioDAO userDAO = new UsuarioDAO();
        LoginBean loginBean = new LoginBean();
         
        user.setLogin_usuario(request.getParameter("login"));
        user.setSenha_usuario(request.getParameter("senha"));
        
        user = userDAO.selectUser(user);
        
        HttpSession session = request.getSession();
        
        if (user.getNome_usuario() != null){
            loginBean.setIdUsuario(user.getId_usuario());
            loginBean.setNomeUsuario(user.getNome_usuario());            
            
            session.setAttribute("loginBean", loginBean);
            
            response.setContentType("text/html;charset=UTF-8");
            
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal.jsp");
            rd.include(request, response);
        }
        else {                        
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");            
            request.setAttribute("msg", "Usuário/Senha inválidos");  
            request.setAttribute("page", "index.jsp");
            response.setContentType("text/html;charset=UTF-8");
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
    //@Override
    //protected void doGet(HttpServletRequest request, HttpServletResponse response)
            //throws ServletException, IOException {
        //processRequest(request, response);
    //}

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    //@Override
    //protected void doPost(HttpServletRequest request, HttpServletResponse response)
            //throws ServletException, IOException {
        //processRequest(request, response);
    //}

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
