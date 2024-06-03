package controller.movie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import data.service.MovieService;
import naver.cloud.NcpObjectStorageService;

@Controller
public class MovieWriteFormController {
	@Autowired
	private MovieService movieService;
	
	//==========================================================================
	//NCP사용을 위해 추가된 것들!!!!
	private String bucketName = "bitcamp-bucket-56";
	private String folderName = "photocommon";
		
	@Autowired
	private NcpObjectStorageService storageService;
	//==========================================================================
	
	@GetMapping("/movie/writeform")
	public String movieWriteForm()
	{
		return "movie/moviewriteform";
	}
	
	//@PostMapping("/movie/")
		
}
