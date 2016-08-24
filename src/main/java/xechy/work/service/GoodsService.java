package xechy.work.service;

import org.springframework.web.multipart.MultipartFile;
import xechy.work.model.Goods;
import xechy.work.util.PagedResult;

import java.util.List;

/**
 * Created by Japa xie on 2016/8/5.
 */
public interface GoodsService extends BaseService<Goods> {


    void save(Goods goods,MultipartFile filePath); //添加商品

    @Override
    void update(Goods goods);//更新商品

    @Override
    Goods show(long id);//展示商品

    @Override
    List<Goods> searchByNames(String gname);//查询商品

    @Override
    void deleteById(long id);//删除商品

    @Override
    List<Goods> searchAll();

    void addID(Goods goods);

    /**
     *
     * @author linbingwen
     * @since  2015年10月23日
     * @param gname 查询条件，可为空
     * @param pageNo 查询条件，可为空，默认取1
     * @param pageSize 查询条件，可为空，默认取10
     * @return
     */
    PagedResult<Goods> queryByPage(String gname, Integer pageNo, Integer pageSize);

}
