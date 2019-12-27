package www.jca.com.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.util.ImageUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import www.jca.com.service.BoardService;
import www.jca.com.service.FileInfoService;
import www.jca.com.service.PhotoInfoService;
import www.jca.com.util.FileUtil;
import www.jca.com.vo.Board;
import www.jca.com.vo.FileInfo;
import www.jca.com.vo.PhotoInfo;
import www.jca.com.vo.UserVO;

@RequestMapping("/notice")
@Controller
public class NoticeController extends JCAController implements BoardController<Board>{
	final int BOARD_TYPE = 1;
	
	@Autowired
	BoardService service;
	@Autowired
	FileInfoService fileInfoService;
	@Autowired
	PhotoInfoService photoInfoService;
	
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
		Board board = service.selectOne(model);
		
		FileInfo input = new FileInfo();
		input.setBoardId(board.getId());
		List<FileInfo> files = fileInfoService.select(input);
		
		PhotoInfo photo = new PhotoInfo();
		photo.setBoardId(board.getId());
		List<PhotoInfo> photos = photoInfoService.select(photo);
		
		mv.addObject("photos", photos);
		mv.addObject("files", files);
		mv.addObject("board", board);
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
	@RequestMapping(value="/deprecated", method=RequestMethod.POST, produces = "application/json; charset=utf8")
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
	
	@ResponseBody
	@RequestMapping(value="/write", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	public ModelAndView writeWithAttach(Board model, 
			@RequestParam(value="files", required = false)String files,
			@RequestParam(value="images", required = false)String images,
			ModelAndView mv) {
		model.setBoardType(BOARD_TYPE);
		
		JSONObject json = new JSONObject();
		UserVO user = getUser();
		if(user != null) {
			model.setWriter(user.getId());
		}
		
		int result = service.insert(model);
		json.put("result", result);
		
		if(files !=null && files.length() > 0) {
			FileUtil fileUtil = new FileUtil();
			fileInfoService.update(fileUtil.parseFileInfo(files.split(","), model.getId()));
		}
		if(images !=null && images.length() > 0) {
			FileUtil fileUtil = new FileUtil();
			photoInfoService.update(fileUtil.parsePhotoInfo(images.split(","), model.getId()));
		}
		
		mv.setViewName("redirect:/notice/");
		return mv;
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
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String delete(Board model) {
		model.setBoardType(BOARD_TYPE);
		JSONObject json = new JSONObject();
		logger.info(model.toString());
		
		int result = service.delete(model);
		json.put("result", result);
		return json.toString();
	}
}
