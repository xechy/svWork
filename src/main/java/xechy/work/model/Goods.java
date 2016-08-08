package xechy.work.model;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * Created by Japa xie on 2016/8/4.
 * 商品类
 */
@Table(name = "goods")
public class Goods {

    @Id
    private long gid;
    //外卖名字
    private String gname;
    //外卖描述
    private String describe;
    //外卖价格
    private Double price;
    //外卖数量
    private Integer number;
    //关联对应的商家
    private Business gbusiness;
    //外卖上架日期
    private Date gdate;

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

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }
        public Business getGbusiness() {
        return gbusiness;
    }

    public void setGbusiness(Business gbusiness) {
        this.gbusiness = gbusiness;
    }

    public Date getGdate() {
        return gdate;
    }

    public void setGdate(Date gdate) {
        this.gdate = gdate;
    }
}
