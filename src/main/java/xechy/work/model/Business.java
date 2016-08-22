package xechy.work.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.List;

/**
 * Created by Japa xie on 2016/8/4.
 * 商家类
 */
@Table(name = "business")
public class Business {

    @Id
    private long bid;
    //商家登录名
    private String bname;
    //商家的店铺名
    private String storeName;
    //商家的登录密码
    private String bpassword;
    //商家的手机
    private String bphone;
    //商家的电子邮箱
    private String bmail;
    //商家的地址
    private String baddress;
    //商家的注册日期
    private Date bdate;
    //商家商店旗下的外卖
    private List<Goods> bgoods;

    private List<Order> border;

    private String bPicture;

    public long getBid() {
        return bid;
    }

    public void setBid(long bid) {
        this.bid = bid;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public String getBpassword() {
        return bpassword;
    }

    public void setBpassword(String bpassword) {
        this.bpassword = bpassword;
    }

    public String getBphone() {
        return bphone;
    }

    public void setBphone(String bphone) {
        this.bphone = bphone;
    }

    public String getBmail() {
        return bmail;
    }

    public void setBmail(String bmail) {
        this.bmail = bmail;
    }

    public String getBaddress() {
        return baddress;
    }

    public void setBaddress(String baddress) {
        this.baddress = baddress;
    }
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    public Date getBdate() {
        return bdate;
    }

    public void setBdate(Date bdate) {
        this.bdate = bdate;
    }

    public List<Goods> getBgoods() {
        return bgoods;
    }

    public void setBgoods(List<Goods> bgoods) {
        this.bgoods = bgoods;
    }

    public String getbPicture() {
        return bPicture;
    }

    public void setbPicture(String bPicture) {
        this.bPicture = bPicture;
    }

    public List<Order> getBorder() {
        return border;
    }

    public void setBorder(List<Order> border) {
        this.border = border;
    }
}
