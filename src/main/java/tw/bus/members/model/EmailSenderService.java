package tw.bus.members.model;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class EmailSenderService {
	
	private static final String FROM = "eeit134a30@gmail.com";
	
	@Autowired
	private JavaMailSender mailSender;
	
//	@Autowired
//	public EmailSenderService(JavaMailSender mailSender) {
//		this.mailSender = mailSender;
//	}

	public void sendEmail(String toEmail, String subject, String body) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(FROM);
		message.setTo(toEmail);
		message.setText(body);
		message.setSubject(subject);
		mailSender.send(message);
		
		System.out.println("郵件已寄出...");
	}
	
	public void sendMineEmail(String toEmail, String subject, String body) throws MessagingException {
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		
		helper.setFrom(FROM);
		helper.setTo(toEmail);
		helper.setSubject(subject);
		helper.setText(body,true);

		mailSender.send(message);
		
	}
}
