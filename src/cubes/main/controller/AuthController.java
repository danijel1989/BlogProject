package cubes.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthController {


	@RequestMapping(value = "/login-page")
	public String getLoginPage() {
		
		
		
		return "login-page";
	}
	
}
