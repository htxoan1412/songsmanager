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

@WebServlet("/admin/user/del")
public class DeleteUser extends HttpServlet {
    UserDao userDao = new UserDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.parseInt(req.getParameter("id"));
        HttpSession session = req.getSession();
        UserModel userLogin = (UserModel) session.getAttribute("userLogin");
//        if(new UserDao().delUser(id)>0){
            if(userLogin.getRole().equals("1")) {
                userDao.delUser(id);
                resp.sendRedirect(req.getContextPath() + "/admin/users?msg=3");
            }
            else resp.sendRedirect(req.getContextPath()+"/admin/users?err=3");
        }


}
