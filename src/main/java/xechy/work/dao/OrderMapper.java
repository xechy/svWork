package xechy.work.dao;

import org.apache.ibatis.annotations.Param;
import xechy.work.model.Order;

import java.util.List;

/**
 * Created by Japa xie on 2016/8/5.
 */
public interface OrderMapper {
    void deleteBooking(long id);

    Order show(long id);

    void overBooking(Order order);

    void updateBooking(Order order);

    List<Order> searchById(long id);

    List<Order> searchAll();

    void deleteById(long id);

    void addToCar(long gid);

    Integer getProductsCount(Integer bid);

    List<Order> selectProductsByPage(@Param(value = "bid") Integer bid,@Param(value = "startPos") Integer startPos,@Param(value = "pageSize") Integer pageSize);

    Order searchONEById(long id);

    List<Order> showOrderInUser(@Param(value = "id")Integer id,@Param(value = "startPos") Integer startPos,@Param(value = "pageSize") Integer pageSize);

    Integer getShowOrderInUser(Integer id);
}
