package www.jca.com.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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

@RequestMapping("/board")
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
	
	private int getType(String input) {
		if(input.equalsIgnoreCase("notice")) {
			return Board.TYPE_NOTICE;
		}else if(input.equalsIgnoreCase("class")) {
			return Board.TYPE_CLASS;
		}else if(input.equalsIgnoreCase("video")) {
			return Board.TYPE_VIDEO;
		}else if(input.equalsIgnoreCase("note")) {
			return Board.TYPE_NOTE;
		}else if(input.equalsIgnoreCase("project")) {
			return Board.TYPE_PROJECT;
		}else if(input.equalsIgnoreCase("news")) {
			return Board.TYPE_NEWS;
		}else if(input.equalsIgnoreCase("book")) {
			return Board.TYPE_BOOK;
		}
		return 0;
	}
	@RequestMapping(value="/{name}", method=RequestMethod.GET)
	public ModelAndView getListView(ModelAndView mv, Board model,
			@PathVariable(value="name")String typeOfBoard) {
		model.setBoardType(getType(typeOfBoard));
		
		int count = service.count(model);
		model.setTotalCount(count);
		
		List<Board> boardList = service.select(model);
		mv.addObject("list", boardList);
		mv.addObject("listUrl", "/board/"+typeOfBoard);
		mv.addObject("paging", model);
		mv.setViewName("/notice/list");
		return mv;
	}
	@Override	
	@RequestMapping(value="/{name}/view", method = RequestMethod.GET)
	public ModelAndView getDetailView(ModelAndView mv, Board model,
			@PathVariable(value="name")String typeOfBoard) {
		model.setBoardType(getType(typeOfBoard));
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
		mv.addObject("listUrl", "/board/"+typeOfBoard);
		mv.setViewName("/notice/view");
		return mv;
	}

	@Override
	@RequestMapping(value="/{name}/edit", method = RequestMethod.GET)
	public ModelAndView getEditView(ModelAndView mv, Board model, HttpServletRequest request,
			@PathVariable(value="name")String typeOfBoard) {
		model.setBoardType(getType(typeOfBoard));
		
		Board board = service.selectOne(model);
		
		mv.addObject("board", board);
		mv.setViewName("/notice/edit");
		return mv;
	}
	
	@Override
	@RequestMapping(value="/{name}/write", method = RequestMethod.GET)
	public ModelAndView getWriteView(ModelAndView mv, Board model, HttpServletRequest request,
			@PathVariable(value="name")String typeOfBoard) {
		model.setBoardType(getType(typeOfBoard));
		mv.setViewName("/notice/write");
		return mv;
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value="/{name}/deprecated", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	public String write(Board model,
			@PathVariable(value="name")String typeOfBoard) {
		model.setBoardType(getType(typeOfBoard));
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
	@RequestMapping(value="/{name}/write", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	public ModelAndView writeWithAttach(Board model, 
			@RequestParam(value="files", required = false)String files,
			@RequestParam(value="images", required = false)String images,
			ModelAndView mv,
			@PathVariable(value="name", required=true)String typeOfBoard) {
		model.setBoardType(getType(typeOfBoard));
		
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
		
		mv.setViewName("redirect:/board/"+typeOfBoard+"/");
		return mv;
	}
	
	@Override
	@RequestMapping(value="/{name}/edit", method=RequestMethod.POST)
	@ResponseBody
	public String edit(Board model,
			@PathVariable(value="name")String typeOfBoard) {
		logger.info(model.toString());
		
		model.setBoardType(getType(typeOfBoard));
		JSONObject json = new JSONObject();
		int result = service.update(model);
		json.put("result", result);
		
		return json.toString();
	}

	@Override
	@ResponseBody
	@RequestMapping(value="/{name}/delete", method=RequestMethod.POST)
	public String delete(Board model,
			@PathVariable(value="name")String typeOfBoard) {
		model.setBoardType(getType(typeOfBoard));
		JSONObject json = new JSONObject();
		logger.info(model.toString());
		
		int result = service.delete(model);
		json.put("result", result);
		return json.toString();
	}
}
