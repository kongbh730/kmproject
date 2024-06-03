package data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.mapper.ReviewMapperInter;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewMapperInter reviewInter;
}
