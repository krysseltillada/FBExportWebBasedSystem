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
		return sendEmail(name,to, subject, String.format("<html>"
				+ "<style></style>"
				+"<body>%s <br><br> Sincerely, <br><b>%s</b></body>"
				+ "</html>", text, name), "Message sent");
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
