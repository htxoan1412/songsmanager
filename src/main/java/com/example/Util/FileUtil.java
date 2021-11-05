package com.example.Util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
//ko hiểu haha
//cái ni copy trên mạng về đó// rồi anh sửa lại. để vậy dùng luôn
//ko cần  hiểu đâu ha
//đúng rồi
// anh vô trang chủ của nó copy về mà :v oke
//mà cũng dễ hiểu chứ ko gì khó tới em// sau này hãy xem qua cug dc
// okee
public class FileUtil {
    public static String rename(String fileName) {
        String nameFile = "";
        if (!fileName.isEmpty()) {
            String[] arrImg = fileName.split("\\.");
            String duoiFileImg = arrImg[arrImg.length - 1];

            for (int i = 0; i < (arrImg.length - 1); i++) {
                if (i == 0) {
                    nameFile = arrImg[i];
                } else {
                    nameFile += "-" + arrImg[i];
                }
            }
            nameFile = nameFile + "-" + System.nanoTime() + "." + duoiFileImg;
        }
        return nameFile;
    }

    public static String getName(final Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
