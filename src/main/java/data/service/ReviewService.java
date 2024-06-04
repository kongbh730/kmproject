package data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.ReviewDto;
import data.mapper.ReviewMapperInter;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewMapperInter reviewMapperInter;
	
	public void insertReview(ReviewDto reviewdto)
	{
		reviewMapperInter.insertReview(reviewdto);
	}
	
	public List<ReviewDto> getReviewsByMovieNum(int movienum) 
	{
        return reviewMapperInter.getData(movienum);
    }
}
