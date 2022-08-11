/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import beans.LoginBean;
import database.DAOException;
import exceptions.AtendimentoException;
import exceptions.ClienteException;
import exceptions.ProdutoException;
import exceptions.TipoAtendimentoException;
import exceptions.UsuarioException;
import facade.AtendimentoFacade;
import facade.ClientesFacade;
import facade.ProdutoFacade;
import facade.TipoAtendimentoFacade;
import facade.UsuarioFacade;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Atendimento;
import models.Cliente;
import models.Produto;
import models.TipoAtendimento;
import models.Usuario;


@WebServlet(name = "AtendimentosServlet", urlPatterns = {"/AtendimentosServlet"})
public class AtendimentosServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws database.DAOException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        if (session.getAttribute("loginBean") == null) {
            request.setAttribute("msg", "Usuário deve se autenticar para acessar o sistema.");
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
            rd.forward(request, response);
            return;
        }

        int userId = ((LoginBean) session.getAttribute("loginBean")).getId();
        String action = (String) request.getParameter("action");
        RequestDispatcher rd;
        int id;
        Atendimento atendimento;
        
        try {
            if (action == null) {
                List<Atendimento> atendimentos = AtendimentoFacade.buscarTodos(userId);
                request.setAttribute("atendimentos", atendimentos);
                rd = getServletContext().getRequestDispatcher("/jsp/atendimentoListar.jsp");
                rd.forward(request, response);
                return;
            }
            
            switch (action) {
                default:
                case "list":
                    List<Atendimento> atendimentos = AtendimentoFacade.buscarTodos(userId);
                    request.setAttribute("atendimentos", atendimentos);
                    rd = getServletContext().getRequestDispatcher("/jsp/atendimentoListar.jsp");
                    rd.forward(request, response);
                    break;
                case "show":
                    id = Integer.parseInt(request.getParameter("id"));
                    atendimento = AtendimentoFacade.buscar(id);
                    request.setAttribute("atendimento", atendimento);
                    rd = getServletContext().getRequestDispatcher("/jsp/atendimentoDetalhes.jsp");
                    rd.forward(request, response);
                    break;
                case "formNew":
                    List<Cliente> clientes = ClientesFacade.buscarTodos();
                    List<Produto> produtos = ProdutoFacade.buscarTodos();
                    List<TipoAtendimento> tipoAtendimentos = TipoAtendimentoFacade.buscarTodos();
                    request.setAttribute("clientes", clientes);
                    request.setAttribute("produtos", produtos);
                    request.setAttribute("tipoAtendimentos", tipoAtendimentos);
                    request.setAttribute("userId", userId);
                    request.setAttribute("defaultDate", LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")));
                    request.setAttribute("defaultTime", LocalDateTime.now().getHour() + ":" + (LocalDateTime.now().getMinute() < 10 ? "0" : "") + LocalDateTime.now().getMinute());
                    rd = getServletContext().getRequestDispatcher("/jsp/atendimento.jsp");
                    rd.forward(request, response);
                    break;
                case "new":
                    Produto produto = ProdutoFacade.buscar(Integer.parseInt(request.getParameter("produto")));
                    TipoAtendimento tipoAtendimento = TipoAtendimentoFacade.buscar(Integer.parseInt(request.getParameter("tipoAtendimento")));
                    Usuario usuario = UsuarioFacade.buscar(Integer.parseInt(request.getParameter("usuario")));
                    Cliente cliente = ClientesFacade.buscar(Integer.parseInt(request.getParameter("cliente")));
                    
                    LocalDate datePart = LocalDate.parse(request.getParameter("dataAtendimento"), DateTimeFormatter.ofPattern("dd/MM/yyyy"));
                    LocalTime timePart = LocalTime.parse(request.getParameter("horaAtendimento"), DateTimeFormatter.ofPattern("HH:mm"));
                    LocalDateTime dateTime = LocalDateTime.of(datePart, timePart);
                    
                    atendimento = new Atendimento(
                        produto,
                        tipoAtendimento,
                        usuario,
                        cliente,
                        request.getParameter("dscAtendimento"),
                        request.getParameter("resAtendimento") == null ? 'N' : 'S',
                        dateTime
                    );
                    AtendimentoFacade.inserir(atendimento);
                    rd = getServletContext().getRequestDispatcher("/AtendimentosServlet?action=list");
                    rd.forward(request, response);
                    break;
            }
        } catch (AtendimentoException | ClienteException | TipoAtendimentoException | UsuarioException | ProdutoException e) {
            e.printStackTrace();
            request.setAttribute("jspException", e);
            request.setAttribute("status_code", 500);
            request.setAttribute("pageName", "Atendimentos");
            request.setAttribute("redirect", "./AtendimentosServlet?action=list");
            rd = getServletContext().getRequestDispatcher("/jsp/erro.jsp");
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
