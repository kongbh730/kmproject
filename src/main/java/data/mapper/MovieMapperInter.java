package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import data.dto.MovieDto;

@Mapper
public interface MovieMapperInter {
	//insert : 영화 정보 추가
	@Insert("""
			insert into movie (title, director, actor, publishyear, totalreat, genre, youtubeURL)
			values (title, director, actor, publishyear, totalreat, genre, youtubeURL)
			""")//movienum 필요???
	public void insertMovie(MovieDto moviedto);
	
	//select : 영화 정보 조회 -> 상세페이지용
	@Select("""
			select * from movie where movienum = #{movienum}
			""")
	public MovieDto getMovieByNum(int movienum);//번호로 받기
	
	@Select("""
			select * from movie where title = #{title}
			""")
	public MovieDto getMovieBytitle(String title);//제목으로 받기
	
	//select : 전체 영화 조회 -> 메인화면용
	@Select("""
			select * from movie order by num
			""")
	public List<MovieDto> getAllMovie();//전체 반환
	
	//update : 영화 정보 수정
	@Update("""
			update movie set title = #{title}, director = #{director}, actor = #{actor},
		publishyear = #{publishyear}, genre = #{genre}, youtubeURL = #{youtubeURL} where movienum = #{movienum}
			""")
	public void updateMovie(MovieDto moviedto);
	
	//delete : 영화 정보 삭제
	@Delete("""
			delete from movie where movienum = #{movienum}
			""")
	public void deleteMovie(int movienum);
	
}