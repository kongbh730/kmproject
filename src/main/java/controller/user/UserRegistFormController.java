package controller.user;

import data.mapper.UserMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserRegistFormController {
    @Autowired
    private UserMapperInter userMapperInter;

    @GetMapping("/user/regist")
    public String form()
    {
        return "user/userregist";
    }
}
