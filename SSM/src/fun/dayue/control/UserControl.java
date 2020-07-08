package fun.dayue.control;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import fun.dayue.po.User;
import fun.dayue.service.UserService;

@Controller
@RequestMapping("/user")
public class UserControl {
	@Resource//�Զ�ע��
	private UserService userService;
	//��¼��֤
	@RequestMapping("loginCheck")
	public String loginCheck(User u,Model model, HttpSession session){
		User user=userService.selectUser(u);
		if(user!=null){
			session.setAttribute("user", user);
			session.setAttribute("userid",user.getId());
			session.setAttribute("username", user.getUsername());
			return "forward:selectAllUser.do";
		}else{
			model.addAttribute("error","error");
			return "index";
		}
	}
	//��ѯ�����û�
	@RequestMapping("selectAllUser")
	public String selectAllUser(Model model, HttpSession session){
		User user=(User)session.getAttribute("user");
		List<User> userList=userService.selectAllUser(user.getId());
		model.addAttribute("userList", userList);
		return "welcome";
	}
	
	//ɾ��
	@RequestMapping("deleteUserById/{id}")
	public String deleteUserById(@PathVariable Integer id, HttpSession session,Model model){
		User u=(User) session.getAttribute("user");
		String message="";
		//�ж��Ƿ�Ϊ����Ա
		if(u.getAdmin()==1){
			userService.deleteUserById(id);
			message="ɾ���û�idΪ"+id+"�ɹ�";
			model.addAttribute("message", message);
			return "forward:/user/selectAllUser.do";
		}else{
			message="�㲻�ǹ���Ա�޷����д˲���";
			model.addAttribute("message", message);
			return "forward:/user/selectAllUser.do";
		}
		
		
	}
	//����id��ѯ�û�ת�����޸�ҳ��
	@RequestMapping("selectUserById/{id}")
	public String selectUserById(@PathVariable Integer id,Model model,HttpSession session){
		String message="";
		User userSession=(User) session.getAttribute("user");
		if(userSession.getAdmin()==1){
			User user= new User(id);
			User u = userService.selectUser(user);
			model.addAttribute("user", u);
			return "xiugai";
		}else{
			message="�㲻�ǹ���Ա�޷����д˲���";
			model.addAttribute("message", message);
			return "forward:/user/selectAllUser.do";
		}
		
	}
	
	//��ѯ�ҵĸ�����Ϣ
	@RequestMapping("selectMyById")
	public String selectMyById(HttpSession session,Model model){
		User sessionUser=(User)session.getAttribute("user");
		Integer	id=sessionUser.getId();
		System.out.println(id);
		User user= new User(id);
		User u = userService.selectUser(user);
		model.addAttribute("user", u);
		return "xiugai";
	}
	
	//�޸��û�
	@RequestMapping("editUserById")
	public String editUserById(User u,HttpSession session,Model model){
		String message="";
		User userTelephone=userService.checkTelephone(u.getTelephone());
		if(userTelephone!=null&&userTelephone.getId()!=u.getId()){
			message="telephoneisexit";
			model.addAttribute("user", u);
			model.addAttribute("message", message);
			return "forward:/rest/user/selectUserById/"+u.getId();
		}
		User user=(User) session.getAttribute("user");
		if(user.getAdmin()==1||u.getId()==user.getId()){
			userService.updateUserById(u);
			message="�޸�idΪ"+u.getId()+"�ɹ�";
			model.addAttribute("message", message);
			if(u.getId()==user.getId()){
				session.setAttribute("user", u);
				session.setAttribute("userid",u.getId());
				session.setAttribute("username", u.getUsername());
				model.addAttribute("message", message);
				return "forward:selectAllUser.do";
			}else{
				return "forward:/user/selectAllUser.do";
			}
		}else{
			message="�㲻�ǹ���Ա�޷����д˲���";
			model.addAttribute("message", message);
			return "forward:/user/selectAllUser.do";
		}
	}
	
	
	//�ж��ֻ����Ƿ����
	@RequestMapping("checkTelephone")
	public @ResponseBody String checkTelephone(String telephone,HttpServletResponse response){
		User userTelephone=userService.checkTelephone(telephone);
		if(userTelephone==null){
			return "no";
		}else{
			return "yes";
		}
	}
	//ע��
	@RequestMapping("registerUser")
	public String registerUser(User u,Model model){
		model.addAttribute("error","zccg");
		userService.insertUser(u);
		return "index";
	}
}
