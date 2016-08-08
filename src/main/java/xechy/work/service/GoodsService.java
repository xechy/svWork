package xechy.work.service;

import xechy.work.model.Goods;

import java.util.List;

/**
 * Created by Japa xie on 2016/8/5.
 */
public interface GoodsService extends BaseService<Goods> {

    @Override
    void save(Goods goods); //添加商品

    @Override
    void update(Goods goods);//更新商品

    @Override
    Goods show(long id);//展示商品

    @Override
    List<Goods> searchByNames(String name);//查询商品

    @Override
    void deleteById(long id);//删除商品

    @Override
    List<Goods> searchAll();
}
