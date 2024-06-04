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

	public UserDto getUserById(String email)
	{
		return userInter.getUserById(email);
	}

	public void updateUser(UserDto userdto)
	{
		userInter.updateUser(userdto);
	}

	public boolean deleteUser(String email,String passwd)
	{
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("email", email);
		map.put("passwd", passwd);
		return userInter.deleteMember(map)==1?true:false;

	}

	public void updatePhoto(String email,String profile)
	{
		Map<String, String> map=new HashMap<>();
		map.put("email",email);
		map.put("profile",profile);
		userInter.updatePhoto(map);
	}

	public boolean isLoginCheck(String email,String passwd)
	{
		return userInter.isLoginCheck(email,passwd)==1?true:false;
	}

	public int getIdCheckCount(String searchid)
	{
		return userInter.getIdCheckCount(searchid);
	}
}
