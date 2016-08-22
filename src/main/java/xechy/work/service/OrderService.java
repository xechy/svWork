package xechy.work.service;

import xechy.work.model.Goods;
import xechy.work.model.Order;

/**
 * Created by Japa xie on 2016/8/5.
 */
public interface OrderService extends BaseService<Order> {

    @Override
    Order show(long id); //显示订单状态

    void overBooking(Order order); //下单

    void updateBooking(Goods goods);//更新外卖状态信息

    @Override
    Order searchById(long id); //查询外卖

    void deleteBooking(long id); //删除订单

    @Override
    void deleteById(long id);

    void addToCar(long gid);
}
