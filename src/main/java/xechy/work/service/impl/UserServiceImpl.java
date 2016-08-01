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
    private UserMapper UserMapper;

    @Override
    public User login(User user) {
        return this.UserMapper.login(user);
    }

    @Override
    public void saveUser(User user) {
       this.UserMapper.saveUser(user);
    }

}
