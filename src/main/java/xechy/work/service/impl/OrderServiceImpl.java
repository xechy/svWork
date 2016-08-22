package xechy.work.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xechy.work.dao.OrderMapper;
import xechy.work.model.Goods;
import xechy.work.model.Order;
import xechy.work.service.OrderService;

import java.util.List;

/**
 * Created by Japa xie on 2016/8/5.
 */

@Service
public class OrderServiceImpl extends BaseServiceImpl<Order> implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public void deleteBooking(long id) {
        this.orderMapper.deleteBooking(id);
    }

    @Override
    public Order show(long id) {
        return this.orderMapper.show(id);
    }


    @Override
    public void overBooking(Order order) {
        this.orderMapper.overBooking(order);
    }

    @Override
    public void updateBooking(Goods goods) {
        this.orderMapper.updateBooking(goods);
    }

    @Override
    public Order searchById(long id) {
        return this.orderMapper.searchById(id);
    }

    @Override
    public List<Order> searchAll() {
        return this.orderMapper.searchAll();
    }

    @Override
    public void deleteById(long id) {
        this.orderMapper.deleteById(id);
    }

    @Override
    public void addToCar(long gid) {
        this.orderMapper.addToCar(gid);
    }
}
