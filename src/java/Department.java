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
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ParthBheda
 */
public class Department extends HttpServlet {

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
            out.println("<title>Servlet Department</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Department at " + request.getContextPath() + "</h1>");
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
        if(request.getParameter("save") !=null)
        {
        try{
            String deptname = request.getParameter("deptname");
            String deptcode = request.getParameter("deptcode");
            String depcat = request.getParameter("deptcat");
            {
                PrintWriter out = response.getWriter();
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection=DriverManager.getConnection("jdbc:mysql://192.168.1.10/test_medpal","root","Admin@123");
                PreparedStatement ptst = connection.prepareStatement("Select * from department where DeptName='"+deptname+"' and ActiveStatus='Y'");
                ResultSet rs = ptst.executeQuery();
                if(rs.next()){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Department with "+deptname+" already exist with an active status please select some other name!');");
                    out.println("location='deptreg.jsp';");
                    out.println("</script>");
                }
                else
                {
                    try (PreparedStatement ps = connection.prepareStatement("insert into department (DeptCode,DeptName,DeptCategory,ActionDate,DocumentDate) values (?,?,?,now(),now())")) {
                        ps.setString(1, deptcode);
                        ps.setString(2, deptname);
                        ps.setString(3, depcat);
                        ps.executeUpdate();
                    }
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Department "+deptname+" Saved!');");
                out.println("location='deptreg.jsp';");
                out.println("</script>");
                }
            }
        }
        catch(IOException | ClassNotFoundException | SQLException ex){
            PrintWriter out = response.getWriter();
            ex.printStackTrace(out);
        }
        }
        else if(request.getParameter("deptv")!=null){
                PrintWriter out = response.getWriter();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Coming Soon!');");
                out.println("location='deptreg.jsp';");
                out.println("</script>");
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
