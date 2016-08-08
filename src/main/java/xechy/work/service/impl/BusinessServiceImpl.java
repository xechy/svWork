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
    private BusinessMapper businessMapper;

    @Override
    public Business login(Business business) {
        return this.businessMapper.login(business);
    }

    @Override
    public void save(Business business) {
        this.businessMapper.save(business);
    }

    @Override
    public void update(Business business) {
        this.businessMapper.update(business);
    }

    @Override
    public Business show(long id) {
        return this.businessMapper.show(id);
    }

    @Override
    public void updatePassword(Business business) {
        this.businessMapper.updatePassword(business);
    }

    @Override
    public List<Business> searchByNames(String storeName) {
        return this.businessMapper.searchByNames(storeName);
    }

    public void receivePassowrd(Business business){
        this.businessMapper.receivePassword(business);
    }

    @Override
    public List<Business> searchAll() {
        return this.businessMapper.searchAll();
    }

    @Override
    public void deleteById(long id) {
        this.businessMapper.deleteById(id);
    }
}
