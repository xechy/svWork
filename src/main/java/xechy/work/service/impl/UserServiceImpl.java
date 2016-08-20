package xechy.work.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xechy.work.dao.UserMapper;
import xechy.work.model.User;
import xechy.work.service.UserService;

import java.util.List;

/**
 * Created by Japa xie on 2016/7/30.
 */
@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService{

    @Autowired
    private UserMapper userMapper;

    @Override
    public User login(User user) {
        return this.userMapper.login(user);
    }

    @Override
    public void saveUser(User user) {
       this.userMapper.saveUser(user);
    }

    @Override
    public void updateUser(User user) {
        this.userMapper.update(user);
    }


    @Override
    public User showUser(long id) {
        return this.userMapper.show(id);
    }

    @Override
    public void updatePassword(User user) {
        this.userMapper.updatePassword(user);
    }

    @Override
    public User receivePassword(User user) {
        return this.userMapper.receivePassword(user);
    }

    @Override
    public List<User> searchAll() {
        return this.userMapper.searchAll();
    }

    @Override
    public void deleteById(long id) {
        this.userMapper.deleteById(id);
    }

    @Override
    public User checkName(String name) {
        return this.userMapper.checkName(name);
    }
}
