package com.example.controller.admin.cat;

import com.example.dao.impl.CategoryDao;
import com.example.model.CategoryModel;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/admin/cat/add")
public class AddCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/add-library-assets.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("html/text");
        req.setCharacterEncoding("UTF-8");
        CategoryModel cat = new CategoryModel();
        cat.setName(req.getParameter("name"));
        if(new CategoryDao().insertCat(cat) > 0) {
            resp.sendRedirect(req.getContextPath()+"/admin/cats");
        } else resp.sendRedirect(req.getContextPath()+"/admin/cat/add");
    }
}
