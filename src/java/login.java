/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.*; //jdbc.Connection;
import java.sql.PreparedStatement;//com.mysql.jdbc.PreparedStatement;
import java.sql.ResultSet; //com.mysql.jdbc.ResultSet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author ParthBheda
 */
public class login extends HttpServlet {

    private static final long serialVersionUID=1L;
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
            out.println("<title>Servlet login</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet login at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://192.168.1.10:3306/test_medpal","root","Admin@123");
            PreparedStatement ps = connection.prepareStatement("select * from users where uid = ? and pass =?");
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                //out.println("Login successful");
                response.sendRedirect("Services.html");
            }
            else{
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Incorrect username or password please check!');");
                out.println("location='index.html';");
                out.println("</script>");
// out.println("<script type=\"text/javascript\">");
//   out.println("alert('User or password incorrect');");
//   out.println("location='index.jsp';");
//   out.println("</script>");                

            }
        }
        catch(ClassNotFoundException | SQLException e)
        {
            e.printStackTrace(out);            
        }
        //processRequest(request, response);
    }
//protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.setContentType("text/html");
//        PrintWriter out = response.getWriter();
//        String user = request.getParameter("user");
//        String pass = request.getParameter("pass");
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javademo", "root", "");
//            PreparedStatement pst = conn.prepareStatement("Select user,pass from login where user=? and pass=?");
//            pst.setString(1, user);
//            pst.setString(2, pass);
//            ResultSet rs = pst.executeQuery();
//            if (rs.next()) {
//                out.println("Correct login credentials");
//            } 
//            else {
//                out.println("Incorrect login credentials");
//            }
//        } 
//        catch (ClassNotFoundException | SQLException e) {
//            e.printStackTrace();
//        }
//    }
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
