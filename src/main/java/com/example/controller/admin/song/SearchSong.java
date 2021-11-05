package com.example.controller.admin.song;

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
import java.util.List;
@WebServlet("/admin/song/search")
public class SearchSong extends HttpServlet {
    private SongDao songDao= new SongDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("html/text");
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

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

        if (sortBy!=null){
            song.setSortBy(sortBy);
        }else {
            song.setSortBy("DESC");
        }

        if (sortName!= null){
            song.setSortName(sortName);
        }else {
            song.setSortName("id");
        }

        PageRequest pageRequest = new PageRequest(song.getPage(),song.getMaxPageItem(),
                new Sorter(song.getSortBy(),song.getSortName()));

        String search= req.getParameter("txtname");
        List<SongModel> list = new SongDao().selSong(search,pageRequest);
        req.setAttribute("listSong",list);
        req.setAttribute("txtname",search);
        song.setTotalItem(songDao.countSong(search));
        song.setTotalPage((int) Math.ceil((double)song.getTotalItem()/song.getMaxPageItem()));
        req.setAttribute("songs",song);
        req.getRequestDispatcher(req.getContextPath()+"/search-song.jsp").forward(req,resp);

    }



}
