/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ParthBheda
 */
public class VerifyOtp extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VerifyOtp</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifyOtp at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html");
        try{
            PrintWriter out = response.getWriter();
            String oriotp="";
            String otp=request.getParameter("Otpno");
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://192.168.1.10/test_medpal","root","Admin@123");
            String getdata="SELECT otp, contactno FROM users WHERE otpverify = 'N' ORDER BY id DESC LIMIT 1";
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(getdata);
            while(rs.next()){
                oriotp=rs.getString("otp");
            }
            if(oriotp.equals(otp)){
                PreparedStatement preparedStatement = connection.prepareStatement("Update users set otpverify ='Y' where otpverify='N' and otp =?");
                preparedStatement.setString(1, otp);
                preparedStatement.executeUpdate();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Number Verification Done Successful');");
                out.println("location='index.html'");
                out.println("</script>");
            }
            else
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('OTP Verification Failed please try again');");
                out.println("location='VerifyOtp.html'");
                out.println("</script>");
            }
        }
        catch(Exception ex){
            PrintWriter out=response.getWriter();
            ex.printStackTrace(out);
        }
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
