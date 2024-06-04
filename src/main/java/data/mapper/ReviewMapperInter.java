package data.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import data.dto.ReviewDto;

@Mapper
public interface ReviewMapperInter {
	//insert : 리뷰 추가
	@Insert("""
			insert into review (movienum, movietitle, rating, email, writeday, content)
			values (#{movienum}, #{movietitle}, #{rating}, #{email}, now(), #{content})
			""")
	public void insertReview(ReviewDto reviewdto);
	
	//update : 리뷰 수정
	//@Update()
	
	//select : 리뷰 조회 : 프로필 선택시 해당 유저가 작성한 모든 리뷰 나열...
	//만들 시간이 됨?
	
	//delete : 리뷰 삭제
	//@Delete()
	@Delete("""
			delete from review where reviewnum = #{reviewnum}
			""")
	public void deleteAnswer(int reviewnum);
}
