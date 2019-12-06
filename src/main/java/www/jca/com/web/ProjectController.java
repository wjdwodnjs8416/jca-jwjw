package www.jca.com.web;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import www.jca.com.vo.Project;

@RequestMapping("/project")
@Controller
public class ProjectController implements BoardController<Project>{
	
	@Override
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView getListView(ModelAndView mv, Project model) {
		mv.setViewName("/project/list");
		return mv;
	}
	
	@Override	
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public ModelAndView getDetailView(ModelAndView mv, Project model) {
		mv.setViewName("/project/view");
		return mv;
	}

	@Override
	@RequestMapping(value="/edit", method = RequestMethod.GET)
	public ModelAndView getEditView(ModelAndView mv, Project model, HttpServletRequest request) {
		mv.setViewName("/project/edit");
		return mv;
	}

	@RequestMapping(value="/write", method = RequestMethod.GET)
	@Override
	public ModelAndView getWriteView(ModelAndView mv, Project model, HttpServletRequest request) {
		mv.setViewName("/project/write");
		return mv;
	}

	@RequestMapping(value="/write", method=RequestMethod.POST)
	@Override
	public String write(Project model) {
		JSONObject json = new JSONObject();
		
		return json.toString();
	}

	@RequestMapping(value="/edit", method=RequestMethod.POST)
	@Override
	public String edit(Project model) {
		JSONObject json = new JSONObject();
		
		return json.toString();
	}

	@RequestMapping(value="/delete", method=RequestMethod.DELETE)
	@Override
	public String delete(Project model) {
		JSONObject json = new JSONObject();
		
		return json.toString();
	}
}
