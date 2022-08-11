package com.ufpr.tads.web2.servlets;
import com.ufpr.tads.web2.beans.LoginBean;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "FormNovoClienteServlet", urlPatterns = { "/FormNovoClienteServlet" })
public class FormNovoClienteServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            
        HttpSession session = request.getSession();

        LoginBean loginBeanSession = (LoginBean)session.getAttribute("loginBean");
        
        if (loginBeanSession.getNomeUsuario() == null) {
          RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");

          request.setAttribute("msg", "Usuário deve se autenticar para acessar o sistema");  
          rd.forward(request, response);
          
        }else{
          
          RequestDispatcher rd = getServletContext().getRequestDispatcher("/clientesNovo.jsp"); 
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
