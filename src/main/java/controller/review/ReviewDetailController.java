package controller.review;

import data.dto.MovieDto;
import data.dto.ReviewDto;
import data.service.MovieService;
import data.service.ReviewService;
import data.service.UserService;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import naver.cloud.NcpObjectStorageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
    
    @NonNull
    private UserService userService;
    
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

    // moviedto 읽기
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
    
    //저장
	@PostMapping("/review/reviewinsert")
	public String saveData(
			@ModelAttribute ReviewDto reviewdto,
			@RequestParam int movienum
			)
	{
		reviewService.insertReview(reviewdto);
		
		return "redirect:../review/detail?movienum=" + movienum;
	}
	
	//해당 movienum 영화의 리뷰만 가져오기
	@GetMapping("/movie/detail")
    public String getMovieDetail(@RequestParam("movienum") int movienum, Model model) {
        List<ReviewDto> reviews = reviewService.getReviewsByMovieNum(movienum);
        model.addAttribute("reviews", reviews);
        return "detail";
    }
}
