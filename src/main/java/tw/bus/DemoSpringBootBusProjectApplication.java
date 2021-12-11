package tw.bus;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.PropertySource;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@PropertySource(value= {"classpath:jdbc.properties"},ignoreResourceNotFound = true)
@EnableJpaRepositories(basePackages = {"tw.bus"})
@EntityScan(basePackages = {"tw.bus"})
public class DemoSpringBootBusProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoSpringBootBusProjectApplication.class, args);
	}

}
