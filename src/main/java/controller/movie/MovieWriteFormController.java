package controller.movie;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import data.dto.MovieDto;
import data.service.MovieService;
import naver.cloud.NcpObjectStorageService;

@Controller
public class MovieWriteFormController {
	@Autowired
	private MovieService movieService;
	
	//==========================================================================
	//NCP사용을 위해 추가된 것들!!!!
	private String bucketName = "bitcamp-kbh-37";
	private String folderName = "duoproject";
		
	@Autowired
	private NcpObjectStorageService storageService;
	//==========================================================================
	
	@GetMapping("/movie/writeform")
	public String movieWriteForm()	
	{
		return "movie/moviewriteform";
	}
	
	@PostMapping("/movie/insert")
	public String saveData(
			@ModelAttribute MovieDto moviedto,
			@RequestParam("movieposter") MultipartFile myfile,
			HttpServletRequest request
			)
	{
		String poster = storageService.uploadFile(bucketName, folderName, myfile);
		moviedto.setPoster(poster);
		
		movieService.insertMovie(moviedto);
		
		return "redirect:../movie/list";//추가
	}
}
