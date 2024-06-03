package data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.mapper.MovieMapperInter;

@Service
public class MovieService {
	
	@Autowired
	private MovieMapperInter movieInter;
}
