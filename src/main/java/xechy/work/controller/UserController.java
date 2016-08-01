package xechy.work.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import xechy.work.model.User;
import xechy.work.service.UserService;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Date;

/**
 * Created by Japa xie on 2016/8/2.
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(@Valid User user, HttpSession session, Model model){
        User u = this.userService.login(user);
        session.setAttribute("loginUser",u);
        return "login";
    }

    @RequestMapping("/saveUser")
    public String saveUser(@Valid User user){
        try {
            user.setDate(new Date());
            this.userService.saveUser(user);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "saveUser";
    }

}
