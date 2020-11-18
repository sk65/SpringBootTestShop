package com.example.controller;


import com.example.service.UserService;
import com.example.util.ImageValidator;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
public class AddFileController  {

    private final UserService userService;

    private final String UPLOADED__FOLDER =
            "C:\\Users\\мой господин\\Desktop\\JAVA]\\PROJECTS\\Shop\\src\\main\\resources\\static\\img\\";

    public AddFileController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("addFile")
    public String addFile(@AuthenticationPrincipal com.example.model.User user,
                          Model model) {
        model.addAttribute("user", user);
        return "/addFile";
    }

    @PostMapping("addFile")
    public String addFile(@RequestParam("file") MultipartFile file,
                          RedirectAttributes redirectAttributes,
                          @AuthenticationPrincipal User user,
                          Model model) throws IOException {

        com.example.model.User userFromDB = userService.getUser(user.getUsername()).get();

        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
            return "redirect:/addFile";
        }


        if (!ImageValidator.validate(file.getOriginalFilename())) {
            redirectAttributes.addFlashAttribute("message", "Please select an image");
            return "redirect:/addFile";
        }

        createFileIfDoesntExist();

        String resultFileName = createFileName(file.getOriginalFilename());
        File file1 = new File(UPLOADED__FOLDER + resultFileName);

        file.transferTo(file1);

        userFromDB.setUserAvatarFile(resultFileName);

        userService.addUser(userFromDB);
        return "redirect:/addFile";
    }

    private void createFileIfDoesntExist() {
        File uploadDir = new File(UPLOADED__FOLDER);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
    }

    private String createFileName(String fileName) {
        String uuidFile = UUID.randomUUID().toString();
        return uuidFile + "." + fileName;
    }

}
