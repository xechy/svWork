package xechy.work.service.impl;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import xechy.work.been.PageBean;
import xechy.work.dao.GoodsMapper;
import xechy.work.model.Goods;
import xechy.work.service.GoodsService;
import xechy.work.util.FileUploadUtil;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Japa xie on 2016/8/5.
 */
@Service
public class GoodsServiceImpl extends BaseServiceImpl<Goods> implements GoodsService {

    @Autowired
    private GoodsMapper goodsMapper;

    @Override
    public void deleteById(long id) {
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
        return  this.goodsMapper.searchsById(id);
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
    public List<Goods> searchByNames(String name) {
        return this.goodsMapper.searchByNames(name);
    }

    @Override
    public void addID(Goods goods) {

        this.goodsMapper.addID(goods);
    }

    @Override
    public Map dataTable(String searchText, int sEcho, PageBean pageBean) {
        Map<String, Object> parameterMap = new HashMap<String, Object>();
        if (searchText != null && !searchText.trim().isEmpty()) {
            searchText = "%" + searchText + "%";
            parameterMap.put("searchText", searchText);
        }
        if (pageBean.getSort() != null && !pageBean.getSort().trim().isEmpty()) {
            parameterMap.put("sort", pageBean.getSort());
            parameterMap.put("order", pageBean.getOrder());
        }
        parameterMap.put("pageOffset", pageBean.getPageOffset());
        parameterMap.put("size", pageBean.getSize());
        List<Goods> list = goodsMapper.searchByBid(parameterMap);
        int cout = goodsMapper.countAll(parameterMap);
        pageBean.init(cout, list);
        Map<String, Object> map = new HashedMap();
        map.put("sEcho", sEcho + 1);//不知道是什么,每次加一就好
        map.put("iTotalRecords", list.size());//当前总数据条数
        map.put("iTotalDisplayRecords", cout);//查询结果的总条数
        map.put("aaData", list);
        return map;
    }

}
