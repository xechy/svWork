package xechy.work.service;

import java.util.List;

/**
 * Created by Japa xie on 2016/7/30.
 */
public interface BaseService<T> {

    T login(T t);

    void save(T t);

    void update(T t);

    T show(long id);

    void updatePassword(T t);

    List<T> searchsById(long id);

    List<T> searchByUId(long id);

    T searchById(long id);

    T searchByName(String name);//根据姓名查询，没有模糊

    List<T> searchByNames(String name);//带模糊查询的

    void deleteById(long id);//根据ID删除

    T receivePassword(T t);//找回密码

    List<T> searchAll(); //管理员查询所有信息；


}
