package com.xc.goods.service.Impl;


import com.xc.goods.mapper.UserMapper;
import com.xc.goods.pojo.User;
import com.xc.goods.pojo.UserExample;
import com.xc.goods.pojo.UserExample.Criteria;
import com.xc.goods.service.UserService;
import com.xc.goods.util.Result;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 用户服务层
 * @author XR
 *
 */
@Transactional
@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	
	
	@Override
	public Result findUserByUsername(String username,String password){
		//判断用户名密码是否为空
		if(StringUtils.isBlank(username)||StringUtils.isBlank(password)){
			return Result.build(400, "用户名或密码为空");
		}
		//创建example对象
		UserExample example = new UserExample();
		//创建离线查询对象
		Criteria createCriteria = example.createCriteria();
		//添加查询条件
		createCriteria.andLoginNameEqualTo(username);
		//根据用户名查询数据库
		List<User> list = userMapper.selectByExample(example);
		
		//判断查询结果是否为空
		if(list==null||list.size()==0)
			return Result.build(400, "用户名或密码错误");
		User user=list.get(0);
		//校验密码
		if (!user.getPassword().equals(password)){
			return Result.build(400, "用户名或密码错误");
		}
		
		return Result.ok(user);
	}

    @Override
    public User findByLoginName(String username) {
        UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andLoginNameEqualTo(username);
		List<User> users = userMapper.selectByExample(example);
		if(users!=null&&users.size()!=0){
			return users.get(0);
		}
		return null;
    }

}
