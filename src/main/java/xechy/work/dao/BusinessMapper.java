package xechy.work.dao;

import xechy.work.model.Business;

import java.util.List;

/**
 * Created by Japa xie on 2016/8/5.
 */
public interface BusinessMapper {
    Business login(Business business);

    void save(Business business);

    void update(Business business);

    Business show(long id);

    void updatePassword(Business business);

    List<Business> searchByNames(String storeName);

    Business receivePassword(Business business);

    List<Business> searchAll();

    void deleteById(long id);

    Business checkName(String bname);

    Business checkStoreName(String storeName);

    List<Business> searchByAddress(String baddress);
}
