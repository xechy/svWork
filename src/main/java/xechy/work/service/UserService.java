package xechy.work.service;

import xechy.work.model.User;

/**
 * Created by Japa xie on 2016/7/30.
 */
public interface UserService {

    public User login(User user);
    public void saveUser(User user);

}
