package fun.dayue.dao;

import java.util.List;

import fun.dayue.po.User;

public interface UserDao {

	User selectUser(User u);

	List<User> selectAllUser(Integer id);

	void deleteUserById(Integer id);

	void updateUserById(User u);

	User checkTelephone(String telephone);

	void insertUser(User u);

}
