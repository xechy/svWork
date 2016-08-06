package xechy.work.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xechy.work.dao.BusinessMapper;
import xechy.work.model.Business;
import xechy.work.service.BusinessService;

import java.util.List;

/**
 * Created by Japa xie on 2016/8/5.
 */
@Service
public class BusinessServiceImpl extends BaseServiceImpl<Business> implements BusinessService {

    @Autowired
    private BusinessMapper BusinessMapper;

    @Override
    public Business login(Business business) {
        return this.BusinessMapper.login(business);
    }

    @Override
    public void save(Business business) {
        this.BusinessMapper.save(business);
    }

    @Override
    public void update(Business business) {
        this.BusinessMapper.update(business);
    }

    @Override
    public Business show(long id) {
        return this.BusinessMapper.show(id);
    }

    @Override
    public void updatePassword(Business business) {
        this.BusinessMapper.updatePassword(business);
    }

    @Override
    public List<Business> searchByNames(String name) {
        return this.BusinessMapper.searchByNames(name);
    }

    public void receivePassowrd(Business business){
        this.BusinessMapper.receivePassword(business);
    }
}
