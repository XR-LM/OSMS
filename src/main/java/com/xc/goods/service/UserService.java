package com.xc.goods.service;
/**
 * 用户管理逻辑层
 * @author XR
 *
 */

import com.xc.goods.pojo.User;
import com.xc.goods.util.Result;

public interface UserService {
	/**
	 * 根据用户名，密码查询用户
	 * @param username
	 * @return
	 */
	Result findUserByUsername(String username,String password);

	/**
	 * 根据用户名查询用户信息
	 * @param username
	 * @return
	 */
	User findByLoginName(String username);
}
