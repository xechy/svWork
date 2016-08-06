package xechy.work.model;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * Created by Japa xie on 2016/8/4.
 * 管理员类
 */
@Table(name = "admin")
public class Admin {
    @Id
    private long aid;
    //管理员登录名
    private String aname;
    //管理员密码
    private String apassword;
    //管理员手机
    private String aphone;
    //管理员电子邮箱
    private String amail;
    //管理员注册日期
    private Date adate;


    public long getAid() {
        return aid;
    }

    public void setAid(long aid) {
        this.aid = aid;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getApassword() {
        return apassword;
    }

    public void setApassword(String apassword) {
        this.apassword = apassword;
    }

    public String getAphone() {
        return aphone;
    }

    public void setAphone(String aphone) {
        this.aphone = aphone;
    }

    public String getAmail() {
        return amail;
    }

    public void setAmail(String amail) {
        this.amail = amail;
    }

    public Date getAdate() {
        return adate;
    }

    public void setAdate(Date adate) {
        this.adate = adate;
    }

}
