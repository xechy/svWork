package xechy.work.service;

import org.springframework.web.multipart.MultipartFile;
import xechy.work.model.Business;

import java.util.List;

/**
 * Created by Japa xie on 2016/8/5.
 */
public interface BusinessService extends BaseService<Business> {

    @Override
    Business login(Business business);//登录


    void save(Business business, MultipartFile filePath);//注册

    @Override
    void update(Business business);//更新个人信息

    @Override
    Business show(long id);//显示个人信息

    @Override
    void updatePassword(Business business);//更改密码

    @Override
    List<Business> searchByNames(String storeName);//搜索商家

    Business receivePassword(Business business);//找回密码

    @Override
    List<Business> searchAll();

    @Override
    void deleteById(long id);

    Business checkName(String bname);

    Business checkStoreName(String storeName);

    List<Business> searchByAddress(String baddress);
}
