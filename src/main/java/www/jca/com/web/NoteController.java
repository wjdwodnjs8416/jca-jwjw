package www.jca.com.web;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import www.jca.com.vo.Note;

@RequestMapping("/note")
@Controller
public class NoteController implements BoardController<Note>{
	
	@Override
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView getListView(ModelAndView mv, Note model) {
		mv.setViewName("/note/list");
		return mv;
	}
	
	@Override	
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public ModelAndView getDetailView(ModelAndView mv, Note model) {
		mv.setViewName("/note/view");
		return mv;
	}

	@Override
	@RequestMapping(value="/edit", method = RequestMethod.GET)
	public ModelAndView getEditView(ModelAndView mv, Note model, HttpServletRequest request) {
		mv.setViewName("/note/edit");
		return mv;
	}

	@RequestMapping(value="/write", method = RequestMethod.GET)
	@Override
	public ModelAndView getWriteView(ModelAndView mv, Note model, HttpServletRequest request) {
		mv.setViewName("/note/write");
		return mv;
	}

	@RequestMapping(value="/write", method=RequestMethod.POST)
	@Override
	public String write(Note model) {
		JSONObject json = new JSONObject();
		
		return json.toString();
	}

	@RequestMapping(value="/edit", method=RequestMethod.POST)
	@Override
	public String edit(Note model) {
		JSONObject json = new JSONObject();
		
		return json.toString();
	}

	@RequestMapping(value="/delete", method=RequestMethod.DELETE)
	@Override
	public String delete(Note model) {
		JSONObject json = new JSONObject();
		
		return json.toString();
	}
}
