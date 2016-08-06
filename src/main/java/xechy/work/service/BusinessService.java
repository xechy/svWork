package xechy.work.service;

import xechy.work.model.Business;

import java.util.List;

/**
 * Created by Japa xie on 2016/8/5.
 */
public interface BusinessService extends BaseService<Business> {

    @Override
    Business login(Business business);//登录

    @Override
    void save(Business business);//注册

    @Override
    void update(Business business);//更新个人信息

    @Override
    Business show(long id);//显示个人信息

    @Override
    void updatePassword(Business business);//更改密码

    @Override
    List<Business> searchByNames(String name);//搜索商家

    void receivePassowrd(Business business);//找回密码

}
