package www.jca.com.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import www.jca.com.service.BoardService;
import www.jca.com.vo.Board;
import www.jca.com.vo.UserVO;

@RequestMapping("/notice")
@Controller
public class NoticeController extends JCAController implements BoardController<Board>{
	final int BOARD_TYPE = 1;
	
	@Autowired
	BoardService service;
	
	@Override
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView getListView(ModelAndView mv, Board model) {
		model.setBoardType(BOARD_TYPE);
		
		int count = service.count(model);
		model.setTotalCount(count);
		
		List<Board> boardList = service.select(model);
		mv.addObject("list", boardList);
		
		mv.setViewName("/notice/list");
		return mv;
	}
	
	@Override	
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public ModelAndView getDetailView(ModelAndView mv, Board model) {
		model.setBoardType(BOARD_TYPE);
		mv.setViewName("/notice/view");
		return mv;
	}

	@Override
	@RequestMapping(value="/edit", method = RequestMethod.GET)
	public ModelAndView getEditView(ModelAndView mv, Board model, HttpServletRequest request) {
		model.setBoardType(BOARD_TYPE);
		mv.setViewName("/notice/edit");
		return mv;
	}
	
	@Override
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public ModelAndView getWriteView(ModelAndView mv, Board model, HttpServletRequest request) {
		model.setBoardType(BOARD_TYPE);
		mv.setViewName("/notice/write");
		return mv;
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value="/write", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	public String write(Board model) {
		model.setBoardType(BOARD_TYPE);
		JSONObject json = new JSONObject();
		UserVO user = getUser();
		if(user != null) {
			model.setWriter(user.getId());
		}
		
		int result = service.insert(model);
		json.put("result", result);
		
		return json.toString();
	}
	
	@Override
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	@ResponseBody
	public String edit(Board model) {
		model.setBoardType(BOARD_TYPE);
		JSONObject json = new JSONObject();
		
		return json.toString();
	}

	@Override
	@ResponseBody
	@RequestMapping(value="/delete", method=RequestMethod.DELETE)
	public String delete(Board model) {
		model.setBoardType(BOARD_TYPE);
		JSONObject json = new JSONObject();
		
		return json.toString();
	}
}
