package xechy.work.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import xechy.work.model.*;
import xechy.work.service.*;

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

    @Autowired
    private GoodsService goodsService;

    @RequestMapping("/login")
    public String login(@Valid Admin admin, HttpSession session,RedirectAttributes redirectAttributes){
        Admin a = adminService.login(admin);
        if(a == null){
            redirectAttributes.addFlashAttribute("result","用户或密码错误");
            return REDIRECT_URL+"loginUI";
        }
        session.setAttribute("loginAdmin",a);
        return TEMPLATE_PATH+"tables-User";
    }

    @RequestMapping("/show/{aid}")
    public String show(@PathVariable long aid, Model model){
        model.addAttribute("showAdmin",adminService.show(aid));
        return TEMPLATE_PATH+"showUI";
    }

    @RequestMapping("/update")
    public String update(Admin admin,RedirectAttributes redirectAttributes){
        try {
            adminService.update(admin);
            redirectAttributes.addFlashAttribute("msg","success");
            return REDIRECT_URL+"tables-User";
        }catch (Exception e){
            e.printStackTrace();
        }
        redirectAttributes.addFlashAttribute("msg","error");
        return REDIRECT_URL+"tables-User";
    }

    @RequestMapping("/loginUI")
    public String loginUI(HttpServletRequest request){
        Admin a = (Admin) request.getSession().getAttribute("loginAdmin");
        if(a == null){
            return TEMPLATE_PATH+"loginUI";
        }
        return TEMPLATE_PATH+"tables-User";
    }


    @RequestMapping("/searchUser")
    @ResponseBody
    public List<User> searchUser(){
        List<User> users = userService.searchAll();
        return users;
    }

    @ResponseBody
    @RequestMapping("/searchBusiness")
    public List<Business> searchBusiness(){
        List<Business> businesses = businessService.searchAll();
        return businesses;
    }

    @ResponseBody
    @RequestMapping("/searchOrder")
    public List<Order> searchOrder(){
        List<Order> orders = orderService.searchAll();
        return  orders;
    }

    @RequestMapping("/searchGoods")
    @ResponseBody
    public List<Goods> searchGoods(){
        List<Goods> goodses = goodsService.searchAll();
        return goodses;
    }


    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("loginAdmin");
        return TEMPLATE_PATH+"loginUI";
    }

    @RequestMapping("/tables-BusinessUI")
    public String tBusinessUI(HttpServletRequest request){
        Admin a = (Admin) request.getSession().getAttribute("loginAdmin");
        if(a == null){
            return TEMPLATE_PATH+"loginUI";
        }
        return TEMPLATE_PATH+"tables-Business";
    }

    @RequestMapping("/tables-GoodsUI")
    public String tGoodsUI(HttpServletRequest request){
        Admin a = (Admin) request.getSession().getAttribute("loginAdmin");
        if(a == null){
            return TEMPLATE_PATH+"loginUI";
        }
        return TEMPLATE_PATH+"tables-Goods";
    }

    @RequestMapping("/tables-OrderUI")
    public String tOrderUI(HttpServletRequest request){
        Admin a = (Admin) request.getSession().getAttribute("loginAdmin");
        if(a == null){
            return TEMPLATE_PATH+"loginUI";
        }
        return TEMPLATE_PATH+"tables-Order";
    }

    @RequestMapping("/tables-UserUI")
    public String tUserUI(HttpServletRequest request){
        Admin a = (Admin) request.getSession().getAttribute("loginAdmin");
        if(a == null){
            return TEMPLATE_PATH+"loginUI";
        }
        return TEMPLATE_PATH+"tables-User";
    }

    @RequestMapping("/tables-UEditorUI")
    public String tUEditorUI(HttpServletRequest request){
        Admin a = (Admin) request.getSession().getAttribute("loginAdmin");
        if(a == null){
            return TEMPLATE_PATH+"loginUI";
        }
        return TEMPLATE_PATH+"tables-UEditor";
    }

}
