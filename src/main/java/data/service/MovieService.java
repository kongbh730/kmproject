package data.service;

import data.dto.MovieDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.mapper.MovieMapperInter;

import java.util.List;

@Service
public class MovieService {
	
	@Autowired
	private MovieMapperInter movieInter;

	public void insertMovie(MovieDto moviedto)
	{
		movieInter.insertMovie(moviedto);
	}

	public MovieDto getMovieByNum(int num)
	{
		return movieInter.getMovieByNum(num);
	}

	public MovieDto getMovieByTitle(String title)
	{
		return movieInter.getMovieByTitle(title);
	}

	public List<MovieDto> getAllMovies()
	{
		return movieInter.getAllMovies();
	}

	public void updateMovie(MovieDto moviedto)
	{
		movieInter.updateMovie(moviedto);
	}

	public void deleteMove(int num)
	{
		movieInter.deleteMovie(num);
	}
}
