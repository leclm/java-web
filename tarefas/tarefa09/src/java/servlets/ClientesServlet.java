/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import exceptions.ClienteException;
import exceptions.EstadoException;
import facade.ClientesFacade;
import facade.EstadoFacade;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.InputMismatchException;
import java.util.List;
import models.Cliente;
import models.Estado;

@WebServlet(name = "ClientesServlet", urlPatterns = {"/ClientesServlet"})
public class ClientesServlet extends HttpServlet {

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
        
        String action = (String) request.getParameter("action");
        RequestDispatcher rd;
        int id;
        Date dt;
        Cliente cliente;
        List<Estado> estados;
        
        try {
            if (action == null) {
                List<Cliente> clientes;
                clientes = ClientesFacade.buscarTodos();
                request.setAttribute("clientes", clientes);
                rd = getServletContext().getRequestDispatcher("/jsp/clientesListar.jsp");
                rd.forward(request, response);
                return;
            }
            
            switch (action) {
                default:
                case "list":
                    List<Cliente> clientes = ClientesFacade.buscarTodos();
                    request.setAttribute("clientes", clientes);
                    rd = getServletContext().getRequestDispatcher("/jsp/clientesListar.jsp");
                    rd.forward(request, response);
                    break;
                case "show":
                    id = Integer.parseInt(request.getParameter("id"));
                    cliente = ClientesFacade.buscar(id);
                    request.setAttribute("cliente", cliente);
                    rd = getServletContext().getRequestDispatcher("/jsp/clientesVisualizar.jsp");
                    rd.forward(request, response);
                    break;
                case "formUpdate":
                    id = Integer.parseInt(request.getParameter("id"));
                    cliente = ClientesFacade.buscar(id);
                    estados = EstadoFacade.buscarTodos();
                    request.setAttribute("cliente", cliente);
                    request.setAttribute("estados", estados);
                    rd = getServletContext().getRequestDispatcher("/jsp/clientesForm.jsp");
                    rd.forward(request, response);
                    break;
                case "remove":
                    id = Integer.parseInt(request.getParameter("id"));
                    cliente = ClientesFacade.buscar(id);
                    ClientesFacade.remover(cliente);
                    rd = getServletContext().getRequestDispatcher("/ClientesServlet?action=list");
                    rd.forward(request, response);
                    break;
                case "update":
                    if (!validCPF(request.getParameter("cpf"))) throw new ClienteException("CPF Inválido!");
                    id = Integer.parseInt(request.getParameter("id"));
                    Cliente clienteBD = ClientesFacade.buscar(id);
                    dt = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("data"));
                    cliente = new Cliente(
                        clienteBD.getId(),
                        request.getParameter("cpf"),
                        request.getParameter("email"),
                        request.getParameter("nome"),
                        new java.sql.Date(dt.getTime()),
                        request.getParameter("rua"),
                        Integer.parseInt(request.getParameter("numero")),
                        request.getParameter("cep"),
                        Integer.parseInt(request.getParameter("cidade"))
                    );
                    ClientesFacade.alterar(cliente);
                    rd = getServletContext().getRequestDispatcher("/ClientesServlet?action=list");
                    rd.forward(request, response);
                    break;
                case "formNew":
                    estados = EstadoFacade.buscarTodos();
                    request.setAttribute("estados", estados);
                    rd = getServletContext().getRequestDispatcher("/jsp/clientesForm.jsp");
                    rd.forward(request, response);
                    break;
                case "new":
                    if (!validCPF(request.getParameter("cpf"))) throw new ClienteException("CPF Inválido!");
                    dt = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("data"));
                    cliente = new Cliente(
                        request.getParameter("cpf"),
                        request.getParameter("email"),
                        request.getParameter("nome"),
                        new java.sql.Date(dt.getTime()),
                        request.getParameter("rua"),
                        Integer.parseInt(request.getParameter("numero")),
                        request.getParameter("cep"),
                        Integer.parseInt(request.getParameter("cidade"))
                    );
                    ClientesFacade.inserir(cliente);
                    rd = getServletContext().getRequestDispatcher("/ClientesServlet?action=list");
                    rd.forward(request, response);
                    break;
            }
        } catch (ClienteException | EstadoException | ParseException e) {
            request.setAttribute("jspException", e);
            request.setAttribute("status_code", 500);
            request.setAttribute("pageName", "Clientes");
            request.setAttribute("redirect", "./ClientesServlet?action=list");
            rd = getServletContext().getRequestDispatcher("/jsp/erro.jsp");
            rd.forward(request, response);
        }
    }
    
    private boolean validCPF(String CPF) {
        if (CPF.equals("00000000000") ||
            CPF.equals("11111111111") ||
            CPF.equals("22222222222") || CPF.equals("33333333333") ||
            CPF.equals("44444444444") || CPF.equals("55555555555") ||
            CPF.equals("66666666666") || CPF.equals("77777777777") ||
            CPF.equals("88888888888") || CPF.equals("99999999999") ||
            (CPF.length() != 11))
            return(false);

        char dig10, dig11;
        int sm, i, r, num, peso;

        try {
            sm = 0;
            peso = 10;
            for (i=0; i<9; i++) {
        
            num = (int)(CPF.charAt(i) - 48);
            sm = sm + (num * peso);
            peso = peso - 1;
            }

            r = 11 - (sm % 11);
            if ((r == 10) || (r == 11))
                dig10 = '0';
            else dig10 = (char)(r + 48); 
            
            sm = 0;
            peso = 11;
            for(i=0; i<10; i++) {
            num = (int)(CPF.charAt(i) - 48);
            sm = sm + (num * peso);
            peso = peso - 1;
            }

            r = 11 - (sm % 11);
            if ((r == 10) || (r == 11))
                 dig11 = '0';
            else dig11 = (char)(r + 48);

        
            if ((dig10 == CPF.charAt(9)) && (dig11 == CPF.charAt(10)))
                 return(true);
            else return(false);
        } catch (InputMismatchException erro) {
            return(false);
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
