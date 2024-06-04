package controller.movie;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import data.dto.MovieDto;
import data.service.MovieService;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import naver.cloud.NcpObjectStorageService;

@Controller
@RequiredArgsConstructor
//@RequestMapping("/movie")
public class MovieUpdateFormController {

	@NonNull
	private MovieService movieService;

	//==========================================================================
	//NCP사용을 위해 추가된 것들!!!!
	private String bucketName = "bitcamp-kbh-37";
	private String folderName = "duoproject";

	@Autowired
	private NcpObjectStorageService storageService;
	//==========================================================================

	//update
	@GetMapping("/movie/updateform")
	public String movieUpdateForm(
			@RequestParam int movienum,
			Model model
			)
	{
		MovieDto moviedto = movieService.getData(movienum);
		model.addAttribute("moviedto", moviedto);
		
		return "movie/movieupdateform";
	}
	
	@PostMapping("/movie/updatemovie")
	public String updateMovie(
			@ModelAttribute MovieDto moviedto,
			@RequestParam("movieposter") MultipartFile upload,
			HttpServletRequest request
			)
	{
		String uploadphoto = storageService.uploadFile(bucketName, folderName, upload);
		
		moviedto.setPoster(uploadphoto);
		movieService.updateMovie(moviedto);
		
		return "redirect:../movie/list";
	}
	
	//delete
	@GetMapping("/movie/deletemovie")
	public String delete(
			@RequestParam int movienum
			)
	{
		movieService.deleteMovie(movienum);
		
		return "redirect:../movie/list";
	}
}
