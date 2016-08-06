package xechy.work.dao;

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

    List<Goods> searchByNames(String name);
}
