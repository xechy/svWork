package xechy.work.util;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import xechy.work.model.Business;
import xechy.work.model.Goods;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.UUID;


public class FileUploadUtil {

    /**
     * 产品图片的保存位置
     */
    public final static String GOODS_PATH = "/resources/file/goods";

    public final static String BUSINESSS_PATH = "/resources/file/business";

    /**
     * 上传店铺图片
     * @param uploadFile
     * @param
     */
    public static void uploadBusinesstPicture(MultipartFile uploadFile, Business business){
        if (!uploadFile.isEmpty()){
            if (business.getbPicture() != null){
                deleteFile(BUSINESSS_PATH,business.getbPicture());
            }
            business.setbPicture(uploadFile(uploadFile, BUSINESSS_PATH));

        }
    }

    public static void deleteGoodsPicture(String picture){
        deleteFile(GOODS_PATH,picture);
    }
    /**
     * 上传食物图片
     * @param uploadFile
     * @param
     */
    public static void uploadGoodstPicture(MultipartFile uploadFile, Goods goods){
        if (!uploadFile.isEmpty()){
            if (goods.getPicture() != null){
                deleteFile(GOODS_PATH,goods.getPicture());
            }
            goods.setPicture(uploadFile(uploadFile, GOODS_PATH));

        }
    }
	public static String uploadFile(MultipartFile uploadFile, String savePath) {
        RequestAttributes ar = RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = ((ServletRequestAttributes) ar).getRequest();
        String uploadPath =request.getSession().getServletContext().getRealPath("")+ savePath;
        OutputStream os=null;
		InputStream is = null;
		try {
			is = uploadFile.getInputStream();
            String fileName = UUID.randomUUID().toString()
                    + getFileExt(uploadFile.getOriginalFilename());
			File file = new File(uploadPath);
			if (!file.exists()) { // 如果路径不存在，创建
				file.mkdirs();
			}
			File toFile = new File(uploadPath, fileName);
            os = new FileOutputStream(toFile);
			byte[] buffer = new byte[1024];
			int length = 0;
			while ((length = is.read(buffer)) > 0) {
				os.write(buffer, 0, length);
			}
			return fileName;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			try {
				is.close();
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
	}

	/**
	 * 获取文件的后缀名
	 * @param fileName 原文件名
	 * @return 后缀
	 */
	public static String getFileExt(String fileName){
		return fileName.substring(fileName.lastIndexOf("."));
	}
    /**
     * 删除服务器中的文件
     *
     * 根路径
     *
     * @param fileName
     *            文件名
     */
    public static void deleteFile(String savePath, String fileName) {
        RequestAttributes ar = RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = ((ServletRequestAttributes) ar)
                .getRequest();
        String path = request.getSession().getServletContext().getRealPath("")
                + savePath;
        System.out.println("delete" + path + "/" + fileName);
        File file = new File(path + "/" + fileName);
        if (file.exists()) {
            file.delete();
        }

    }

}
