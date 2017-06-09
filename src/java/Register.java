/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.PreparedStatement;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Key;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
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
//    private static Cipher cipher = null;
// private static byte[] encrypt(String input)throws Exception {
//            cipher.init(Cipher.ENCRYPT_MODE, key);
//            byte[] inputBytes = input.getBytes();
//            return cipher.doFinal(inputBytes);
//        }
//%>
//<%!
//        private static String decrypt(byte[] encryptionBytes)throws Exception {
//            cipher.init(Cipher.DECRYPT_MODE, key);
//            byte[] recoveredBytes =  cipher.doFinal(encryptionBytes);
//            String recovered =  new String(recoveredBytes);
//            return recovered;
//          }
//          %>
//<%
//String name=request.getParameter("name");
//String password=request.getParameter("pass");
//String address=request.getParameter("address");
//String phone=request.getParameter("phone");
//int ph=Integer.parseInt(phone);
//StringBuffer buffer=new StringBuffer();
// key = KeyGenerator.getInstance(algorithm).generateKey();
//            cipher = Cipher.getInstance(algorithm);
//            String input = password;
//            System.out.println("Entered: " + input);
//            byte[] encryptionBytes = encrypt(input);
//            String passw=new String(encryptionBytes);
//String connectionURL = "jdbc:mysql://localhost:3306/test";
//Connection con=null;
//try{
//Class.forName("com.mysql.jdbc.Driver");
//con = DriverManager.getConnection(connectionURL, "root", "root");
//PreparedStatement ps = con.prepareStatement("INSERT INTO user(name,password,address,telno) VALUES(?,?,?,?)");
//ps.setString(1,name);
//ps.setString(2,passw);
//ps.setString(3,address);
//ps.setInt(4,ph);
//int i = ps.executeUpdate();
//ps.close();
//
//}
//catch(Exception ex){
//System.out.println(ex);
//}
//try{
//Statement st=con.createStatement();
//ResultSet rs=st.executeQuery("Select * from user where id='1'");
//String str="";
//if(rs.next()){
//str=rs.getString("password");
//}
//out.println("Your password is: "+decrypt(str.getBytes()));
//System.out.println("Your password is: "+decrypt(str.getBytes()));
//}
//catch(Exception e){}
//%>
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
//    private static String algorithm = "DESede" ;
//    private static Key key = null;
//    private static Cipher cipher = null;
//    private static byte[] encrypt(String input)throws Exception{
//        cipher.init(Cipher.ENCRYPT_MODE, key);
//        byte[] inputBytes = input.getBytes();
//        return cipher.doFinal(inputBytes);
//    }
//    
//    private static String decrypt(byte[] encryptionBytes)throws Exception{
//        cipher.init(Cipher.DECRYPT_MODE,key);
//        byte[] recoveredBytes = cipher.doFinal(encryptionBytes);
//        String recovered = new String(recoveredBytes);
//        return recovered;
//    }
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
//    import java.security.*;
//import java.security.spec.InvalidKeySpecException;
//import javax.crypto.*;
//import sun.misc.*;
//
//public class AESencrp {
//    
//     private static final String ALGO = "AES";
//    private static final byte[] keyValue = 
//        new byte[] { 'T', 'h', 'e', 'B', 'e', 's', 't',
//'S', 'e', 'c', 'r','e', 't', 'K', 'e', 'y' };
//
//public static String encrypt(String Data) throws Exception {
//        Key key = generateKey();
//        Cipher c = Cipher.getInstance(ALGO);
//        c.init(Cipher.ENCRYPT_MODE, key);
//        byte[] encVal = c.doFinal(Data.getBytes());
//        String encryptedValue = new BASE64Encoder().encode(encVal);
//        return encryptedValue;
//    }
//
//    public static String decrypt(String encryptedData) throws Exception {
//        Key key = generateKey();
//        Cipher c = Cipher.getInstance(ALGO);
//        c.init(Cipher.DECRYPT_MODE, key);
//        byte[] decordedValue = new BASE64Decoder().decodeBuffer(encryptedData);
//        byte[] decValue = c.doFinal(decordedValue);
//        String decryptedValue = new String(decValue);
//        return decryptedValue;
//    }
//    private static Key generateKey() throws Exception {
//        Key key = new SecretKeySpec(keyValue, ALGO);
//        return key;
//}
//
//}
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
        //key=KeyGenerator.getInstance(algorithm).generateKey();
        //cipher=Cipher.getInstance(algorithm);
        String input = pass;
        //System.out.println("");
        //byte[] encryptionBytes = encrypt(input);
        String dpass = encrypt(input);
        //StringBuffer buffer=new StringBuffer();
// key = KeyGenerator.getInstance(algorithm).generateKey();
//            cipher = Cipher.getInstance(algorithm);
//            String input = password;
//            System.out.println("Entered: " + input);
//            byte[] encryptionBytes = encrypt(input);
//            String passw=new String(encryptionBytes);
        
//    catch(Exception e)
//    {
//        System.out.println(e);
//    }
//        
//try
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
            PreparedStatement ps = connection.prepareStatement("insert into users (Salutation,FirstName,LastName,Gender,Age,Address,ContactNo,EmailId,Uid,pass,actiondate) Values (?,?,?,?,?,?,?,?,?,?,now())");
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
        
        
            //ps.setString(1,name);
//ps.setString(2,passw);
//ps.setString(3,address);
//ps.setInt(4,ph);
//int i = ps.executeUpdate();
//ps.close();
//
//}
//catch(Exception ex){
//System.out.println(ex);
//}
//try{
//Statement st=con.createStatement();
//ResultSet rs=st.executeQuery("Select * from user where id='1'");
//String str="";
//if(rs.next()){
//str=rs.getString("password");
//}
//out.println("Your password is: "+decrypt(str.getBytes()));
//System.out.println("Your password is: "+decrypt(str.getBytes()));
//}
//catch(Exception e){}
        //}
    //}

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
