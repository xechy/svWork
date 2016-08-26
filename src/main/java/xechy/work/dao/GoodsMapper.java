package xechy.work.dao;

import org.apache.ibatis.annotations.Param;
import xechy.work.model.Goods;

import java.util.List;

/**
 * Created by Japa xie on 2016/8/5.
 */
public interface GoodsMapper {
    void deleteById(long id);

    void save(Goods goods);

    void update(Goods goods);

    Goods show(long id);

    List<Goods> searchByNames(@Param("gname") String gname);

    List<Goods> searchByBid(long id);

    void addID(Goods goods);

    List<Goods> searchsById(long id);

    List<Goods> searchByUId(long id);

    void deleteUId(long bid);

    Integer getProductsCount(Integer bid);

    List<Goods> selectProductsByPage(@Param(value = "bid")Integer bid,@Param(value="startPos")Integer startPos, @Param(value="pageSize")Integer pageSize);

    List<Goods> searchAll();
}
