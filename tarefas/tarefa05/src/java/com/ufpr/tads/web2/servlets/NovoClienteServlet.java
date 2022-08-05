package com.ufpr.tads.web2.servlets;

import com.ufpr.tads.web2.beans.Cliente;
import com.ufpr.tads.web2.beans.LoginBean;
import com.ufpr.tads.web2.dao.ClienteDAO;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author lelim
 */
@WebServlet(name = "NovoClienteServlet", urlPatterns = { "/NovoClienteServlet" })
public class NovoClienteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();

        LoginBean loginBeanSession = (LoginBean)session.getAttribute("loginBean");
        
        if (loginBeanSession.getNome() == null) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
            request.setAttribute("msg", "Usuário deve se autenticar para acessar o sistema");  
            rd.forward(request, response);
          
        } else {
            Cliente cliente = new Cliente();
            ClienteDAO clienteDAO = new ClienteDAO();
   
            cliente.setCpf(request.getParameter("CPF"));
            cliente.setNome(request.getParameter("Nome"));
            cliente.setEmail(request.getParameter("Email"));
            cliente.setData(request.getParameter("Data"));
            cliente.setRua(request.getParameter("Rua"));
            cliente.setNr(Integer.parseInt(request.getParameter("Numero")));
            cliente.setCep(request.getParameter("CEP"));
            cliente.setCidade(request.getParameter("Cidade"));
            cliente.setUf(request.getParameter("UF"));

            clienteDAO.insert(cliente);

            RequestDispatcher rd = getServletContext().getRequestDispatcher("/ClientesServlet");
            rd.forward(request, response);
        }
    }
}
