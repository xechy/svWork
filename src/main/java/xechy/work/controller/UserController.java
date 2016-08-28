package xechy.work.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import xechy.work.model.User;
import xechy.work.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

/**
 * Created by Japa xie on 2016/8/5.
 */
@Controller
@RequestMapping(value = "/user")
public class UserController extends BaseController<User> {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(@Valid User user, HttpSession session,RedirectAttributes redirectAttributes){
        User u = this.userService.login(user);
        if(u == null){
            redirectAttributes.addFlashAttribute("msg","账号或者密码错误！");
            return REDIRECT_URL+"homeUI";
        }
        redirectAttributes.addFlashAttribute("msg","登录成功！");
        session.setAttribute("loginUser",u);
        return REDIRECT_URL+"homeUI";
    }

    @RequestMapping(value = "/saveUser",method = RequestMethod.POST)
    public String saveUser(@Valid User user,RedirectAttributes redirectAttributes){
        try {
            user.setDate(new Date());
            this.userService.saveUser(user);
        }catch (Exception e){
            e.printStackTrace();
        }
        redirectAttributes.addFlashAttribute("msg","注册成功!");
        return REDIRECT_URL+"homeUI";
    }

    @RequestMapping("/show/{id}")
    public String show(@PathVariable Long id, Model model, HttpServletRequest request){
        //User loginUser = (User) request.getSession().getAttribute("loginUser");
        model.addAttribute("showUser",userService.showUser(id));
        return TEMPLATE_PATH+"showUI";
    }

    @RequestMapping("/loginUI")
    public String loginUI(HttpServletRequest request){
        User u = (User) request.getSession().getAttribute("loginUser");
        if (null == u ){
            return TEMPLATE_PATH+"loginUI";
        }
        return TEMPLATE_PATH+"listUI";
    }

    @RequestMapping("/listUI")
    public String listUI(){
        return TEMPLATE_PATH+"listUI";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session,RedirectAttributes redirectAttributes){
        redirectAttributes.addFlashAttribute("msg","成功注销！");
        session.removeAttribute("loginUser");
        return REDIRECT_URL+"homeUI";
    }

    @RequestMapping("/update")
    public String update(@Valid User user,RedirectAttributes redirectAttributes){
        userService.updateUser(user);
        redirectAttributes.addFlashAttribute("msg","修改成功");
        return REDIRECT_URL+"homeUI";
    }

    @RequestMapping("/checkName")
    public void checkName(String name,HttpServletResponse response) throws IOException {
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        User u = userService.checkName(name);
        if (u == null){
            out.print(true);
        }else {
            out.print(false);
        }
    }
    @RequestMapping("/checkPhone")
    public void checkPhone(String phone,HttpServletResponse response) throws IOException {
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        User u = userService.checkPhone(phone);
        if (u == null){
            out.print(true);
        }else {
            out.print(false);
        }
    }
    @RequestMapping("/checkEmail")
    public void checkEmail(String mail,HttpServletResponse response) throws IOException {
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        User u = userService.checkEmail(mail);
        if (u == null){
            out.print(true);
        }else {
            out.print(false);
        }
    }

    @RequestMapping("/registerUI")
    public String registerUI(){
        return TEMPLATE_PATH+"register";
    }
    @RequestMapping("/forgetUI")
    public String forgetUI(){
        return TEMPLATE_PATH+"forgetUI";
    }

    @RequestMapping("/homeUI")
    public String homeUI(HttpSession session){
        session.removeAttribute("searchB");
        return TEMPLATE_PATH+"homeUI";
    }

    @RequestMapping(value = "forget",method = RequestMethod.POST)
    public String forget(@Valid User user,RedirectAttributes redirectAttributes,HttpServletRequest request){
        User u = userService.receivePassword(user);
        if (u == null){
            redirectAttributes.addFlashAttribute("msg_receive","输入的信息有误，请重新输入！");
            return REDIRECT_URL+"forgetUI";
        }
        request.setAttribute("loginUser",u);
        return TEMPLATE_PATH+"updatePasswordUI";
    }

    @RequestMapping("updatePassword")
    public String updatePassword(@Valid User user){
        userService.updatePassword(user);
        return TEMPLATE_PATH+"homeUI";
    }

    @RequestMapping("/updatePasswordUI")
    public String updatePasswordUI(){
        return TEMPLATE_PATH+"updatePasswordUI";
    }

    @RequestMapping("showUI")
    public String showUI(){
        return TEMPLATE_PATH+"showUI";
    }

}
