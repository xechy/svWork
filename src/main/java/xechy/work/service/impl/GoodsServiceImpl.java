package xechy.work.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xechy.work.dao.GoodsMapper;
import xechy.work.model.Goods;
import xechy.work.service.GoodsService;

import java.util.List;

/**
 * Created by Japa xie on 2016/8/5.
 */
@Service
public class GoodsServiceImpl extends BaseServiceImpl<Goods> implements GoodsService {

    @Autowired
    private GoodsMapper GoodsMapper;

    @Override
    public void deleteById(long id) {
        this.GoodsMapper.deleteById(id);
    }

    @Override
    public void save(Goods goods) {
        this.GoodsMapper.save(goods);
    }

    @Override
    public void update(Goods goods) {
        this.GoodsMapper.update(goods);
    }

    @Override
    public Goods show(long id) {
        return this.GoodsMapper.show(id);
    }

    @Override
    public List<Goods> searchByNames(String name) {
        return this.GoodsMapper.searchByNames(name);
    }
}
