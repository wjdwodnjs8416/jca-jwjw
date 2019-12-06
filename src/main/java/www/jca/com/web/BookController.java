package www.jca.com.web;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import www.jca.com.vo.Book;

@RequestMapping("/book")
@Controller
public class BookController implements BoardController<Book>{
	
	@Override
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView getListView(ModelAndView mv, Book model) {
		mv.setViewName("/book/list");
		return mv;
	}
	
	@Override	
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public ModelAndView getDetailView(ModelAndView mv, Book model) {
		mv.setViewName("/book/view");
		return mv;
	}

	@Override
	@RequestMapping(value="/edit", method = RequestMethod.GET)
	public ModelAndView getEditView(ModelAndView mv, Book model, HttpServletRequest request) {
		mv.setViewName("/book/edit");
		return mv;
	}

	@RequestMapping(value="/write", method = RequestMethod.GET)
	@Override
	public ModelAndView getWriteView(ModelAndView mv, Book model, HttpServletRequest request) {
		mv.setViewName("/book/write");
		return mv;
	}

	@RequestMapping(value="/write", method=RequestMethod.POST)
	@Override
	public String write(Book model) {
		JSONObject json = new JSONObject();
		
		return json.toString();
	}

	@RequestMapping(value="/edit", method=RequestMethod.POST)
	@Override
	public String edit(Book model) {
		JSONObject json = new JSONObject();
		
		return json.toString();
	}

	@RequestMapping(value="/delete", method=RequestMethod.DELETE)
	@Override
	public String delete(Book model) {
		JSONObject json = new JSONObject();
		
		return json.toString();
	}
}
