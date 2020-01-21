package www.jca.com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import www.jca.com.dao.MenuDAO;
import www.jca.com.vo.Menus;

@Component("menuService")
public class MenuService implements DataService<Menus> {
	@Autowired
	private MenuDAO dao;

	@Override
	public int insert(Menus input) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Menus input) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Menus input) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Menus> select() {
		return dao.select();
	}

	@Override
	public List<Menus> select(Menus input) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Menus selectOne(Menus input) {
		return dao.selectOne(input);
	}

	@Override
	public int count(Menus input) {
		// TODO Auto-generated method stub
		return 0;
	}
	public List<Menus> selectChildren(){
		return dao.selectChildren();
	}
}
