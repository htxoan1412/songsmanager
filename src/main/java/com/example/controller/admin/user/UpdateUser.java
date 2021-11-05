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
@WebServlet("/admin/user/edit")
public class UpdateUser extends HttpServlet {
    UserDao userDao = new UserDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.parseInt(req.getParameter("id"));
//        req.setAttribute("user",userDao.selUser());
        HttpSession session2= req.getSession();
        UserModel userLogin2 =(UserModel) session2.getAttribute("userLogin");
        if(userLogin2.getRole().equals("1")){
            req.setAttribute("userById", userDao.selUserById(id));
            req.getRequestDispatcher("/edit-user.jsp").forward(req, resp);

        }
        else if(userDao.selUserById(id).getId()==userLogin2.getId()) {
            req.setAttribute("userById", userDao.selUserById(id));
            req.getRequestDispatcher("/edit-user.jsp").forward(req, resp);
        }
        else  resp.sendRedirect(req.getContextPath()+"/admin/users?err=6");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("html/text");
        req.setCharacterEncoding("UTF-8");
        UserModel user = new UserModel();
        user.setId(Integer.parseInt(req.getParameter("id")));
        user.setName(req.getParameter("name"));
        user.setEmail(req.getParameter("email"));
        user.setPassword(req.getParameter("pass"));
        user.setBirthday(req.getParameter("birthday"));
        user.setAction(req.getParameter("action"));
        user.setPhone(req.getParameter("phone"));
        user.setRole(req.getParameter("role"));
        userDao.updateUser(user);

        resp.sendRedirect(req.getContextPath()+"/admin/users");
    }
}
