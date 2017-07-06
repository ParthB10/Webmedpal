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
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ParthBheda
 */
public class Doctor extends HttpServlet {

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
            out.println("<title>Servlet Doctor</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Doctor at " + request.getContextPath() + "</h1>");
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
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://192.168.1.10/test_medpal","root","Admin@123");
            if(request.getParameter("save")!=null){
                String deptid=request.getParameter("DoctorDepartment");
                String dcode = request.getParameter("docCode");
                String dname = request.getParameter("docname");
                String dadd = request.getParameter("docadd");
                String cno = request.getParameter("docc");
                String email = request.getParameter("docemail");
                String djoin = request.getParameter("doj");
                if(deptid.equals("-1")){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Please select appropriate department!');");
                    out.println("location='doctorreg.jsp';");
                    out.println("</script>");
                }
                else if((cno.equals(""))){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Provide Valid Contact Number!');");
                    out.println("location='doctorreg.jsp';");
                    out.println("</script>");
                }
                else if((dname.equals(""))){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Provide Valid Doctor Name!');");
                    out.println("location='doctorreg.jsp';");
                    out.println("</script>");
                }                
                else if((dcode.equals(""))){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Provide Valid Doctor Code!');");
                    out.println("location='doctorreg.jsp';");
                    out.println("</script>");
                }
                else{
                    PreparedStatement sptst = connection.prepareStatement("select * from doctors where doctorsname = '"+dname+"'");
                    ResultSet rs = sptst.executeQuery();
                    if(rs.next()){
                        out.println("<script type=\"text/javascript\">");
                    out.println("alert('Doctor with "+dname+" already exist with an active status please select some other name!');");
                    out.println("location='doctorreg.jsp';");
                    out.println("</script>");
                    }
                    else
                    {
                PreparedStatement ptst = connection.prepareStatement("insert into doctors (DoctorDeptID,DoctorCode,DoctorsName,Address,ContactNo,Email,Dateofjoin,Actiondate,DocumentDate) values (?,?,?,?,?,?,?,now(),now())");
                ptst.setString(1, deptid);
                ptst.setString(2, dcode);
                ptst.setString(3, dname);
                ptst.setString(4, dadd);
                ptst.setString(5, cno);
                ptst.setString(6, email);
                ptst.setString(7, djoin);
                ptst.executeUpdate();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Doctor "+dname+" Saved!');");
                out.println("location='doctorreg.jsp';");
                out.println("</script>");
                }
                }
        }
            else if(request.getParameter("docv")!=null){
                response.sendRedirect("doctorv.jsp");
            }
            else if(request.getParameter("btndeactive")!= null) {
                String docname = request.getParameter("dname");
                PreparedStatement ptst = connection.prepareStatement("update doctors set ActiveStatus = 'N' where DoctorsName = '"+docname+"'");
                ptst.executeUpdate();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Doctor with "+docname+" deactivated!');");
                out.println("location='doctorv.jsp';");
                out.println("</script>");
            }
            else if(request.getParameter("update")!=null){
                String deptid=request.getParameter("docdept");
                String dcode = request.getParameter("dCode");
                String dname = request.getParameter("dname");
                String dadd = request.getParameter("dadd");
                String cno = request.getParameter("dcno");
                String email = request.getParameter("demail");
                String djoin = request.getParameter("ddoj");
                String id = request.getParameter("did");
                PreparedStatement ptst = connection.prepareStatement("update Doctors set DoctorDeptID='"+deptid+"',DoctorCode='"+dcode+"',DoctorsName='"+dname+"',Address='"+dadd+"',ContactNo='"+cno+"',Email='"+email+"',Dateofjoin='"+djoin+"',Actiondate=now(),ActiveStatus='Y' where DoctorID='"+id+"'");
                ptst.executeUpdate();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Doctor Information Updated Successfully!');");
                out.println("location='doctorv.jsp';");
                out.println("</script>");
            }
        }
        catch (IOException | ClassNotFoundException | SQLException ex){
            out.println("<script type=\"text/javascript\">");
            out.println("alert('"+Arrays.toString(ex.getStackTrace())+"');");
            out.println("location='doctorreg.jsp';");
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
