package com.example.Util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AuthUtil {
    public static boolean checkLogin(HttpServletRequest req) throws ServletException, IOException{
        HttpSession session = req.getSession();
        if(session.getAttribute("userLogin") == null){
            return false;
        }else {
            return true;
        }
    }

}
