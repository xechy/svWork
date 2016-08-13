package xechy.work.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import xechy.work.model.User;
import xechy.work.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Date;

/**
 * Created by Japa xie on 2016/8/5.
 */
@Controller
@RequestMapping(value = "/user")
public class UserController extends BaseController<User> {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(@Valid User user, HttpSession session,RedirectAttributes redirectAttributes){
        User u = this.userService.login(user);
        if(u == null){
            redirectAttributes.addFlashAttribute("msg","账号或者密码错误！");
            return TEMPLATE_PATH+"loginUI";
        }
        session.setAttribute("loginUser",u);
        return TEMPLATE_PATH+"listUI";
    }

    @RequestMapping("/saveUser")
    public String saveUser(@Valid User user,RedirectAttributes redirectAttributes){
        try {
            user.setDate(new Date());
            this.userService.saveUser(user);
        }catch (Exception e){
            e.printStackTrace();
        }
        redirectAttributes.addFlashAttribute("result","注册成功!");
        return TEMPLATE_PATH+"loginUI";
    }

    @RequestMapping("/show/{id}")
    public String show(@PathVariable Long id, Model model, HttpServletRequest request){
        User loginUser = (User) request.getSession().getAttribute("loginUser");
        model.addAttribute(userService.showUser(id));
        return "show";
    }

    @RequestMapping("/loginUI")
    public String loginUI(HttpServletRequest request){
        User u = (User) request.getSession().getAttribute("loginUser");
        if (null == u ){
            return TEMPLATE_PATH+"loginUI";
        }
        return TEMPLATE_PATH+"listUI";
    }
}
