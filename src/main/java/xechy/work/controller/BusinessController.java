package xechy.work.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import xechy.work.model.Business;
import xechy.work.service.BusinessService;
import xechy.work.service.GoodsService;
import xechy.work.service.OrderService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

/**
 * Created by Japa xie on 2016/8/5.
 */
@Controller
@RequestMapping(value = "/business")
public class BusinessController extends BaseController<Business> {

    @Autowired
    private BusinessService businessService;

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private OrderService orderService;

    @RequestMapping("/login")
    public String login(@Valid Business business, HttpSession session,RedirectAttributes redirectAttributes){
        Business b = businessService.login(business);
        if(b == null){
            redirectAttributes.addFlashAttribute("result","用户名或密码错误！");
            return REDIRECT_URL+"loginUI";
        }

        session.setAttribute("loginBusiness",b);
        return TEMPLATE_PATH+"listUI";
    }

    @RequestMapping("/saveBusiness")
    public String saveBusiness(@Valid Business business,RedirectAttributes redirectAttributes,
                               @RequestParam(value = "bPicture_1")MultipartFile picture){
        business.setBpassword("123456");
        try {
            business.setBdate(new Date());
            this.businessService.save(business,picture);
        }catch (Exception e){
            e.printStackTrace();
        }
        redirectAttributes.addFlashAttribute("result","注册成功，初始密码为123456！");
        return REDIRECT_URL+"loginUI";
    }

    @RequestMapping("/show/{id}")
    public String show(@PathVariable Long id, Model model, HttpServletRequest request){
        Business loginBusiness = (Business) request.getSession().getAttribute("loginBusiness");
        model.addAttribute("businessShow",businessService.show(id));
        return REDIRECT_URL+"showUI";
    }

    @RequestMapping("/loginUI")
    public String loginUI(HttpServletRequest request){
        Business u = (Business) request.getSession().getAttribute("loginBusiness");
        if (null == u ){
            return TEMPLATE_PATH+"loginUI";
        }
        return TEMPLATE_PATH+"listUI";
    }

    @RequestMapping("/checkName/{Name}")
    public void checkName(@PathVariable String Name, HttpServletResponse response) throws IOException {
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        Business b =  businessService.checkName(Name);
        if(b != null){
            out.print("存在该用户");
        }else {
            out.print("");
        }
    }

    @RequestMapping("/checkStoreName/{storeName}")
    public void checkStoreName(@PathVariable String storeName, HttpServletResponse response) throws IOException {
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        Business b =  businessService.checkStoreName(storeName);
        if(b != null){
            out.print("存在该商铺");
        }else {
            out.print("");
        }
    }

    @RequestMapping("/listUI")
    public String listUI(HttpServletRequest request){
        Business b = (Business) request.getSession().getAttribute("loginBusiness");
        if (b == null){
            return TEMPLATE_PATH+"loginUI";
        }
        return TEMPLATE_PATH+"listUI";
    }

    @RequestMapping("/listOrderUI")
    public String listOrderUI(HttpServletRequest request){
        Business b = (Business) request.getSession().getAttribute("loginBusiness");
        if (b == null){
            return TEMPLATE_PATH+"loginUI";
        }
        return TEMPLATE_PATH+"listOrderUI";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("loginBusiness");
        return TEMPLATE_PATH+"loginUI";
    }

    @RequestMapping("/searchByAddress/{baddress}")
    @ResponseBody
    public List<Business> searchByAddress(@PathVariable String baddress){
        List<Business> bs = businessService.searchByAddress(baddress);
        return bs;
    }


    @RequestMapping("/searchByAddressUI")
    public String searchByAddressUI(@RequestParam(value = "baddress") String baddress, HttpServletRequest request){
        request.setAttribute("baddress",baddress);
        return "WEB-INF/user/listUI";
    }

}
