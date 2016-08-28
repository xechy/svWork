package xechy.work.service.impl;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xechy.work.dao.GoodsMapper;
import xechy.work.dao.OrderMapper;
import xechy.work.model.Business;
import xechy.work.model.Order;
import xechy.work.model.User;
import xechy.work.service.OrderService;
import xechy.work.util.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Japa xie on 2016/8/5.
 */

@Service
public class OrderServiceImpl extends BaseServiceImpl<Order> implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private GoodsMapper goodsMapper;

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
        order.setOdate(new Date());
        order.setState("等待商家接单");
        this.orderMapper.overBooking(order);
        this.goodsMapper.deleteUId(order.getBid());
    }

    @Override
    public void updateBooking(long id) {
        Order order =  this.orderMapper.searchONEById(id);
        order.setOdate(new Date());
        if (order.getState().equals("配送中") || order.getState().equals("等待商家接单")){
            order.setState("配送成功");
        }
        if (order.getState().equals("商家已接单") && !order.getState().equals("配送中")){
            order.setState("配送中");
        }
        if (order.getState().equals("等待商家接单") && !order.getState().equals("配送中")){
            order.setState("商家已接单");
        }
        this.orderMapper.updateBooking(order);
    }

    @Override
    public List<Order> searchsById(long id) {
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

    @Override
    public Page<Order> showOrderPage(Integer bid, HttpServletRequest request, HttpServletResponse response) {
        String pageNow = request.getParameter("pageNow");

        Page<Order> page = null;

        List<Order> orders = new ArrayList<Order>();

        int totalCount =  orderMapper.getProductsCount(bid);

        if (pageNow != null) {
            page = new Page(totalCount, Integer.parseInt(pageNow));
            orders = this.orderMapper.selectProductsByPage(bid,page.getStartPos(), page.getPageSize());
        } else {
            page = new Page(totalCount, 1);
            orders = this.orderMapper.selectProductsByPage(bid,page.getStartPos(), page.getPageSize());
        }
        request.setAttribute("orders", orders);
        request.setAttribute("page", page);

        page.setRecordList(orders);

        return page;
    }


    @Override
    public Page<Order> showOrderInUser(Integer id, HttpServletRequest request, HttpServletResponse response) {
        String pageNow = request.getParameter("pageNow");

        Page<Order> page = null;

        List<Order> orders = new ArrayList<Order>();

        int totalCount =  orderMapper.getShowOrderInUser(id);

        if (pageNow != null) {
            page = new Page(totalCount, Integer.parseInt(pageNow));
            orders = this.orderMapper.showOrderInUser(id,page.getStartPos(), page.getPageSize());
            System.out.println(orders.size());
        } else {
            page = new Page(totalCount, 1);
            orders = this.orderMapper.showOrderInUser(id,page.getStartPos(), page.getPageSize());
            System.out.println(orders.size());
        }
        request.setAttribute("orders", orders);
        request.setAttribute("page", page);

        page.setRecordList(orders);

        return page;
    }
}
