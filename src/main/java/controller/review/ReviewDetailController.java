package controller.review;

import data.dto.MovieDto;
import data.service.MovieService;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class ReviewDetailController {

    @NonNull
    private MovieService movieService;

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
}
