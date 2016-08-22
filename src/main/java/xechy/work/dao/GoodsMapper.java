package xechy.work.dao;

import xechy.work.model.Goods;

import java.util.List;
import java.util.Map;

/**
 * Created by Japa xie on 2016/8/5.
 */
public interface GoodsMapper {
    void deleteById(long id);

    void save(Goods goods);

    void update(Goods goods);

    Goods show(long id);

    List<Goods> searchByNames(String name);

    int countAll(Map<String, Object> parameterMap);

    List<Goods> searchByBid(Map<String, Object> parameterMap);

    void addID(Goods goods);

    List<Goods> searchsById(long id);

    List<Goods> searchByUId(long id);
}
