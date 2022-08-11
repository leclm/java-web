/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import database.ConnectionFactory;
import database.DAOException;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.OutputStream;
import java.net.URL;
import java.util.HashMap;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;


@WebServlet(name = "GeradorRelatorioServlet", urlPatterns = {"/GeradorRelatorioServlet"})
public class GeradorRelatorioServlet extends HttpServlet {

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
        String report = (String) request.getParameter("report");
        try (ConnectionFactory factory = new ConnectionFactory()) {
            String host = "http://" + request.getServerName() + ":" + request.getServerPort();
            String jasper= request.getContextPath() + "/" + report + ".jasper";
            URL jasperURL= new URL(host + jasper);
            HashMap params = new HashMap();
            byte[] bytes = JasperRunManager.runReportToPdf(jasperURL.openStream(), params,factory.getConnection());
            if (bytes != null) {
                response.setContentType("application/pdf");
                OutputStream ops = response.getOutputStream();  ops.write(bytes);
            }
        } catch (DAOException e) {
            request.setAttribute("mensagem", "Erro de DAO : "+ e.getMessage());
            request.getRequestDispatcher("/jsp/erro.jsp").forward(request, response);
        } catch (JRException e) {
            request.setAttribute("mensagem", "Erro no Jasper: "+ e.getMessage());
            request.getRequestDispatcher("/jsp/erro.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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
