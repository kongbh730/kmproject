package controller.user;

import data.dto.UserDto;
import data.mapper.UserMapperInter;
import data.service.UserService;
import naver.cloud.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
public class UserRegistFormController {

    @Autowired
    private UserService userService;

    private String bucketName="bitcamp-kbh-37";
    private String folderName="duoproject";

    @Autowired
    private NcpObjectStorageService storageService;

    @GetMapping("/user/regist")
    public String form()
    {
        return "user/userregist";
    }

    @ResponseBody  //json 으로 반환
    @GetMapping("/user/idcheck")
    public Map<String, Integer> getIdCheck(
            @RequestParam String searchid)
    {
        Map<String, Integer> map=new HashMap<>();
        int count=userService.getIdCheckCount(searchid);
        map.put("count", count);
        return map;
    }

    @PostMapping("/user/insert")
    public String saveData(
            @ModelAttribute UserDto userdto,
            @RequestParam("upload") MultipartFile upload,
            HttpServletRequest request
    )
    {
        //스토리지에 업로드하기
        String profile=storageService.uploadFile(bucketName, folderName, upload);
        userdto.setProfile(profile);//업로드된 UUID 파일명을 dto 에 저장

        //db 에 저장
        userService.insertUser(userdto);

        return "redirect:../movie/list";
    }

}
