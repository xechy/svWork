package xechy.work.service.impl;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xechy.work.dao.AdminMapper;
import xechy.work.model.Admin;
import xechy.work.service.AdminService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Japa xie on 2016/8/5.
 */
@Service
public class AdminServiceImpl extends BaseServiceImpl<Admin> implements AdminService{

    @Autowired
    private AdminMapper adminMapper;


    @Override
    public Admin login(Admin admin) {
        return this.adminMapper.login(admin);
    }

    @Override
    public void update(Admin admin) {
        this.adminMapper.update(admin);
    }

    @Override
    public void updatePassword(Admin admin) {
        this.adminMapper.updatePassword(admin);
    }

    @Override
    public List<T> searchAll() {
        return this.adminMapper.searchAll();
    }

    @Override
    public void deleteById(long id) {
        this.adminMapper.deleteById(id);
    }
}
