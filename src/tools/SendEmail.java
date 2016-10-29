package tools;

//import java.util.Properties;
//import javax.mail.Message;
//import javax.mail.MessagingException;
//import javax.mail.PasswordAuthentication;
//import javax.mail.Session;
//import javax.mail.Transport;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeMessage;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;

public class SendEmail {
	public static void sendEmail(String email,String subject,String text) { 
		String to="minhtoan5495@gmail.com";//change accordingly 
		String from="kupinguyen567@gmail.com";//change accordingly 
		String password="0936054481";//change accordingly 
	
		//Get the session object 
		Properties props = new Properties(); 
		props.put("mail.smtp.host", "smtp.gmail.com"); 
		props.put("mail.smtp.socketFactory.port", "465"); 
		props.put("mail.smtp.socketFactory.class", 
		"javax.net.ssl.SSLSocketFactory"); 
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.port", "465"); 	
		Session session = Session.getDefaultInstance(props, 
		new javax.mail.Authenticator() { 
		protected PasswordAuthentication getPasswordAuthentication() { 
			return new PasswordAuthentication(from,password);
		} 
		}); 	
		//compose message 
		try { 
			MimeMessage message = new MimeMessage(session); 
			message.setFrom(new InternetAddress(from)); 
			message.addRecipient(Message.RecipientType.TO,new InternetAddress(to)); 
			message.setSubject("Từ email : " + email + "\nSubject : " + subject); 
			message.setText(text); 	
			//send message 
			Transport.send(message); 	
			System.out.println("Message sent successfully"); 	
		} catch (MessagingException e) {
			throw new RuntimeException(e);
			} 	
	}
}