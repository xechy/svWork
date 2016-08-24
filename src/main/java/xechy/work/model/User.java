package xechy.work.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.List;

/**
 * Created by Japa xie on 2016/7/30.
 */
@Table(name="user")
public class User {
    //用户id
    @Id
    private Integer id;
    //用户姓名
    private String name;
    //用户密码
    private String password;
    //用户邮箱
    private String mail;
    //用户电话
    private String phone;
    //注册日期
    private Date date;
    //用户地址
    private String address;
    //用户性别
    private String sex;

    private List<Order> orders;

    public User() {
    }

    public User(Integer id, String name, String password, String mail, String phone, Date date, String address, String sex, List<Order> orders) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.mail = mail;
        this.phone = phone;
        this.date = date;
        this.address = address;
        this.sex = sex;
        this.orders = orders;
    }

    public User(Integer id, String name, String password, String mail, String phone, String address, String sex, java.sql.Date date) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.mail = mail;
        this.phone = phone;
        this.date = date;
        this.address = address;
        this.sex = sex;
    }
    public User(Integer id, String name, String password, String mail, String phone, String address, String sex, Date date) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.mail = mail;
        this.phone = phone;
        this.date = date;
        this.address = address;
        this.sex = sex;
    }



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }


}
