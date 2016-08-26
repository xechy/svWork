package xechy.work.service;

import xechy.work.model.Order;
import xechy.work.util.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by Japa xie on 2016/8/5.
 */
public interface OrderService extends BaseService<Order> {

    @Override
    Order show(long id); //显示订单状态

    void overBooking(Order order); //下单

    void updateBooking(long id);//更新外卖状态信息


    List<Order> searchsById(long id); //查询外卖

    void deleteBooking(long id); //删除订单

    @Override
    void deleteById(long id);

    void addToCar(long gid);

    Page<Order> showOrderPage(Integer bid, HttpServletRequest request, HttpServletResponse response);

    Page<Order> showOrderInUser(Integer id,HttpServletRequest request,HttpServletResponse response);
}
