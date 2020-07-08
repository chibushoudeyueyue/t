package fun.dayue.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import fun.dayue.dao.UserDao;
import fun.dayue.po.User;
import fun.dayue.service.UserService;
@Service
public class UserServiceImpl implements UserService {
	@Resource
	private UserDao userDao;
	//登录验证
	@Override
	public User selectUser(User u) {
		
		 User user=userDao.selectUser(u);
		 return user;
	}
	//查询所有用户
	@Override
	public List<User> selectAllUser(Integer id) {
		
		return userDao.selectAllUser(id);
	}
	//删除用户
	@Override
	public void deleteUserById(Integer id) {
		userDao.deleteUserById(id);
	}
	
	//修改
	@Override
	public void updateUserById(User u) {
		userDao.updateUserById(u);
	}
	//判断手机号是否存在
	@Override
	public User checkTelephone(String telephone) {
		return userDao.checkTelephone(telephone);
	}
	//注册
	@Override
	public void insertUser(User u) {
		userDao.insertUser(u);
	}

}
