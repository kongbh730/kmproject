package controller.user;

import data.dto.UserDto;
import data.service.UserService;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import naver.cloud.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
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

    @GetMapping("/user/detail")
    public String detail(@RequestParam String email, Model model)
    {
        UserDto userdto=userService.getUserById(email);
        model.addAttribute("userdto", userdto);
        return "user/userdetail";
    }

    @ResponseBody
    @PostMapping("/user/update")
    public String updateData(
            @ModelAttribute UserDto userdto,
            @RequestParam("upload") MultipartFile upload,
            HttpServletRequest request
    )
    {
        //스토리지에 업로드하기
        String profile=storageService.uploadFile(bucketName, folderName, upload);
        userdto.setProfile(profile);//업로드된 UUID 파일명을 dto 에 저장

        //db 에 저장
        userService.updateUser(userdto);

        return "redirect:../movie/list";
    }

    @GetMapping("/user/updateform")
    public String updateForm(@RequestParam String email, Model model)
    {
        UserDto userdto =userService.getUserById(email);
        model.addAttribute("userdto", userdto);
        return "user/userupdate";
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
