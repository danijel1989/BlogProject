package cubes.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {
	
	
	@RequestMapping(value = "/errors")
	public String getErrorPage(HttpServletRequest request, Model model) {
		
		int statusCode = getErrorCode(request);
		
		model.addAttribute("statusCode", statusCode);

		
		switch (statusCode) {
		case 400:
			model.addAttribute("errorMessage", "You've sent a bad http request.");
			break;
			
		case 404:
			model.addAttribute("errorMessage", "You've wrote a wrong web address");
			break;	

		default:
			model.addAttribute("errorMessage", "Error occured");
			break;
		}
		
		
		return "error-page";
	}
	
	private int getErrorCode(HttpServletRequest httprequest) {
		
		return (Integer)httprequest.getAttribute("javax.servlet.error.status_code");
	}
	

}
