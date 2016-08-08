package xechy.work.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import xechy.work.model.Admin;
import xechy.work.model.User;
import xechy.work.service.AdminService;
import xechy.work.service.BusinessService;
import xechy.work.service.OrderService;
import xechy.work.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

/**
 * Created by Japa xie on 2016/8/5.
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController extends BaseController<Admin> {

    @Autowired
    private AdminService adminService;

    @Autowired
    private UserService userService;

    @Autowired
    private BusinessService businessService;

    @Autowired
    private OrderService orderService;

    @RequestMapping("/login")
    public String login(@Valid Admin admin, HttpSession session){
        Admin a = adminService.login(admin);
        session.setAttribute("loginAdmin",a);
        return TEMPLATE_PATH+"listUI";
    }

    @RequestMapping("/update")
    public String update(Admin admin,RedirectAttributes redirectAttributes){
        try {
            adminService.update(admin);
            redirectAttributes.addFlashAttribute("msg","success");
            return TEMPLATE_PATH+"listUI";
        }catch (Exception e){
            e.printStackTrace();
        }
        redirectAttributes.addFlashAttribute("msg","error");
        return TEMPLATE_PATH+"listUI";
    }

    @RequestMapping("/updatePassword")
    public String updatePassword(Admin admin,RedirectAttributes redirectAttributes){
        try {
            adminService.updatePassword(admin);
            redirectAttributes.addFlashAttribute("msg","success");
            return TEMPLATE_PATH+"listUI";
        }catch (Exception e){
            e.printStackTrace();
        }
        redirectAttributes.addFlashAttribute("msg","error");
        return TEMPLATE_PATH+"listUI";
    }

    @RequestMapping("/loginUI")
    public String loginUI(HttpServletRequest request){
        Admin a = (Admin) request.getSession().getAttribute("loginAdmin");
        if(a == null){
            return TEMPLATE_PATH+"loginUI";
        }
        return TEMPLATE_PATH+"listUI";
    }

    @RequestMapping("/updateUI")
    public String updateUI(HttpServletRequest request){
        Admin a = (Admin) request.getSession().getAttribute("loginAdmin");
        if(a == null){
            return TEMPLATE_PATH+"loginUI";
        }
        return TEMPLATE_PATH+"updateUI";
    }

    @RequestMapping("/updatePssswordUI")
    public String updatePasswordUI(HttpServletRequest request){
        Admin a = (Admin) request.getSession().getAttribute("loginAdmin");
        if(a == null){
            return TEMPLATE_PATH+"loginUI";
        }
        return TEMPLATE_PATH+"updatePasswordUI";
    }

    @RequestMapping("/searchUser")
    public String searchUser(){
        List<User> users = userService.searchAll();
        for (User u : users){
            users.add(u);
        }
        return null;
    }


}
