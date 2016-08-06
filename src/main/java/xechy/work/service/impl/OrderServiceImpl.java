package xechy.work.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xechy.work.dao.OrderMapper;
import xechy.work.model.Goods;
import xechy.work.model.Order;
import xechy.work.service.OrderService;

/**
 * Created by Japa xie on 2016/8/5.
 */

@Service
public class OrderServiceImpl extends BaseServiceImpl<Order> implements OrderService{

    @Autowired
    private OrderMapper OrderMapper;

    @Override
    public void deleteBooking(long id) {
        this.OrderMapper.deleteBooking(id);
    }

    @Override
    public Order show(long id) {
        return this.OrderMapper.show(id);
    }

    @Override
    public void overBooking(Goods goods) {
        this.OrderMapper.overBooking(goods);
    }

    @Override
    public void updateBooking(Goods goods) {
        this.OrderMapper.updateBooking(goods);
    }

    @Override
    public Order searchById(long id) {
        return this.OrderMapper.searchById(id);
    }
}
