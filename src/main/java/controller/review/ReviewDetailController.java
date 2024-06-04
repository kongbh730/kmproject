package controller.review;

import data.dto.MovieDto;
import data.dto.ReviewDto;
import data.service.MovieService;
import data.service.ReviewService;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import naver.cloud.NcpObjectStorageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequiredArgsConstructor
public class ReviewDetailController {

    @NonNull
    private MovieService movieService;
    
    @Autowired
    private ReviewService reviewService;
    
    /*
    //==========================================================================
  	//NCP사용을 위해 추가된 것들!!!!
  	private String bucketName = "bitcamp-kbh-37";
  	private String folderName = "duoproject";
  		
  	@Autowired
  	private NcpObjectStorageService storageService;
  	//==========================================================================
  	 */

    @GetMapping("/review/detail")
    public String reviewDetail(
            @RequestParam int movienum,
            Model model
    )
    {
        MovieDto moviedto = movieService.getData(movienum);
        model.addAttribute("moviedto", moviedto);

        return "review/detail";
    }
    
	@PostMapping("/review/reviewinsert")
	public String saveData(
			@ModelAttribute ReviewDto reviewdto,
			@RequestParam int movienum
			)
	{
		reviewService.insertReview(reviewdto);
		
		return "redirect:../review/detail?movienum=" + movienum;
	}
}
