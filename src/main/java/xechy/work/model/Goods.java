package xechy.work.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.List;

/**
 * Created by Japa xie on 2016/8/4.
 * 商品类
 */
@Table(name = "goods")
public class Goods {

    @Override
    public String toString() {
        return "Goods{" +
                "gid=" + gid +
                ", gname='" + gname + '\'' +
                ", gdescribe='" + gdescribe + '\'' +
                ", price=" + price +
                ", bid=" + bid +
                ", gdate=" + gdate +
                ", picture='" + picture + '\'' +
                '}';
    }

    @Id
    private long gid;
    //外卖名字
    private String gname;
    //外卖描述
    private String gdescribe;
    //外卖价格
    private Double price;
    //关联对应的商家
    private long bid;
    //外卖上架日期
    private Date gdate;

    private String picture;
    //下单前添加到确认栏！
    private long id;

    private List<Order> orders;

    public long getGid() {
        return gid;
    }

    public void setGid(long gid) {
        this.gid = gid;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public String getGdescribe() {
        return gdescribe;
    }

    public void setGdescribe(String gdescribe) {
        this.gdescribe = gdescribe;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public long getBid() {
        return bid;
    }

    public void setBid(long bid) {
        this.bid = bid;
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    public Date getGdate() {
        return gdate;
    }

    public void setGdate(Date gdate) {
        this.gdate = gdate;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
}
