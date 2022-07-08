/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package tarefa;

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
@WebServlet(name = "Tarefa01", urlPatterns = {"/Tarefa01"})
public class Tarefa01 extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>SEPT</title>"); 
            out.println("<link rel='stylesheet' type='text/css' href='" + request.getContextPath() +  "/style.css'>"); 
            out.println("</head>");
            
            out.println("<body>");
            out.println("<h1 style='color: blue; font-family: Verdana;'>SEPT - Setor de Educação Profissional e Tecnológica</h1>");
            out.println("<p>Rua Dr. Alcides Vieira Arcoverde, 1225 - CEP: 81520-260<br> Jardim das Américas - Curitiba (PR) - Brasil</p>");
            out.println("<table>");
            out.println("<tbody>");
          
            out.println("<th>");
            out.println("Curso");
            out.println("</th>");
            
            out.println("<th>");
            out.println("Página");
            out.println("</th>");
            
            out.println("<tr>");
            out.println("<td>");
            out.println("TPG - Técnico em Petróleo e Gás");
            out.println("</td>");
            out.println("<td>");
            out.println("<a href='http://www.sept.ufpr.br/portal/petroleogas/'>http://www.sept.ufpr.br/portal/petroleogas/</a>");
            out.println("</td>");
            out.println("</tr>");
            
            out.println("<tr>");
            out.println("<td>");
            out.println("TACS - Técnico em Agente Comunitário de Saúde");
            out.println("</td>");
            out.println("<td>");
            out.println("<a href='http://www.sept.ufpr.br/portal/agentesaude/'>http://www.sept.ufpr.br/portal/agentesaude/</a>");
            out.println("</td>");
            out.println("</tr>");
            
            out.println("<tr>");
            out.println("<td>");
            out.println("TADS - Tecnologia em Análise e Desenvolvimento de Sistemas");
            out.println("</td>");
            out.println("<td>");
            out.println("<a href='http://www.sept.ufpr.br/portal/analisesistemas/'>http://www.sept.ufpr.br/portal/analisesistemas/</a>");
            out.println("</td>");
            out.println("</tr>");
            
            out.println("<tr>");
            out.println("<td>");
            out.println("TCI - Tecnologia em Comunicação Institucional");
            out.println("</td>");
            out.println("<td>");
            out.println("<a href='http://www.sept.ufpr.br/portal/comunicacaoinstitucional/'>http://www.sept.ufpr.br/portal/comunicacaoinstitucional/</a>");
            out.println("</td>");
            out.println("</tr>");
            
            out.println("<tr>");
            out.println("<td>");
            out.println("TGP - Tecnologia em Gestão da Qualidade");
            out.println("</td>");
            out.println("<td>");
            out.println("<a href='http://www.sept.ufpr.br/portal/gestaoqualidade/'>http://www.sept.ufpr.br/portal/gestaoqualidade/</a>");
            out.println("</td>");
            out.println("</tr>");
            
            out.println("<tr>");
            out.println("<td>");
            out.println("TGQ - Tecnologia em Gestão Pública");
            out.println("</td>");
            out.println("<td>");
            out.println("<a href='http://www.sept.ufpr.br/portal/gestaopublica/'>http://www.sept.ufpr.br/portal/gestaopublica/</a>");
            out.println("</td>");
            out.println("</tr>");
            
            out.println("<tr>");
            out.println("<td>");
            out.println("TL - Tecnologia em Luteria");
            out.println("</td>");
            out.println("<td>");
            out.println("<a href='http://www.sept.ufpr.br/portal/luteria/'>http://www.sept.ufpr.br/portal/luteria/</a>");
            out.println("</td>");
            out.println("</tr>");
            
            out.println("<tr>");
            out.println("<td>");
            out.println("TNI - Tecnologia em Negócios Imobiliários");
            out.println("</td>");
            out.println("<td>");
            out.println("<a href='http://www.sept.ufpr.br/portal/negociosimobiliarios/'>http://www.sept.ufpr.br/portal/negociosimobiliarios/</a>");
            out.println("</td>");
            out.println("</tr>");
            
            out.println("<tr>");
            out.println("<td>");
            out.println("TPC - Tecnologia em Produção Cênica");
            out.println("</td>");
            out.println("<td>");
            out.println("<a href='http://www.sept.ufpr.br/portal/producaocenica/'>http://www.sept.ufpr.br/portal/producaocenica/</a>");
            out.println("</td>");
            out.println("</tr>");
            
            out.println("<tr>");
            out.println("<td>");
            out.println("TS - Tecnólogo em Secretariado");
            out.println("</td>");
            out.println("<td>");
            out.println("<a href='http://www.sept.ufpr.br/portal/secretariado/'>http://www.sept.ufpr.br/portal/secretariado/</a>");
            out.println("</td>");
            out.println("</tr>");
            
            out.println("<tr>");
            out.println("<td>");
            out.println("MBA - Mercado Imobiliário");
            out.println("</td>");
            out.println("<td>");
            out.println("<a href='http://www.sept.ufpr.br/portal/mbani/'>http://www.sept.ufpr.br/portal/mbani/</a>");
            out.println("</td>");
            out.println("</tr>");
            
            out.println("<tr>");
            out.println("<td>");
            out.println("Especialização em Desenvolvimento Ágil de Software");
            out.println("</td>");
            out.println("<td>");
            out.println("<a href='https://das.ufpr.br/'>https://das.ufpr.br/</a>");
            out.println("</td>");
            out.println("</tr>");
            
            out.println("<tr>");
            out.println("<td>");
            out.println("Especialização em Inteligência Artificial Aplicada");
            out.println("</td>");
            out.println("<td>");
            out.println("<a href='http://www.iaa.ufpr.br/'>http://www.iaa.ufpr.br/</a>");
            out.println("</td>");
            out.println("</tr>");
            
            out.println("<tr>");
            out.println("<td>");
            out.println("Pós-Graduação em Bioinformática");
            out.println("</td>");
            out.println("<td>");
            out.println("<a href='http://www.bioinfo.ufpr.br/'>http://www.bioinfo.ufpr.br/</a>");
            out.println("</td>");
            out.println("</tr>");
            
            out.println("</tbody>");
            out.println("</table>");
            
            /* Link para página JSP */
            out.println("<div>");
            out.println("<a href='.." + request.getContextPath() +  "/meutads.jsp'>Meu TADS</a>");
            out.println("</div>");
            
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
