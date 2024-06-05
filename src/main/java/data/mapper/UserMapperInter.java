package data.mapper;

import data.dto.MovieDto;
import org.apache.ibatis.annotations.*;

import data.dto.UserDto;

import java.util.Map;

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
			select * from user where email=#{email}
			""")
	public UserDto getUserById(String email);

	@Select("select count(*) from user where email=#{searchid}")
	public int getIdCheckCount(String searchid);
	
	//update : 회원정보 수정
	/*
	 * 이메일, 회원번호는 그대로, 나머지 전부 수정
	 */
	@Update("""
			update user set passwd=#{passwd}, profile=#{profile}, birthday=#{birthday}, gender=#{gender} where email=#{email}
			""")
	public void updateUser(UserDto userdto);

	//delete : 회원 탈퇴 email과 passwd가 맞았을 시에는
	@Delete("delete from user where email=#{email} and passwd=#{passwd}")
	public int deleteMember(Map<String, Object> map);

	//select : 로그인 성공 email과 passwd가 맞았을 시에는
	@Select("""
            select count(*) from user where email=#{email} and passwd=#{passwd}
            """)
	public int isLoginCheck(String email, String passwd);
	
}
