package controller.movie;

import data.dto.MovieDto;
import data.service.MovieService;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class MovieListController {

    @NonNull
    private MovieService movieService;

    @GetMapping("/movie/list")
    public String movieList(Model model)
    {
        List<MovieDto> list=movieService.getAllMovies();

        model.addAttribute("list", list);

        return "movie/movielist";
    }
}
