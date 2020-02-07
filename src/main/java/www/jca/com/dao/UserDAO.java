package www.jca.com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.jca.com.vo.UserVO;

@Repository
public class UserDAO implements DataAccess<UserVO> {
	@Autowired
	SqlSessionTemplate template;
	private final String namespace = "user_sql";
	
	@Override
	public int insert(UserVO input) {
		return template.insert(namespace +".insert", input);
	}

	@Override
	public int update(UserVO input) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(UserVO input) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserVO> select() {
		return template.selectList(namespace +".select-all");
	}

	@Override
	public List<UserVO> select(UserVO input) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserVO selectOne(UserVO input) {
		return template.selectOne(namespace +".select-one", input);
	}

	@Override
	public int count(UserVO input) {
		// TODO Auto-generated method stub
		return 0;
	}

}
