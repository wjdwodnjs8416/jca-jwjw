package www.jca.com.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping(value="/inc")
@Controller
public class IncController {
	
	@RequestMapping(value="/head")
	public ModelAndView getHeadView(ModelAndView mv) {
		mv.setViewName("/inc/head");
		return mv;
	}
	@RequestMapping(value="/gnb")
	public ModelAndView getGnBView(ModelAndView mv) {
		mv.setViewName("/inc/gnb");
		return mv;
	}
	@RequestMapping(value="/header")
	public ModelAndView getHeaderView(ModelAndView mv) {
		mv.setViewName("/inc/header");
		return mv;
	}
	@RequestMapping(value="/footer")
	public ModelAndView getFooterView(ModelAndView mv) {
		mv.setViewName("/inc/footer");
		return mv;
	}
}
