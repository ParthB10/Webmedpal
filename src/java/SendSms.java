
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.ws.rs.core.Response;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ParthBheda
 */
//import java.io.BufferedReader;
//import java.io.InputStreamReader;
//import java.io.OutputStreamWriter;
//import java.net.URL;
//import java.net.URLConnection;
//import java.net.URLEncoder;
// 
//public class sendSMS {
//	public String sendSms() {
//		try {
//			// Construct data
//			String user = "username=" + URLEncoder.encode("youremail@address.com", "UTF-8");
//			String hash = "&hash=" + URLEncoder.encode("Your API hash", "UTF-8");
//			String message = "&message=" + URLEncoder.encode("This is your message", "UTF-8");
//			String sender = "&sender=" + URLEncoder.encode("TXTLCL", "UTF-8");
//			String numbers = "&numbers=" + URLEncoder.encode("918123456789", "UTF-8");
//			
//			// Send data
//			String data = "https://api.textlocal.in/send/?" + user + hash + numbers + message + sender;
//			URL url = new URL(data);
//			URLConnection conn = url.openConnection();
//			conn.setDoOutput(true);
//			
//			// Get the response
//			BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//			String line;
//			String sResult="";
//			while ((line = rd.readLine()) != null) {
//			// Process line...
//				sResult=sResult+line+" ";
//			}
//			rd.close();
//			
//			return sResult;
//		} catch (Exception e) {
//			System.out.println("Error SMS "+e);
//			return "Error "+e;
//		}
public class SendSms {
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
            String hash="&hash"+ URLEncoder.encode("0a2a1420b38bc4b75bdfeba4403f0656295a9b78", "UTF-8");
            String message = "&message" + URLEncoder.encode("This is your one-time password "+otp+". Thank you, From Medstream Technologies.","UTF-8");
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
}
