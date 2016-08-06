package xechy.work.service.impl;

import org.springframework.stereotype.Service;
import xechy.work.service.BaseService;

import java.util.List;

/**
 * Created by Japa xie on 2016/8/6.
 */
@Service
public class BaseServiceImpl<T> implements BaseService<T> {


    @Override
    public T login(T t) {
        return null;
    }

    @Override
    public void save(T t) {

    }

    @Override
    public void update(T t) {

    }

    @Override
    public T show(long id) {
        return null;
    }

    @Override
    public void updatePassword(T t) {

    }

    @Override
    public T searchById(long id) {
        return null;
    }

    @Override
    public T searchByName(String name) {
        return null;
    }

    @Override
    public List<T> searchByNames(String name) {
        return null;
    }

    @Override
    public void deleteById(long id) {

    }

    @Override
    public void receivePassowrd(T t) {

    }
}
