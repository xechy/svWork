package xechy.work.service.impl;


import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import xechy.work.dao.GoodsMapper;
import xechy.work.model.Goods;
import xechy.work.service.GoodsService;
import xechy.work.util.FileUploadUtil;
import xechy.work.util.PagedResult;
import xechy.work.util.BeanUtil;
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
    public List<Goods> searchByNames(String gname) {
        return this.goodsMapper.searchByNames(gname);
    }

    @Override
    public void addID(Goods goods) {
        this.goodsMapper.addID(goods);
    }

    @Override
    public PagedResult<Goods> queryByPage(String gname, Integer pageNo, Integer pageSize) {
        pageNo = pageNo == null?1:pageNo;
        pageSize = pageSize == null?10:pageSize;
        PageHelper.startPage(pageNo,pageSize);  //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
        return BeanUtil.toPagedResult(this.searchByNames(gname));
    }

}
