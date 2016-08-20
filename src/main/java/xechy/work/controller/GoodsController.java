package xechy.work.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import xechy.work.been.PageBean;
import xechy.work.model.Business;
import xechy.work.model.Goods;
import xechy.work.model.User;
import xechy.work.service.GoodsService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Japa xie on 2016/8/5.
 */
@Controller
@RequestMapping(value = "/goods")
public class GoodsController extends BaseController<Goods> {

    @Autowired
    private GoodsService goodsService;

    @RequestMapping("/addGoods")
    public String addGoods(@Valid Goods goods,@RequestParam(value = "picture_1")MultipartFile picture,
                           RedirectAttributes redirectAttributes){
        //redirectAttributes.addFlashAttribute("msg","添加成功");
        goods.setGdate(new Date());
        goodsService.save(goods,picture);
        return TEMPLATE_PATH+"listUI";
    }

    @RequestMapping("/updateGoods")
    public String updateGoods(@Valid Goods goods,RedirectAttributes redirectAttributes){
        goodsService.update(goods);
        redirectAttributes.addFlashAttribute("msg","修改成功");
        return REDIRECT_URL+"listUI";
    }

    @RequestMapping("/addGoodsUI")
    public String addGoodsUI(HttpServletRequest request){
        Business b = (Business) request.getSession().getAttribute("loginBusiness");
        if (b == null){
            return "/WEB-INF/business/loginUI";
        }
        return TEMPLATE_PATH+"addGoodsUI";
    }

    @RequestMapping("/updateGoodsUI")
    public String updateGoodsUI(HttpServletRequest request){
        Business b = (Business) request.getSession().getAttribute("loginBusiness");
        if (b == null){
            return "/WEB-INF/business/loginUI";
        }
        return TEMPLATE_PATH+"updateGoodsUI";
    }

    @RequestMapping("/searchGoods/{bid}")
    public List<Goods> searchGoods(@PathVariable long bid){
        List<Goods> goodses = (List<Goods>) goodsService.searchById(bid);
        return goodses;
    }

    @RequestMapping("/searchGoodsUI/{bid}")
    public String searchGoodsUI(@PathVariable long bid,HttpServletRequest request){
        request.setAttribute("searchBid",bid);
        return TEMPLATE_PATH+"searchGoodsUI";
    }

    @RequestMapping("/deleteGoods/{gid}")
    public String deleteGoods(@PathVariable long gid){
        goodsService.deleteById(gid);
        return REDIRECT_URL+"searchGoodsUI";
    }

    @RequestMapping("/dataTable")
    @ResponseBody
    public Map dataTable(String searchText, int sEcho, PageBean pageBean) {
        return goodsService.dataTable(searchText, sEcho, pageBean);
    }

    @RequestMapping("/addID")
    public String addID(@Valid Goods goods,HttpServletRequest request,RedirectAttributes redirectAttributes){
        User u = (User) request.getAttribute("loginUser");
        goods.setId(u.getId());
        goodsService.addID(goods);
        redirectAttributes.addFlashAttribute("addIDMsg","添加购物车成功");
        return REDIRECT_URL+"searchGoodsUI";
    }

}
