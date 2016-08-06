package xechy.work.dao;

import xechy.work.model.User;

/**
 * Created by Japa xie on 2016/7/30.
 * 用户接口
 */
public interface UserMapper {

    public User login(User user);

    public void saveUser(User user);

    User show(long id);

    void updatePassword(User user);

    void updateUser(User user);

    void receivePassowrd(User user);
}
