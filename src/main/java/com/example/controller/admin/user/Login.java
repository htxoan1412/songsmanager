package com.example.controller.admin.user;

import com.example.dao.impl.UserDao;
import com.example.model.UserModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet({"/login",""})
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.sendRedirect("/login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        UserModel  user = new UserDao().checkLogin(req.getParameter("name"),req.getParameter("pass"));

        if (user!=null){
            HttpSession session =  req.getSession();
            session.setAttribute("userLogin",user);
            resp.sendRedirect(req.getContextPath()+"/admin/songs");
        }
        else {

            resp.sendRedirect("/login.jsp");
        }

    }
}
