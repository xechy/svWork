package xechy.work.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import xechy.work.model.Order;
import xechy.work.service.OrderService;
import xechy.work.util.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

/**
 * Created by Japa xie on 2016/8/5.
 */
@Controller
@RequestMapping(value = "/order")
public class OrderController extends BaseController<Order> {

    @Autowired
    private OrderService orderService;

    @RequestMapping("/updateOrder")
    public String updateOrder(@Valid Order order, RedirectAttributes redirectAttributes){
        orderService.update(order);
        redirectAttributes.addFlashAttribute("msg","修改成功");
        return REDIRECT_URL+"listUI";
    }


    @RequestMapping("/saveOrder/{id}")
    public String saveOrder(@Valid Order order,@PathVariable long id, HttpServletRequest request){
        order.setId(id);
        orderService.overBooking(order);
        request.setAttribute("msg","下单成功");
        return "WEB-INF/user/homeUI";
    }

    @RequestMapping("/deleteOrder/{id}")
    public String deleteOrder(@PathVariable long id){
        orderService.deleteById(id);
        return REDIRECT_URL+"listUI";
    }

    @RequestMapping("/saveOrderUI")
    public String saveOrderUI(){
        return TEMPLATE_PATH+"saveOrderUI";
    }


    @RequestMapping("/searchOrderUI")
    public String searchOrderUI(){
        return TEMPLATE_PATH+"searchOrderUI";
    }

    @RequestMapping("/searchOrder/{id}")
    public String searchOrder(@PathVariable Integer id, HttpServletRequest request, HttpServletResponse response){
        Page<Order> pageList = null;

        pageList  = orderService.showOrderInUser(id,request, response);

        request.setAttribute("pageList", pageList);

        request.setAttribute("url",  id);

        return TEMPLATE_PATH+"/searchOrderUI";
    }

}
