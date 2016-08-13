package xechy.work.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import xechy.work.model.Business;
import xechy.work.model.Goods;
import xechy.work.service.GoodsService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

/**
 * Created by Japa xie on 2016/8/5.
 */
@Controller
public class GoodsController extends BaseController<Goods> {

    @Autowired
    private GoodsService goodsService;

    @RequestMapping("addGoods")
    public String addGoods(@Valid Goods goods, RedirectAttributes redirectAttributes){
        goodsService.save(goods);
        redirectAttributes.addFlashAttribute("msg","添加成功");
        return TEMPLATE_PATH+"listUI";
    }

    @RequestMapping("updateGoods")
    public String updateGoods(@Valid Goods goods,RedirectAttributes redirectAttributes){
        goodsService.update(goods);
        redirectAttributes.addFlashAttribute("msg","修改成功");
        return TEMPLATE_PATH+"listUI";
    }

    @RequestMapping("addGoodsUI")
    public String addGoodsUI(HttpServletRequest request){
        Business b = (Business) request.getSession().getAttribute("loginBusiness");
        if (b == null){
            return "business/loginUI";
        }
        return TEMPLATE_PATH+"addGoodsUI";
    }

    @RequestMapping("updateGoodsUI")
    public String updateGoodsUI(HttpServletRequest request){
        Business b = (Business) request.getSession().getAttribute("loginBusiness");
        if (b == null){
            return "business/loginUI";
        }
        return TEMPLATE_PATH+"updateGoodsUI";
    }

    @RequestMapping("searchGoods/{bid}")
    public List<Goods> searchGoods(@PathVariable long bid){
        List<Goods> goodses = (List<Goods>) goodsService.searchById(bid);
        return goodses;
    }

    @RequestMapping("searchGoodsUI")
    public String searchGoodsUI(HttpServletRequest request){
        return TEMPLATE_PATH+"searchGoodsUI";
    }

    @RequestMapping("deleteGoods/{gid}")
    public String deleteGoods(@PathVariable long gid){
        goodsService.deleteById(gid);
        return TEMPLATE_PATH+"searchGoodsUI";
    }
}
