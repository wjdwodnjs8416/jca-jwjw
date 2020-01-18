package www.jca.com.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import www.jca.com.service.MenuService;
import www.jca.com.vo.Menus;

@RequestMapping(value="/inc")
@Controller
public class IncController {
	@Autowired
	MenuService menuService;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value="/head")
	public ModelAndView getHeadView(ModelAndView mv) {
		mv.setViewName("/inc/head");
		return mv;
	}
	@RequestMapping(value="/gnb")
	public ModelAndView getGnBView(ModelAndView mv) {
		Map<Integer, Menus> parents = new HashMap<Integer, Menus>();
		
		List<Menus> menus = menuService.select();
		Iterator<Menus> iter = menus.iterator();
		while(iter.hasNext()) {
			Menus menu = iter.next();
			logger.info(menu.toString());
			logger.info("parents.size(): " + parents.size());
			
			if(menu.getParent() == 0) {
				parents.put(menu.getId(), menu);
			}else {
				logger.info("menu.getParent(): " + menu.getParent());
				logger.info("parents.get(menu.getParent()): " + parents.get(menu.getParent()));
				Menus p = parents.get(menu.getParent());
				
				if(p != null) {
					logger.info("p not null");
					List<Menus> pc = p.getChildren();
					pc.add(menu);
				}
			}
		}
		List<Menus> menuList = new ArrayList<Menus>(parents.values());
		
		mv.addObject("menus", menuList);
		mv.setViewName("/inc/gnb");
		return mv;
	}
	@RequestMapping(value="/header")
	public ModelAndView getHeaderView(ModelAndView mv) {

		mv.setViewName("/inc/header");
		return mv;
	}
	@RequestMapping(value="/footer")
	public ModelAndView getFooterView(ModelAndView mv) {
		mv.setViewName("/inc/footer");
		return mv;
	}
}
