package xechy.work.service;

import org.springframework.web.multipart.MultipartFile;
import xechy.work.model.Goods;
import xechy.work.util.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

    void addID(Goods goods);

    Page<Goods> showProductsByPage(Integer bid,HttpServletRequest request, HttpServletResponse response);

}
