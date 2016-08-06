package xechy.work.service.impl;

import org.apache.poi.util.SystemOutLogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xechy.work.dao.UserMapper;
import xechy.work.model.User;
import xechy.work.service.UserService;

import java.util.Date;

/**
 * Created by Japa xie on 2016/7/30.
 */
@Service
public class UserServiceImpl extends BaseServiceImpl implements UserService{

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
        this.userMapper.updateUser(user);
    }


    @Override
    public User showUser(long id) {
        return this.userMapper.show(id);
    }

    @Override
    public void updatePassword(User user) {
        this.userMapper.updatePassword(user);
    }

}
