package data.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import data.dto.UserDto;

@Mapper
public interface UserMapperInter {
	//insert : 회원가입
	@Insert("""
			insert into user (email, passwd, profile, birthday, gender)
			values (#{email}, #{passwd}, #{profile}, #{birthday}, #{gender})
			""")
	public void insertUser(UserDto userdto);
	
	//select : 전체 회원 조회가 필요한가X -> 내 정보만 확인하기?
	@Select("""
			select * from user where usernum = #{usernum}
			""")
	public UserDto getUserByNum(int usernum);
	
	
	//update : 회원정보 수정
	/*
	 * 이메일, 회원번호는 그대로, 나머지 전부 수정
	 */
	@Update("""
			update user set passwd
			""")
	public void updateUser(int usernum);

	
	//delete : 회원 탈퇴 -> 수정페이지에서 탈퇴
	
}
