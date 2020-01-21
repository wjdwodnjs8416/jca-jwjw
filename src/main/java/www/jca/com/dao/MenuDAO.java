package www.jca.com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.jca.com.vo.Menus;

@Repository
public class MenuDAO implements DataAccess<Menus> {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String namespace = "menu_sql";
	
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
		return sqlSession.selectList(namespace +".select_all");
	}

	@Override
	public List<Menus> select(Menus input) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Menus selectOne(Menus input) {
		return sqlSession.selectOne(namespace +".select_one", input);
	}

	@Override
	public int count(Menus input) {
		// TODO Auto-generated method stub
		return 0;
	}
	public List<Menus> selectChildren(){
		return sqlSession.selectList(namespace +".select_children");
	}
}
