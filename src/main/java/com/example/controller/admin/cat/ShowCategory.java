package com.example.controller.admin.cat;

import com.example.Util.AuthUtil;
import com.example.service.ICategoryService;
import com.example.service.impl.CategoryService;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/admin/cats")
public class ShowCategory extends HttpServlet {
    private ICategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(!AuthUtil.checkLogin(req)) {
            resp.sendRedirect(req.getContextPath()+"/login");
            return;
        }
        System.out.println("abc");
        req.setAttribute("listCat",categoryService.selCat());
        req.getRequestDispatcher("/library-assets.jsp").forward(req,resp);
    }
}
