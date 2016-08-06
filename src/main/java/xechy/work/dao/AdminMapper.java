package xechy.work.dao;

import org.apache.poi.ss.formula.functions.T;
import xechy.work.model.Admin;

import java.util.List;

/**
 * Created by Japa xie on 2016/8/5.
 */
public interface AdminMapper {
    void deleteById(long id);

    List<T> searchAll();

    void updatePassword(Admin admin);

    void update(Admin admin);

    Admin login(Admin admin);
}
