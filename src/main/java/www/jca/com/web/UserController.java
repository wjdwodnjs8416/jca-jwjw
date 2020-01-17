package www.jca.com.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	@RequestMapping(value="/member/login")
	public ModelAndView getLoginView(ModelAndView mv) {
		mv.setViewName("/member/login");
		return mv;
	}
	@RequestMapping(value="/member/signup")
	public ModelAndView getSignupView(ModelAndView mv) {
		mv.setViewName("/member/signup");
		return mv;
	}
	@RequestMapping(value="/member/findId")
	public ModelAndView getFindIdView(ModelAndView mv) {
		mv.setViewName("/member/findId");
		return mv;
	}
	@RequestMapping(value="/member/findPwd")
	public ModelAndView getfindPwdView(ModelAndView mv) {
		mv.setViewName("/member/findPwd");
		return mv;
	}
	@RequestMapping(value="/member/newPwd")
	public ModelAndView getnewPwdView(ModelAndView mv) {
		mv.setViewName("/member/newPwd");
		return mv;
	}
}
