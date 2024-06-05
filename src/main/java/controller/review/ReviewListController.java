package controller.review;

import org.springframework.stereotype.Controller;

import data.service.ReviewService;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ReviewListController {

    @NonNull
    private ReviewService reviewService;

}
