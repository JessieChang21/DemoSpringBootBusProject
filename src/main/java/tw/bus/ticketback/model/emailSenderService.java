package tw.bus.ticketback.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class emailSenderService {
	@Autowired
	private JavaMailSender mailSender;
	
	public void sendEmail(String toEmail, String subject, String body) {
		
		SimpleMailMessage messageCancelOrder = new SimpleMailMessage();
		messageCancelOrder.setFrom("nien0000tw@gmail.com");
		messageCancelOrder.setTo(toEmail);
		messageCancelOrder.setText(body);
		messageCancelOrder.setSubject(subject);
		
		mailSender.send(messageCancelOrder);
		System.out.println("寄送郵件");
		
	}
}
