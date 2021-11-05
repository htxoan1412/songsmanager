package com.example.controller.admin.song;

import com.example.Util.FileUtil;
import com.example.dao.impl.CategoryDao;
import com.example.dao.impl.SongDao;
import com.example.model.SongModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

@MultipartConfig
@WebServlet(value = "/admin/song/edit")
public class UpdateSong extends HttpServlet {
    private SongDao songDao = new SongDao();
    private CategoryDao catDao = new CategoryDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.parseInt(req.getParameter("id"));

        req.setAttribute("categories", catDao.selCat());
        req.setAttribute("song", songDao.findSongID(id));
        req.getRequestDispatcher("/edit-song-assets.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("html/text");
        req.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(req.getParameter("id"));

        SongModel song = new SongModel();

        SongModel songId = songDao.findSongID(id);

        song.setId(id);
        song.setName(req.getParameter("name"));
        song.setDescription(req.getParameter("description"));
        song.setContent(req.getParameter("content"));
        int id_cat = Integer.parseInt(req.getParameter("category"));
        System.out.println(id_cat);
        song.setId_cat(id_cat);

        Part filePart = req.getPart("image");
        final String dirPathName = req.getServletContext().getRealPath("/img");
        File dirFile = new File(dirPathName);
        if (!dirFile.exists()) {
            dirFile.mkdir();
        }
        String fileName = FileUtil.getName(filePart);
        String picture = "";
        if (fileName.isEmpty()) {
            picture = songId.getImage();
        } else {
            picture = FileUtil.rename(fileName);
        }
        song.setImage(picture);

        String filePathname = dirPathName + File.separator + picture;
        SongDao i = new SongDao();
        i.updateSong(song);
        if (!fileName.isEmpty()) {
            String oldFilePath = dirPathName + File.separator + songId.getImage();
            File oldFile = new File(oldFilePath);
            if (oldFile.exists()) {
                oldFile.delete();
            }
            filePart.write(filePathname);
        }
        resp.sendRedirect(req.getContextPath() + "/admin/songs?msg=1");
    }
}
