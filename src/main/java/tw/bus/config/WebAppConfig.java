package tw.bus.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebAppConfig implements WebMvcConfigurer {

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
//		registry.addViewController("/2").setViewName("index2");
		registry.addViewController("/mainpage").setViewName("index2");
		
//		registry.addViewController("/index").setViewName("index");
		registry.addViewController("/login/page").setViewName("login");
//		registry.addViewController("/login/welcome").setViewName("welcome");
		registry.addViewController("/logout").setViewName("logoutResult");
//		registry.addViewController("/logout/page").setViewName("logout");
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/travelista/**").addResourceLocations("classpath:/static/travelista/");
		registry.addResourceHandler("/ServerSide/**").addResourceLocations("classpath:/static/ServerSide/");
		registry.addResourceHandler("/animages/**").addResourceLocations("/animages/");
	}
	
	
    
}
