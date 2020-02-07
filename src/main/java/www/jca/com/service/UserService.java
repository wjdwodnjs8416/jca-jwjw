package www.jca.com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import www.jca.com.dao.UserDAO;
import www.jca.com.vo.UserVO;

@Component("userService")
public class UserService implements DataService<UserVO> {
	@Autowired
	private UserDAO dao;
	
	@Override
	public int insert(UserVO input) {
		return dao.insert(input);
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
		return dao.select();
	}

	@Override
	public List<UserVO> select(UserVO input) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserVO selectOne(UserVO input) {
		return dao.selectOne(input);
	}

	@Override
	public int count(UserVO input) {
		// TODO Auto-generated method stub
		return 0;
	}

}
