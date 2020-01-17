package www.jca.com.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping(value="/curriculum")
@Controller
public class CurriculumController {

	@RequestMapping(value="/")
	public ModelAndView getView(ModelAndView mv) {
		
		mv.setViewName("/contents/curriculum");
		return mv;
	}
}
