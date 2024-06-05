package controller.user;

import data.dto.MovieDto;
import data.dto.UserDto;
import data.service.UserService;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import naver.cloud.NcpObjectStorageService;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;


@Controller
@RequiredArgsConstructor
public class UserUpdateFormController {

    @NonNull
    private UserService userService;
    private String bucketName="bitcamp-kbh-37";
    private String folderName="duoproject";

    @Autowired
    private NcpObjectStorageService storageService;

//    @ResponseBody
//    @PostMapping("/upload")
//    public Map<String, String> uploadPhoto(
//            @RequestParam("upload") MultipartFile upload,
//            @RequestParam String email,
//            HttpServletRequest request
//    )
//    {
//        String profile=storageService.uploadFile(bucketName, folderName, upload);
//
//        userService.updatePhoto(email,profile);
//
//        Map<String, String> map = new HashMap<>();
//        map.put("photoname",profile);
//
//        return map;
//    }

    //update
    @GetMapping("/user/detail")
    public String movieUpdateForm(
            Model model,
            HttpSession session
    )
    {
        String email=(String)session.getAttribute("loginid");

        UserDto userdto = userService.getUserById(email);
        model.addAttribute("userdto", userdto);

        return "user/userdetail";
    }

    @PostMapping("/user/update")
    public String updateMovie(
            @ModelAttribute UserDto userdto,
            @RequestParam("upload") MultipartFile upload,
            HttpServletRequest request
    )
    {
        System.out.println(upload);
        if(!upload.isEmpty())//새 이미지 파일 업로드된 경우
        {
            String uploadprofile = storageService.uploadFile(bucketName, folderName, upload);
            userdto.setProfile(uploadprofile);
            System.out.println(uploadprofile);
        }
        else//이미지 파일이 업로드 안된 경우, 기존 이미지 사용
        {
            String existprofile = userService.getUserById(userdto.getEmail()).getProfile();
            userdto.setProfile(existprofile);
        }
        userService.updateUser(userdto);

        return "redirect:../movie/list";
    }


    @GetMapping("/user/delete")
    public Map<String, String> delete(@RequestParam String email,@RequestParam String passwd)
    {
        Map<String, String> map=new HashMap<String, String>();
        boolean success=userService.deleteUser(email, passwd);
        if(success)
        {
            map.put("status","success");
        }
        else {
            map.put("status","fail");
        }

        return map;
    }

}
