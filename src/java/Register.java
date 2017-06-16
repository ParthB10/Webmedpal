/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.BufferedReader;
import java.sql.PreparedStatement;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.security.Key;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sun.misc.BASE64Encoder;

/**
 *
 * @author ParthBheda
 */
public class Register extends HttpServlet {

    private static final long serialVersionUID=1L;

    public String sendSms(){
        try{
            //gather data
            String otp="";
            String cno="";
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://192.168.1.10:3306/test_medpal","root","Admin@123");//("jdbc:mysql://192.168.1.10:3306/test_medpal","root","Admin@123")
            String getdata="SELECT otp, contactno FROM users WHERE otpverify = 'N' ORDER BY id DESC LIMIT 1";
            Statement ps = c.createStatement();
            ResultSet rs = ps.executeQuery(getdata);
            while(rs.next()){
                otp=rs.getString("otp");
                cno=rs.getString("contactno");
            }
            //Textlocal Data
            String user = "username="+ URLEncoder.encode("parthbheda.pb@gmail.com","UTF-8");
            String hash="&hash="+ URLEncoder.encode("0a2a1420b38bc4b75bdfeba4403f0656295a9b78", "UTF-8");
            String message = "&message=" + URLEncoder.encode("This is your one-time password "+otp+". Thank you, From Medstream Technologies.","UTF-8");
            String sender = "&sender=" + URLEncoder.encode("MDSTHD", "UTF-8");
            String numbers = "&numbers=" + URLEncoder.encode(cno, "UTF-8");
            
            //Send Sms
            String data = "https://api.textlocal.in/send/?" + user + hash + numbers + message + sender;
            URL url = new URL(data);
            URLConnection conn = url.openConnection();
            conn.setDoOutput(true);
            
            //Get Response
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            String sresult = "";
            while ((line=reader.readLine()) != null){
                //process line
                sresult=sresult+line+" ";
            }
            reader.close();
            return sresult;
        }
        catch(Exception ex){
            System.out.println("Error Sending Message"+ex);
            return "Error "+ex;
        }
    }
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
            out.println("<title>Servlet Register</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
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

    private static Key generatekKey() throws Exception{
        Key key = new SecretKeySpec(keyValue, algorithm);
        return key;
    }
    private static final String algorithm = "AES";
    private static final byte[] keyValue= new byte[] {'A','l','p','h','a','n','u','m','e','r','i','c','p','a','s','s'};
    
    public static String encrypt(String input) throws Exception{
        Key key = generatekKey();
        Cipher c = Cipher.getInstance(algorithm);
        c.init(Cipher.ENCRYPT_MODE, key);
        byte[] encVal=c.doFinal(input.getBytes());
        String encryptedValue = new BASE64Encoder().encode(encVal);
        return encryptedValue;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        try{
        String sal = request.getParameter("Salutatuion");
        String fname = request.getParameter("FirstName");
        String lname = request.getParameter("LastName");
        String uname = request.getParameter("UserName");
        String pass = request.getParameter("Password");
        String gender = request.getParameter("gender");
        //String female = request.getParameter("female");
        String sage = request.getParameter("Age");
        int age = Integer.parseInt(sage);
        String cno = request.getParameter("contact");
        String otp = request.getParameter("otp");
        String email = request.getParameter("emailid");
        String add = request.getParameter("add");
        StringBuffer buffer = new StringBuffer();
        String input = pass;
        String dpass = encrypt(input);
        {
            PrintWriter out=response.getWriter();
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://192.168.1.10:3306/test_medpal","root","Admin@123");
            PreparedStatement statement = connection.prepareStatement("select * from users where uid = ?");
            statement.setString(1, uname);
            ResultSet rs = statement.executeQuery();
            if(rs.next()){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Username already exist please try with different username');");
                out.println("location='Registration.html';");
                out.println("</script>");
            }
            else
            {
            PreparedStatement ps = connection.prepareStatement("insert into users (Salutation,FirstName,LastName,Gender,Age,Address,ContactNo,EmailId,Uid,pass,actiondate,otp) select ?,?,?,?,?,?,?,?,?,?,now(),round (1000 + ( RAND( ) *8999 ) )");
            ps.setString(1, sal);
            ps.setString(2, fname);
            ps.setString(3, lname);
            ps.setString(4, gender);
            ps.setInt(5, age);
            ps.setString(6, add);
            ps.setString(7, cno);
            ps.setString(8, email);
            ps.setString(9, uname);
            ps.setString(10,dpass);
            int i = ps.executeUpdate();
            ps.close();
            sendSms();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('You have been successfully registered please verify your number!')");
            out.println("location='VerifyOtp.html';");
            out.println("</script>");
        }
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
