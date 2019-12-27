package www.jca.com.web;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import www.jca.com.service.BoardService;
import www.jca.com.service.UserService;
import www.jca.com.vo.Board;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private UserService userService;
	@Autowired
	private BoardService boardService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, ModelAndView mv,
			HttpServletRequest req, Authentication authentication) {
		Board input = new Board();
		input.setBoardType(Board.TYPE_ALL);
		int total = boardService.count(input);
		input.setTotalCount(total);
		
		List<Board> boardList = boardService.select(input);
		
		mv.addObject("list", boardList);
		mv.setViewName("index");
		return mv;
	}
}
