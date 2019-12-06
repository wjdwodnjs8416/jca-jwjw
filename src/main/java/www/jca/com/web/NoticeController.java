package www.jca.com.web;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import www.jca.com.vo.Notice;

@RequestMapping("/notice")
@Controller
public class NoticeController implements BoardController<Notice>{
	
	@Override
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView getListView(ModelAndView mv, Notice model) {
		mv.setViewName("/notice/list");
		return mv;
	}
	
	@Override	
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public ModelAndView getDetailView(ModelAndView mv, Notice model) {
		mv.setViewName("/notice/view");
		return mv;
	}

	@Override
	@RequestMapping(value="/edit", method = RequestMethod.GET)
	public ModelAndView getEditView(ModelAndView mv, Notice model, HttpServletRequest request) {
		mv.setViewName("/notice/edit");
		return mv;
	}

	@RequestMapping(value="/write", method = RequestMethod.GET)
	@Override
	public ModelAndView getWriteView(ModelAndView mv, Notice model, HttpServletRequest request) {
		mv.setViewName("/notice/write");
		return mv;
	}

	@RequestMapping(value="/write", method=RequestMethod.POST)
	@Override
	public String write(Notice model) {
		JSONObject json = new JSONObject();
		
		return json.toString();
	}

	@RequestMapping(value="/edit", method=RequestMethod.POST)
	@Override
	public String edit(Notice model) {
		JSONObject json = new JSONObject();
		
		return json.toString();
	}

	@RequestMapping(value="/delete", method=RequestMethod.DELETE)
	@Override
	public String delete(Notice model) {
		JSONObject json = new JSONObject();
		
		return json.toString();
	}
}
