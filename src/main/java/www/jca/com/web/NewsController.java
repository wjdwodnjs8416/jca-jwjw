package www.jca.com.web;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import www.jca.com.vo.News;

@RequestMapping("/news")
@Controller
public class NewsController implements BoardController<News>{
	
	@Override
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView getListView(ModelAndView mv, News model) {
		mv.setViewName("/news/list");
		return mv;
	}
	
	@Override	
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public ModelAndView getDetailView(ModelAndView mv, News model) {
		mv.setViewName("/news/view");
		return mv;
	}

	@Override
	@RequestMapping(value="/edit", method = RequestMethod.GET)
	public ModelAndView getEditView(ModelAndView mv, News model, HttpServletRequest request) {
		mv.setViewName("/news/edit");
		return mv;
	}

	@RequestMapping(value="/write", method = RequestMethod.GET)
	@Override
	public ModelAndView getWriteView(ModelAndView mv, News model, HttpServletRequest request) {
		mv.setViewName("/news/write");
		return mv;
	}

	@RequestMapping(value="/write", method=RequestMethod.POST)
	@Override
	public String write(News model) {
		JSONObject json = new JSONObject();
		
		return json.toString();
	}

	@RequestMapping(value="/edit", method=RequestMethod.POST)
	@Override
	public String edit(News model) {
		JSONObject json = new JSONObject();
		
		return json.toString();
	}

	@RequestMapping(value="/delete", method=RequestMethod.DELETE)
	@Override
	public String delete(News model) {
		JSONObject json = new JSONObject();
		
		return json.toString();
	}
}
