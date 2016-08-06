package xechy.work.model;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * Created by Japa xie on 2016/8/4.
 * 订单类
 */
@Table(name = "order")
public class Order {

    @Id
    private long oid;
    //外卖状态
    private String state;
    //外卖的下单日期
    private Date odate;
    //订单中外卖名字
    private Goods ogoods;
    //订单中对应的商家
    private Business obusiness;
    //下单的用户
    private User ouser;

    public long getOid() {
        return oid;
    }

    public void setOid(long oid) {
        this.oid = oid;
    }

    public Date getOdate() {
        return odate;
    }

    public void setOdate(Date odate) {
        this.odate = odate;
    }

    public Business getObusiness() {
        return obusiness;
    }

    public void setObusiness(Business obusiness) {
        this.obusiness = obusiness;
    }

    public User getOuser() {
        return ouser;
    }

    public void setOuser(User ouser) {
        this.ouser = ouser;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Goods getOgoods() {
        return ogoods;
    }

    public void setOgoods(Goods ogoods) {
        this.ogoods = ogoods;
    }
}
