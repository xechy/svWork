package xechy.work.dao;

import xechy.work.model.Admin;

/**
 * Created by Japa xie on 2016/8/5.
 */
public interface AdminMapper {

    void updatePassword(Admin admin);

    void update(Admin admin);

    Admin login(Admin admin);
}
