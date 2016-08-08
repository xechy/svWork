package xechy.work.service;

import xechy.work.model.Admin;

/**
 * Created by Japa xie on 2016/8/5.
 */
public interface AdminService extends BaseService<Admin>{

    @Override
    Admin login(Admin admin);

    @Override
    void update(Admin admin);

    @Override
    void updatePassword(Admin admin);





}
