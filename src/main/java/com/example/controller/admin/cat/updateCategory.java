package com.example.controller.admin.cat;

import com.example.dao.impl.CategoryDao;
import com.example.model.CategoryModel;
import com.example.model.UserModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(value = "/admin/cat/edit")
public class updateCategory extends HttpServlet {
    private CategoryDao catDao = new CategoryDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.parseInt(req.getParameter("id"));
        HttpSession session = req.getSession();
        UserModel userLogin = (UserModel)session.getAttribute("userLogin");
        if (userLogin.getRole().equals("1")){
            req.setAttribute("category",catDao.selCatById(id));
            req.getRequestDispatcher("/edit-library-assets.jsp").forward(req, resp);
        }else {
            resp.sendRedirect(req.getContextPath()+
                    "/admin/cats?err=5");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("html/text");
        req.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        CategoryModel cat = new CategoryModel();
        cat.setId_cat(id);
        cat.setName(name);
        CategoryDao i = new CategoryDao();
        i.updateCat(cat);
        resp.sendRedirect("/admin/cats");
    }
}
