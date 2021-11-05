package com.example.controller.admin.song;

import com.example.Util.FileUtil;
import com.example.dao.impl.CategoryDao;
import com.example.dao.impl.SongDao;
import com.example.model.SongModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

@MultipartConfig
@WebServlet(value = "/admin/song/add")
public class AddSong extends HttpServlet {
    private SongDao songDao= new SongDao();
    private CategoryDao catDao = new CategoryDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("categories",catDao.selCat());

        req.getRequestDispatcher("/add-song-assets.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("html/text");
        req.setCharacterEncoding("UTF-8");
        SongModel song = new SongModel();
        Part filePart = req.getPart("image");
        final String dirPathName = req.getServletContext().getRealPath("/img");
        File dirFile = new File(dirPathName);
        if (!dirFile.exists()){
            dirFile.mkdir();
        }

        String fileName = FileUtil.getName(filePart);


        String picture = FileUtil.rename(fileName);
        song.setImage(picture);

        String filePathname = dirPathName + File.separator + picture;

        song.setName(req.getParameter("name"));
        song.setDescription(req.getParameter("description"));
        song.setContent(req.getParameter("content"));
        song.setDate_create(new Timestamp(new Date().getTime()));
        song.setListens(0);
        song.setId_cat(Integer.parseInt(req.getParameter("id_cat")));

        if (songDao.insertSong(song) > 0) {
            if (!filePathname.isEmpty()){
                filePart.write(filePathname);
            }
            resp.sendRedirect(req.getContextPath()+"/admin/songs?msg=1");
            return;
        } else {
            resp.sendRedirect(req.getContextPath()+"/admin/song/add?err=1");
            return;
        }
    }
}
