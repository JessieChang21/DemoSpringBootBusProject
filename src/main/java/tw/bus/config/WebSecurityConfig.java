package tw.bus.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import tw.bus.member.model.AuthUserDetailsService;

@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	private AuthUserDetailsService userDetailsService;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
		 .userDetailsService(userDetailsService)
		 .passwordEncoder(new BCryptPasswordEncoder());
	}


	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		 .authorizeRequests()
		 .antMatchers(HttpMethod.GET, "/users/**").authenticated() //表示限定/users/**範圍的GET請求都要驗證
		 .antMatchers(HttpMethod.GET).permitAll()				   //除前面限制外，其他所有GET請求無條件允許呼叫執行
		 .antMatchers(HttpMethod.POST, "/users/**").authenticated()
		 .antMatchers(HttpMethod.POST).permitAll()
		 .anyRequest().authenticated()			//anyRequest()任何請求都要求authenticated()驗證，會對剩下的進行設定建議放在最後
		 .and()
		 .rememberMe() 							//透過此記得我功能在驗證後以Cookie方式儲存至瀏覽器
		 .tokenValiditySeconds(86400) 			// 設定有效時間(秒)
		 .key("rememberMe-key") 				// 設定儲存的Cookie名稱
		 .and()
		 .csrf().disable() 						// 為不使用CSRF防跨站請求偽造防護
		 .formLogin() 							//formLogin(): 啟用Spring Security預設的登入頁面
		 .loginPage("/login/page")				//loginPage(): 自行設定登入頁面
		 .defaultSuccessUrl("/login/welcome");  //defaultSuccessUrl(): 設定登入成功頁面網
	}
	

	@Override
	public void configure(WebSecurity web) throws Exception {
	}

}
