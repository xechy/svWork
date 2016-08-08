package xechy.work.service;

import java.util.List;

/**
 * Created by Japa xie on 2016/7/30.
 */
public interface BaseService<T> {

    public T login(T t);
    public void save(T t);
    public void update(T t);
    public T show(long id);
    public void updatePassword(T t);
    public T searchById(long id);
    public T searchByName(String name);//根据姓名查询，没有模糊
    public List<T> searchByNames(String name);//带模糊查询的
    public void deleteById(long id);//根据ID删除
    public void receivePassowrd(T t);//找回密码
    List<T> searchAll(); //管理员查询所有信息；





}
