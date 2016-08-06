package xechy.work.dao;

import xechy.work.model.Goods;
import xechy.work.model.Order;

/**
 * Created by Japa xie on 2016/8/5.
 */
public interface OrderMapper {
    void deleteBooking(long id);

    Order show(long id);

    void overBooking(Goods goods);

    void updateBooking(Goods goods);

    Order searchById(long id);
}
