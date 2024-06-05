package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
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
	/*
	@Update("""
			update review
			set movienum = #{movienum}, movietitle = #{movietitle}, rating = #{rating},
				email = #{email}, writeday = now(), content = #{content}
			where reviewnum = #{reviewnum}
			""")
	public void updateReview(ReviewDto reviewdto);
	*/
	
	//select: 해당영화 번호로 작성된 모든 리뷰
	@Select("""
			select * from review where movienum = #{movienum}
			""")
	public List<ReviewDto> getData(int movienum);
	
	//select : 리뷰 조회 : 프로필 선택시 해당 유저가 작성한 모든 리뷰 나열...
	/*
	// select: 해당 유저가 작성한 모든 리뷰 조회
	@Select("""
			select * from review where email = #{email}
			""")
	public List<ReviewDto> getReviewsByUser(String email); 
	 */
	
	//delete : 리뷰 삭제
	@Delete("""
			delete from review where reviewnum = #{reviewnum}
			""")
	public void deleteAnswer(int reviewnum);
}
