package controller.user;

import data.dto.UserDto;
import data.mapper.UserMapperInter;
import naver.cloud.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
public class UserLoginFormController {

    @Autowired
    private UserMapperInter userMapperInter;

    @GetMapping("/user/login")
    public String form()
    {
        return "user/userlogin";
    }
}
