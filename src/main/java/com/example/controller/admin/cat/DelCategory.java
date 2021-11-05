package com.example.controller.admin.cat;

import com.example.dao.impl.CategoryDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/admin/cat/del")
public class DelCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("html/text");
        req.setCharacterEncoding("UTF-8");
        Integer id = Integer.parseInt(req.getParameter("id"));
        if (new CategoryDao().delCat(id) > 0) {
            resp.sendRedirect(req.getContextPath()+"/admin/cats?msg=1");
        } else resp.sendRedirect(req.getContextPath()+"/admin/cats?err=1");

    }
}
