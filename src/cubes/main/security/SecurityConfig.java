package cubes.main.security;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private DataSource myDataSource;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
//	  UserBuilder users = User.withDefaultPasswordEncoder();
//	  
//	  auth.inMemoryAuthentication()
//	  .withUser(users.username("Marko").password("marko123").roles("admin"))
//	  .withUser(users.username("Danijel").password("danijel123").roles("admin"))
//	  .withUser(users.username("Milica").password("milica123").roles("blogger"));
		 
		auth.jdbcAuthentication().dataSource(myDataSource);
		
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.authorizeRequests()
		
		.antMatchers("/").permitAll()
		.antMatchers("/admin/plugins/fontawesome-free/css/all.min.css").permitAll()
		.antMatchers("/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css").permitAll()
		.antMatchers("/admin/dist/css/adminlte.min.css").permitAll()
		.antMatchers("/admin/plugins/jquery/jquery.min.js").permitAll()
		.antMatchers("/admin/plugins/bootstrap/js/bootstrap.bundle.min.js").permitAll()
		.antMatchers("/admin/dist/js/adminlte.min.js").permitAll()
		
		.antMatchers("/admin/blog-list").hasAnyRole("admin,blogger")
		.antMatchers("/admin/blog-form").hasAnyRole("admin,blogger")
		.antMatchers("/admin/category-list").hasRole("admin")
		.antMatchers("/admin/category-form").hasRole("admin")
		.antMatchers("/admin/tag-list").hasRole("admin")
		.antMatchers("/admin/tag-form").hasRole("admin")
		.antMatchers("/admin/user-list").hasRole("admin")
		.antMatchers("/admin/user-form").hasRole("admin")
		.antMatchers("/admin/message-list").hasRole("admin")
		.antMatchers("/admin/**").hasAnyRole("admin, blogger")
		
		.and()
			.formLogin()
			.loginPage("/login-page")
			.loginProcessingUrl("/authenticateTheUser").permitAll();

		
		
	}
	
	
	

}
