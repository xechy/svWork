package xechy.work.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import xechy.work.dao.GoodsMapper;
import xechy.work.model.Goods;
import xechy.work.service.GoodsService;
import xechy.work.util.FileUploadUtil;
import xechy.work.util.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Japa xie on 2016/8/5.
 */
@Service
public class GoodsServiceImpl extends BaseServiceImpl<Goods> implements GoodsService {

    @Autowired
    private GoodsMapper goodsMapper;

    @Override
    public void deleteById(long id) {
        Goods goods =  goodsMapper.searchByOId(id);
        FileUploadUtil.deleteGoodsPicture(goods.getPicture());
        this.goodsMapper.deleteById(id);
    }

    @Override
    public void save(Goods goods, MultipartFile filePath) {
        FileUploadUtil.uploadGoodstPicture(filePath, goods);
        this.goodsMapper.save(goods);
    }

    @Override
    public List<Goods> searchByUId(long id) {
        return this.goodsMapper.searchByUId(id);
    }

    @Override
    public List<Goods> searchsById(long id) {
        return this.goodsMapper.searchsById(id);
    }

    @Override
    public void update(Goods goods) {
        this.goodsMapper.update(goods);
    }

    @Override
    public Goods show(long id) {
        return this.goodsMapper.show(id);
    }

    @Override
    public List<Goods> searchByNames(String gname) {
        return this.goodsMapper.searchByNames(gname);
    }

    @Override
    public void addID(Goods goods) {
        this.goodsMapper.addID(goods);
    }

    @Override
    public Page<Goods> showProductsByPage(Integer bid, HttpServletRequest request, HttpServletResponse response) {
        String pageNow = request.getParameter("pageNow");

        Page<Goods> page = null;

        List<Goods> goods = new ArrayList<Goods>();

        int totalCount = goodsMapper.getProductsCount(bid);

        if (pageNow != null) {
            page = new Page(totalCount, Integer.parseInt(pageNow));
            goods = this.goodsMapper.selectProductsByPage(bid, page.getStartPos(), page.getPageSize());
        } else {
            page = new Page(totalCount, 1);
            goods = this.goodsMapper.selectProductsByPage(bid, page.getStartPos(), page.getPageSize());
        }

        request.setAttribute("goods", goods);
        request.setAttribute("page", page);

        page.setRecordList(goods);

        return page;
    }

    @Override
    public List<Goods> searchAll() {
        return this.goodsMapper.searchAll();
    }
}
