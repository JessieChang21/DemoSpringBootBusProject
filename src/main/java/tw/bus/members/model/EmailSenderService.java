package tw.bus.members.model;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class EmailSenderService {
	
	private static final String FROM = "eeit134a30@gmail.com";
	
	@Autowired
	private JavaMailSender mailSender;
	
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
