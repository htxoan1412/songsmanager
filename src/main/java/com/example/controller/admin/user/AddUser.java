package com.example.controller.admin.user;

import com.example.dao.impl.UserDao;
import com.example.model.UserModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/user/add")
public class AddUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/add-data-table.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("html/text");
        req.setCharacterEncoding("UTF-8");
        UserModel user = new UserModel();
        user.setName(req.getParameter("name"));
        user.setPassword(req.getParameter("pass"));
        user.setEmail(req.getParameter("email"));
        user.setBirthday(req.getParameter("birthday"));
        user.setPhone(req.getParameter("phone"));
        user.setAction(req.getParameter("action"));
        user.setRole(req.getParameter("role"));
        if(new UserDao().insertUser(user)>0){
            resp.sendRedirect(req.getContextPath()+"/admin/users");
        }
        else {
            resp.sendRedirect(req.getContextPath()+"/admin/user/add");
        }
    }
}
