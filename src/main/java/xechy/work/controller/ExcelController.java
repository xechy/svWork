package xechy.work.controller;


import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import xechy.work.model.Admin;
import xechy.work.model.User;
import xechy.work.service.UserService;
import xechy.work.util.ExportExcel;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

/**
 * Created by Ivan on 2016/8/19.
 */
@Controller
@RequestMapping(value = "/excel")
public class ExcelController extends BaseController<Admin> {

    @Autowired
    private UserService userService;

    /**
     * Excel数据导入
     *
     * @param excel
     * @return
     */
    @RequestMapping(value = "/uploadUser")
    public String upload(MultipartFile excel) throws IOException {
//        RequestAttributes ar = RequestContextHolder.getRequestAttributes();
//        HttpServletRequest request = ((ServletRequestAttributes) ar).getRequest();
//        String uploadPath = request.getSession().getServletContext().getRealPath("") + "/resources/file/excel";

        //文件流指向excel文件
        InputStream fin = excel.getInputStream();
        HSSFWorkbook workbook = new HSSFWorkbook(fin);//创建工作薄
        HSSFSheet sheet = workbook.getSheetAt(0);//得到工作表
        HSSFRow row = null;//对应excel的行
        HSSFCell cell = null;//对应excel的列

        int totalRow = sheet.getLastRowNum();//得到excel的总记录条数
        //以下的字段一一对应数据库表的字段
        int id = 0;
        String name = "";
        String password = "";
        String mail = "";
        String phone = "";
        String address = "";
        String sex = "";

        for (int i = 1; i <= totalRow; i++) {
            row = sheet.getRow(i);
            if (row.getCell(0) != null) {
                row.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
                id = Integer.parseInt(row.getCell(0).getStringCellValue());
            }
            cell = row.getCell(1);
            name = cell.getRichStringCellValue().toString();
            cell = row.getCell(2);
            password = cell.getRichStringCellValue().toString();
            cell = row.getCell(3);
            mail = cell.getRichStringCellValue().toString();
            cell = row.getCell(4);
            phone = cell.getRichStringCellValue().toString();
            cell = row.getCell(5);
            address = cell.getRichStringCellValue().toString();
            cell = row.getCell(6);
            sex = cell.getRichStringCellValue().toString();
            User u = new User(id,name,password,mail,phone,address,sex,new Date());
            userService.saveUser(u);
        }
        return TEMPLATE_PATH+"tables-User";
    }

    /**
     * Excel数据导出
     *
     * @param response
     * @throws IOException
     */
    @RequestMapping(value = "/download")
    public void download(HttpSession session, HttpServletResponse response) throws IOException {
       List<User> users = userService.searchAll();
        //调用ExportExcel构建一张Excel表

        ExportExcel<User> ex = new ExportExcel<User>();
        response.setContentType("octets/stream");
        response.addHeader("Content-Disposition", "attachment;filename=User.xlsx");
        String[] headers = {"ID", "姓名", "密码", "邮箱", "电话", "日期", "地址","性别"};
        //存储每一行的表中数据
        OutputStream out = response.getOutputStream();
        ex.exportExcel(headers, users, out);
        out.close();
    }

}
