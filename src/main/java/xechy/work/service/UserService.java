package xechy.work.service;

import xechy.work.model.User;

/**
 * Created by Japa xie on 2016/7/30.
 */
public interface UserService extends BaseService<User>{

    public User login(User user);//登录

    void saveUser(User user);//注册

    void updateUser(User user);//更新个人信息

    User showUser(long id);//显示个人信息

    void updatePassword(User user);//修改密码

    @Override
    void receivePassowrd(User user);//找回密码
}
