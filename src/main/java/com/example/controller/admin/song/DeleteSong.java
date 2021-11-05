package com.example.controller.admin.song;

import com.example.dao.impl.SongDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/admin/song/del")
public class DeleteSong extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.parseInt(req.getParameter("id"));
        if (new SongDao().delSong(id) > 0) {
            resp.sendRedirect(req.getContextPath() + "/admin/songs?msg=2");
        } else resp.sendRedirect(req.getContextPath() + "/admin/songs?err=2");
    }

}
