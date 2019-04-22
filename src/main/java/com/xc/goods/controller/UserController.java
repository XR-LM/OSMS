package com.xc.goods.controller;

import com.xc.goods.pojo.User;
import com.xc.goods.service.Impl.UserServiceImpl;
import com.xc.goods.service.UserService;
import com.xc.goods.util.Result;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.security.provider.MD5;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Iterator;
import java.util.Set;

/**
 * 用户控制层
 *
 * @author Administrator
 */
@Controller
public class UserController {

	@Autowired
	private UserService userService;

	/**
	 *
	 * 跳转到登录页面
	 * @return
	 */
	@RequestMapping("login")
	public String toLoginPage() {
		return "登陆";
	}
	
	@ResponseBody
	@RequestMapping("userlogin")
	public Result login(String name,String password,HttpServletRequest request) {
		//用户名为空直接返回
		if(name==null||name.isEmpty()) {
			return Result.build(400,"用户名或密码为空");
		}
		password= DigestUtils.md5DigestAsHex(password.getBytes());
		//从安全管理器中获取subject对象
		Subject currentUser = SecurityUtils.getSubject();
		UsernamePasswordToken upToken = new UsernamePasswordToken(name, password);
			upToken.setRememberMe(false);
			try {
				currentUser.login(upToken);
				User user = userService.findByLoginName(name);

				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				return  Result.ok(user);
			} catch (Exception ex) {
				return Result.build(400,"用户名或密码错误！");
			}
	}
	
	
}
