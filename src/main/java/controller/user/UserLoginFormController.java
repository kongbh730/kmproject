package controller.user;

import data.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class UserLoginFormController {

    @Autowired
    private UserService userService;

    @GetMapping("/user/signin")
    public String form()
    {
        return "user/userlogin";
    }

    @GetMapping("/user/login")
    @ResponseBody
    public Map<String, String> isLogin(
            @RequestParam(defaultValue = "no") String saveid,
            @RequestParam String loginemail,
            @RequestParam String pass,
            HttpSession session
    )
    {
        System.out.println("saveid="+saveid);
        Map<String, String> map = new HashMap<>();
        try {
            if (loginemail == null || pass == null) {
                throw new IllegalArgumentException("Email or password not provided");
            }
        //로그인 상태
        boolean loginStatus = userService.isLoginCheck(loginemail,pass);
        if(loginStatus)
        {
            //아이디와 비번이 맞은경우
            map.put("status", "success");
            //로그인 성공시 세션에 저장
            session.setAttribute("saveid",saveid.equals("no")?"no":"yes");
            session.setAttribute("loginok","yes");
            session.setAttribute("loginid",loginemail);
        }
        else
        {
            //아이디와 비번이 틀린경우
            map.put("status", "fail");
        }
        } catch (IllegalArgumentException e) {
            map.put("status", "fail");
            map.put("message", e.getMessage());
        }
        return map;
    }

    //로그아웃시 호출
    @ResponseBody
    @GetMapping("/user/logout")
    public void userLogout(HttpSession session)
    {
        session.removeAttribute("loginok");
    }
}
