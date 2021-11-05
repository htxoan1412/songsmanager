package com.example.controller.admin.song;

import com.example.Util.AuthUtil;
import com.example.dao.impl.SongDao;
import com.example.model.SongModel;
import com.example.padding.PageRequest;
import com.example.sort.Sorter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/admin/songs")
public class SongControl extends HttpServlet {
    private SongDao songDao= new SongDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!AuthUtil.checkLogin(req)) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        SongModel song = new SongModel();

        String page = req.getParameter("page");
        String maxPageItem =req.getParameter("maxPageItem");
        String sortBy = req.getParameter("sortBy");
        String sortName = req.getParameter("sortName");

        if (page!=null){
            song.setPage(Integer.parseInt(page));
        }else {
            song.setPage(1);
        }

        if(maxPageItem!=null){
            song.setMaxPageItem(Integer.parseInt(maxPageItem));
        }else {
            song.setMaxPageItem(4);
        }

        if (sortBy!=null) {
            song.setSortBy(sortBy);
        }
        else {
            song.setSortBy("DESC");
        }

        if (sortName!= null){
            song.setSortName(sortName);
        }else {
            song.setSortName("name");
        }

        PageRequest pageRequest = new PageRequest(song.getPage(),song.getMaxPageItem(),
                new Sorter(song.getSortBy(),song.getSortName()));

        req.setAttribute("listSong",songDao.selSong(null,pageRequest));
        song.setTotalItem(songDao.countSong(null));
        song.setTotalPage((int) Math.ceil((double)song.getTotalItem()/song.getMaxPageItem()));
        req.setAttribute("songs",song);
        req.getRequestDispatcher(req.getContextPath()+"/song-assets.jsp").forward(req, resp);
    }
}
