package com.fb.exportorder.module.customer.service;

import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.commons.lang3.text.StrSubstitutor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.customer.Order;
import com.fb.exportorder.module.customer.repository.CustomerRepository;
import com.fb.exportorder.utilities.MD5Encoder;

@Service
public class EmailService {
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MD5Encoder encoder;
	
	public String forgotPassword(String email) {
		if(StringUtils.isEmpty(email))
			return "Please complete the form";
		
		Customer customer = customerRepository.findAccountByEmail(email);
		if(Objects.isNull(customer))
			return "Email not registered";
		
		StringBuilder builder = new StringBuilder();
		builder.append("<html><body>");
		builder.append(String.format("Dear %s %s", customer.getFirstname() , customer.getLastname()));
		builder.append("<br><br> We received a request to reset your account password.<br><br>");
		builder.append("To reset your password, please click the following link : <br><br>");
		builder.append(String.format("<a href=\"http://localhost:9090/FBExportSystem/resetpassword/%1$d/%2$s\">http://localhost:9090/FBExportSystem/resetpassword/%1$d/%2$s</a>",customer.getId(), encoder.encode(customer.getUsername()+customer.getContact().getEmailAddress())));
		builder.append("<br><br>Note: If you do not want to reset your password, please ignore this email and all your account information will remain the same.");
		builder.append("<br><br> Do not reply. This is an automated message.");
		builder.append("<br><br> Sincerely, <br><b>Fong Bros Inc.</b></body></html>");
		
		return sendEmail(email, email, "[Forgot Password]", builder.toString(), "Message sent");
	}
	
	public String contactUs(String name, String to, String subject, String text) {
		if(StringUtils.isEmpty(name) || StringUtils.isEmpty(to) || StringUtils.isEmpty(subject) || StringUtils.isEmpty(text))
			return "Please complete the form";
		return sendEmail(name,to, subject, String.format("<html><body>%s <br><br> Sincerely, <br><b>%s</b></body></html>", text, name), "Message sent");
	}
	
	@Async
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
	
	@Async
	public void sendPaymentReceiptEmail(String emailTo, 
										Order order, 
										List<String> itemDescription, 
										List<String> itemPrice,
										String subTotal,
										String tax,
										String shipping,
										String totalDue) {
		
		StringBuffer htmlOrderSummary = new StringBuffer();
		
		Customer customer = order.getCustomer();
		
		for (int i = 0; i != itemDescription.size(); ++i) {
			
			
			htmlOrderSummary.append("<tr style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">" +
										"<td style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; border-top-width: 1px; border-top-color: #eee; border-top-style: solid; margin: 0; padding: 5px 0;\" valign=\"top\">" + 
										 itemDescription.get(i) +
										 "</td>" +
										"<td class=\"alignright\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; text-align: right; border-top-width: 1px; border-top-color: #eee; border-top-style: solid; margin: 0; padding: 5px 0;\" align=\"right\" valign=\"top\">" +
										 itemPrice.get(i) +
										"</td>" +
									"</tr>");
			
			
		}
		
		String fullname = customer.getFirstname() + " " + customer.getMiddlename() + " " + customer.getLastname();
		String orderId = order.getOrderId().toString();
		String datePaid = new SimpleDateFormat("MMMMM d, yyyy").format(order.getDatePaid());
		String orderSummary = htmlOrderSummary.toString();
		
		sendHTMLEmail(emailTo, 
					  "Payment receipt", 
					  "src\\main\\webapp\\templates\\email-templates\\payment-receipt.html",
					  new HashMap<String, String>() {{
						put("customerName", fullname);
						put("orderId", orderId);
						put("date", datePaid);
						put("orderSummary", orderSummary);
						put("subTotal", subTotal);
						put("tax", tax);
						put("shipping", shipping);
						put("totalDue", totalDue);
					  }});
	}
	
	
	private void sendHTMLEmail(String to, String subject, String templateFilePath, Map<String, String> templateArgs) {
		
		try {
			
			MimeMessage mimeMessage = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
			
			List<String> templateContentList = Files.readAllLines(FileSystems.getDefault().getPath(templateFilePath));
			String htmlMessage = new StrSubstitutor(templateArgs).replace(String.join("", templateContentList));
			
			helper.setTo(to);
			helper.setSubject(subject);
			helper.setText(htmlMessage, true);
			helper.addInline("fong-bros-logo", FileSystems.getDefault().getPath("src\\main\\webapp\\resources\\company-logo.png").toFile());
			
			mailSender.send(mimeMessage);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		
		
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
