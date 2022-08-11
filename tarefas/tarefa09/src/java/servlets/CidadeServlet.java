/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import com.google.gson.Gson;
import database.DAOException;
import exceptions.CidadeException;
import facade.CidadeFacade;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Cidade;


@WebServlet(name = "CidadeServlet", urlPatterns = {"/CidadeServlet"})
public class CidadeServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws database.DAOException
     * @throws java.sql.SQLException
     * @throws exceptions.CidadeException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Cidade> cidades = new ArrayList<>();
            if (request.getParameter("estadoId") != null) {
                int estado = Integer.parseInt(request.getParameter("estadoId"));
                cidades = CidadeFacade.buscarPorEstado(estado);
            } else {
                int cidade = Integer.parseInt(request.getParameter("cidadeId"));
                Cidade cidadeDB = CidadeFacade.buscar(cidade);
                cidades.add(cidadeDB);
            }

            String json = new Gson().toJson(cidades);   

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json); 
        } catch (CidadeException e) {
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
