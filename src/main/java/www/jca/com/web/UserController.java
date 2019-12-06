package www.jca.com.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	@RequestMapping(value="/login")
	public ModelAndView getLoginView(ModelAndView mv) {
		mv.setViewName("/member/login");
		return mv;
	}
	@RequestMapping(value="/join")
	public ModelAndView getSignupView(ModelAndView mv) {
		mv.setViewName("/member/signup");
		return mv;
	}
}
