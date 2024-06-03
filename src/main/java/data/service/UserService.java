package data.service;

import data.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.mapper.UserMapperInter;

import java.util.HashMap;
import java.util.Map;

@Service
public class UserService {
	
	@Autowired
	private UserMapperInter userInter;
	
	public void insertUser(UserDto userdto)
	{
		userInter.insertUser(userdto);
	}

	public UserDto getUserByNum(int usernum)
	{
		return userInter.getUserByNum(usernum);
	}

	public void updateUser(UserDto userdto)
	{
		userInter.updateUser(userdto);
	}

	public boolean deleteUser(int usernum,String passwd)
	{
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("usernum", usernum);
		map.put("passwd", passwd);
		return userInter.deleteMember(map)==1?true:false;

	}

	public boolean isLoginCheck(String email,String pass)
	{
		return userInter.isLoginCheck(email,pass)==1?true:false;
	}
}
