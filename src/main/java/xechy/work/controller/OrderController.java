package xechy.work.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import xechy.work.model.Business;
import xechy.work.model.Goods;
import xechy.work.model.Order;
import xechy.work.service.OrderService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Date;
import java.util.List;

/**
 * Created by Japa xie on 2016/8/5.
 */
@Controller
@RequestMapping(value = "/order")
public class OrderController extends BaseController<Order> {

    @Autowired
    private OrderService orderService;

    @RequestMapping("/updateOrderUI")
    public String updateOrderUI(HttpServletRequest request){
        Business b = (Business) request.getSession().getAttribute("loginBusiness");
        if (b == null){
            return REDIRECT_URL+"loginUI";
        }
        return REDIRECT_URL+"updateOrderUI";
    }

    @RequestMapping("/updateOrder")
    public String updateOrder(@Valid Order order, RedirectAttributes redirectAttributes){
        orderService.update(order);
        redirectAttributes.addFlashAttribute("msg","修改成功");
        return REDIRECT_URL+"listUI";
    }


    @RequestMapping("/searchOrder/{id}")
    public List<Goods> searchOrder(@PathVariable long id){
        List<Goods> goodses = (List<Goods>) orderService.searchById(id);
        return goodses;
    }

    @RequestMapping("/saveOrder/{id}")
    public String saveOrder(@Valid Order order,@PathVariable long id, HttpServletRequest request){
        order.setOdate(new Date());
        orderService.overBooking(order);
        request.setAttribute("msg","下单成功");
        return "WEB-INF/user/homeUI";
    }

    @RequestMapping("/deleteOrder/{id}")
    public String deleteOrder(@PathVariable long id){
        orderService.deleteById(id);
        return REDIRECT_URL+"listUI";
    }

    @RequestMapping("/searchOrderUI")
    public String searchOrderUI(){
        return REDIRECT_URL+"searchOrderUI";
    }

    @RequestMapping("/saveOrderUI")
    public String saveOrderUI(){
        return TEMPLATE_PATH+"saveOrderUI";
    }

}
