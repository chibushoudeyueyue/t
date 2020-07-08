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
	@Resource//自动注入
	private UserService userService;
	//登录验证
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
	//查询所有用户
	@RequestMapping("selectAllUser")
	public String selectAllUser(Model model, HttpSession session){
		User user=(User)session.getAttribute("user");
		List<User> userList=userService.selectAllUser(user.getId());
		model.addAttribute("userList", userList);
		return "welcome";
	}
	
	//删除
	@RequestMapping("deleteUserById/{id}")
	public String deleteUserById(@PathVariable Integer id, HttpSession session,Model model){
		User u=(User) session.getAttribute("user");
		String message="";
		//判断是否为管理员
		if(u.getAdmin()==1){
			userService.deleteUserById(id);
			message="删除用户id为"+id+"成功";
			model.addAttribute("message", message);
			return "forward:/user/selectAllUser.do";
		}else{
			message="你不是管理员无法进行此操作";
			model.addAttribute("message", message);
			return "forward:/user/selectAllUser.do";
		}
		
		
	}
	//根据id查询用户转发到修改页面
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
			message="你不是管理员无法进行此操作";
			model.addAttribute("message", message);
			return "forward:/user/selectAllUser.do";
		}
		
	}
	
	//查询我的个人信息
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
	
	//修改用户
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
			message="修改id为"+u.getId()+"成功";
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
			message="你不是管理员无法进行此操作";
			model.addAttribute("message", message);
			return "forward:/user/selectAllUser.do";
		}
	}
	
	
	//判断手机号是否存在
	@RequestMapping("checkTelephone")
	public @ResponseBody String checkTelephone(String telephone,HttpServletResponse response){
		User userTelephone=userService.checkTelephone(telephone);
		if(userTelephone==null){
			return "no";
		}else{
			return "yes";
		}
	}
	//注册
	@RequestMapping("registerUser")
	public String registerUser(User u,Model model){
		model.addAttribute("error","zccg");
		userService.insertUser(u);
		return "index";
	}
}
