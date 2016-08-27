package xechy.work.service;

import xechy.work.model.User;

import java.util.List;

/**
 * Created by Japa xie on 2016/7/30.
 */
public interface UserService extends BaseService<User>{

    User login(User user);//登录

    void saveUser(User user);//注册

    void updateUser(User user);//更新个人信息

    User showUser(long id);//显示个人信息

    void updatePassword(User user);//修改密码

    @Override
    User receivePassword(User user);//找回密码

    @Override
    List<User> searchAll();

    @Override
    void deleteById(long id);

    User checkName(String name);

    User checkPhone(String phone);
    User checkEmail(String mail);
}
