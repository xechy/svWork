package xechy.work.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import xechy.work.model.Goods;
import xechy.work.service.GoodsService;
import xechy.work.util.PagedResult;

/**
 * Created by Japa xie on 2016/8/23.
 */

@Controller
@RequestMapping(value = "/test")
public class Test_Pagehelper {

    @Autowired
    private GoodsService goodsService;
    Logger logger = Logger.getLogger(Test_Pagehelper.class);

    @RequestMapping("/test")
    public void Test(){
        PagedResult<Goods> pagedResult = goodsService.queryByPage(null,1,10);
        logger.debug("查找结果" +pagedResult);
    }

}
