/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
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
public class ResendOtp extends HttpServlet {

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
            out.println("<title>Servlet ResendOtp</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ResendOtp at " + request.getContextPath() + "</h1>");
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
            String otp ="";
            String cno = "";
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://192.168.1.10:3306/test_medpal","root","Admin@123");
            String getotp = "select otp,ContactNo from users where actiondate = current_date() and otpverify = 'N' order by id desc limit 1";
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(getotp);
            while(rs.next()){
                otp=rs.getString("otp");
                cno=rs.getString("ContactNo");
            }
            //Textlocal sms data
            String user = "username="+URLEncoder.encode("parthbheda.pb@gmail.com", "UTF-8");
            String hash = "&hash="+ URLEncoder.encode("0a2a1420b38bc4b75bdfeba4403f0656295a9b78", "UTF-8");
            String message = "&message=" + URLEncoder.encode("This is your one-time password "+otp+". Thank you, From Medstream Technologies.","UTF-8");
            String sender = "&sender=" + URLEncoder.encode("MDSTHD", "UTF-8");
            String numbers = "&numbers=" + URLEncoder.encode(cno, "UTF-8");
            
            //Send Sms
            String data = "https://api.textlocal.in/send/?" + user + hash + numbers + message + sender;
            URL url = new URL(data);
            URLConnection conn = url.openConnection();
            conn.setDoOutput(true);
            
            //get Response
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            String sresult = "";
            while ((line=reader.readLine()) != null){
                //process line
                sresult=sresult+line+" ";
            }
            reader.close();
//            return sresult;
            out.println("<script type=\"text/javascript\">");
            out.println("alert('OTP Sent please check your registered mobile number')");
            out.println("location='VerifyOtp.html';");
            out.println("</script>");
        }
           catch (Exception ex){
            PrintWriter pw = response.getWriter();
            ex.printStackTrace(pw);
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
