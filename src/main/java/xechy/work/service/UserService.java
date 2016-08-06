package xechy.work.service;

import xechy.work.model.User;

/**
 * Created by Japa xie on 2016/7/30.
 */
public interface UserService {

    public User login(User user);
    void saveUser(User user);
    void updateUser(User user);

    User showUser(long id);
    void updatePassword(User user);


}
