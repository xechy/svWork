package xechy.work.service;

import org.apache.poi.ss.formula.functions.T;
import xechy.work.model.Admin;

import java.util.List;

/**
 * Created by Japa xie on 2016/8/5.
 */
public interface AdminService extends BaseService<Admin>{

    public List<T> searchAll(); //管理员查询所有信息；

    public void deleteById(long id); //根据ID删除信息



}
