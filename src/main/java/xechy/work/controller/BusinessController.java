package xechy.work.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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

/**
 * Created by Japa xie on 2016/8/5.
 */
@Controller
@RequestMapping("/business")
public class BusinessController extends BaseController<Business> {

    @Autowired
    private BusinessService businessService;

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private OrderService orderService;

    @RequestMapping("/login")
    public String login(@Valid Business business, HttpSession session){
        Business b = businessService.login(business);
        if(b == null){
            return REDIRECT_URL+"loginUI";
        }

        session.setAttribute("loginBusiness",b);
        return REDIRECT_URL+"listUI";
    }

    @RequestMapping("/saveBusiness")
    public String saveBusiness(@Valid Business business,RedirectAttributes redirectAttributes){
        try {
            business.setBdate(new Date());
            this.businessService.save(business);
        }catch (Exception e){
            e.printStackTrace();
        }
        redirectAttributes.addFlashAttribute("result","注册成功!");
        return TEMPLATE_PATH+"loginUI";
    }

    @RequestMapping("/show/{id}")
    public String show(@PathVariable Long id, Model model, HttpServletRequest request){
        Business loginBusiness = (Business) request.getSession().getAttribute("loginBusiness");
        model.addAttribute(businessService.show(id));
        return TEMPLATE_PATH+"showUI";
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
            out.print("已存在用户");
        }else {
            out.print("该用户名可用");
        }
    }


}
