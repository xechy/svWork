package xechy.work.dao;

import xechy.work.model.User;

import java.util.List;

/**
 * Created by Japa xie on 2016/7/30.
 * 用户接口
 */
public interface UserMapper {

    User login(User user);

    void saveUser(User user);

    User show(long id);

    void updatePassword(User user);

    void updateUser(User user);

    void receivePassowrd(User user);

    List<User> searchAll();

    void deleteById(long id);
}
