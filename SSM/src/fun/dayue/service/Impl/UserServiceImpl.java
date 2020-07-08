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
	//��¼��֤
	@Override
	public User selectUser(User u) {
		
		 User user=userDao.selectUser(u);
		 return user;
	}
	//��ѯ�����û�
	@Override
	public List<User> selectAllUser(Integer id) {
		
		return userDao.selectAllUser(id);
	}
	//ɾ���û�
	@Override
	public void deleteUserById(Integer id) {
		userDao.deleteUserById(id);
	}
	
	//�޸�
	@Override
	public void updateUserById(User u) {
		userDao.updateUserById(u);
	}
	//�ж��ֻ����Ƿ����
	@Override
	public User checkTelephone(String telephone) {
		return userDao.checkTelephone(telephone);
	}
	//ע��
	@Override
	public void insertUser(User u) {
		userDao.insertUser(u);
	}

}
