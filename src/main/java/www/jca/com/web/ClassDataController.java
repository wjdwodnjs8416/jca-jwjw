package www.jca.com.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import www.jca.com.vo.Board;

@Controller
public class ClassDataController implements BoardController<Board> {

	@RequestMapping("/class/data/list")
	@Override
	public ModelAndView getListView(ModelAndView mv, Board model) {
		mv.setViewName("/notice/dataList");
		return mv;
	}

	@Override
	public ModelAndView getDetailView(ModelAndView mv, Board model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView getEditView(ModelAndView mv, Board model, HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView getWriteView(ModelAndView mv, Board model, HttpServletRequest request, Integer type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String write(Board model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView edit(Board model, ModelAndView mv) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete(Board model) {
		// TODO Auto-generated method stub
		return null;
	}

}
