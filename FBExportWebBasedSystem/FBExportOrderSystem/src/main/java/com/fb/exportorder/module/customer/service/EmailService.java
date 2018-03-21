package com.fb.exportorder.module.customer.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.fb.exportorder.models.customer.Customer;

@Service
public class EmailService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	public String contactUs(String name, String to, String subject, String text) {
		if(StringUtils.isEmpty(name) || StringUtils.isEmpty(to) || StringUtils.isEmpty(subject) || StringUtils.isEmpty(text))
			return "Please complete the form";
		return sendEmail(name,to, subject, String.format("<html><body>%s <br><br> Sincerely, <br><b>%s</b></body></html>", text, name), "Message sent");
	}
	
	public String verifyEmail(String name, String to, String subject, String link) {
		StringBuilder builder = new StringBuilder();
		builder.append("<html><body>");
		builder.append(String.format("Hi! <b>%s</b> <br><br>", name));
		builder.append("Please click the following link to confirm your email address : <br><br>");
		builder.append(String.format("<a href=\"%s\" >%s</a>", link, link));
		builder.append("<br><br>If you received this message by mistake just delete it without clicking the link. <br><br>");
		builder.append("Need help? <a href=\"http://localhost:9090/FBExportSystem/contact-us\" >Contact us</a>");
		builder.append("<br><br> Do not reply. This is an automated message.");
		builder.append("<br><br> Sincerely, <br><b>Fong Bros Inc.</b></body></html>");
		return sendEmail(name,to, subject, builder.toString(), "Message sent");
	}
	
	private String sendEmail(String name, String to, String subject, String text, String response) {
		MimeMessage message = mailSender.createMimeMessage();
	      
	    
	    try {
	    	MimeMessageHelper helper = new MimeMessageHelper(message, true);
		    
		    helper.setTo(to);
			helper.setSubject(subject);
			helper.setText(text,true);
		} catch (MessagingException e) {
			return e.getMessage();
		}
	 
	    mailSender.send(message);
		
	    return response;
	}
}
