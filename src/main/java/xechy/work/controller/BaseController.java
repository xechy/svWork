package xechy.work.controller;

import xechy.work.util.Reflections;

/**
 * Created by Japa xie on 2016/8/3.
 */
public class BaseController<T> {
    protected Class<T> entityClass = Reflections.getClassGenricType(getClass());//获取泛型
    protected String claseName=entityClass.getName().substring(entityClass.getName().lastIndexOf(".")+1);
    protected String TEMPLATE_NAME=claseName.substring(0,1).toLowerCase()+claseName.substring(1);  //类名

    protected String user_dir = "/WEB-INF/";                   //后台管理的jsp目录
    protected String TEMPLATE_PATH=user_dir+TEMPLATE_NAME+"/";              //每个模块的页面地址
    protected String REDIRECT_URL="redirect:/"+TEMPLATE_NAME+"/";      //重定向



}
