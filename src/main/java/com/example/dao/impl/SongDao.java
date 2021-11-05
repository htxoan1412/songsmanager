package com.example.dao.impl;

import com.example.mapper.SongMapper;
import com.example.model.SongModel;
import com.example.padding.PageRequest;

import java.util.List;

public class SongDao extends AbstractDao {
    public List<SongModel> selSong(String search, PageRequest page) {
        StringBuffer sql = new StringBuffer("select id, image,s.name as name,description,content, date_create, listens, s.id_cat as id_cat,c.name AS cname ");
        sql.append("from songs as s inner join categories as c on s.id_cat = c.id_cat");
        if(search != null){
            String sname = "'%" + search + "%'";
            sql.append(" where s.name like " + sname);
        }
        if (page.getSorter().getSortBy()!=null && page.getSorter().getSortName()!= null){
            sql.append(" order by "+page.getSorter().getSortName()+" "+page.getSorter().getSortBy());
        }
        if (page.getLimit() != null && page.getOffset() != null){
            sql.append(" limit "+page.getLimit()+" offset " + page.getOffset());
        }
        return query(sql.toString(), new SongMapper());
    }

    public SongModel findSongID(int id) {
        StringBuffer sql = new StringBuffer("select id, image,s.name as name,description,content, date_create, listens, s.id_cat as id_cat,c.name AS cname ");
        sql.append("from songs as s inner join categories as c on s.id_cat = c.id_cat ");
        sql.append("where id = ?");
        List<SongModel> list = query(sql.toString(), new SongMapper(),id);
        return list.isEmpty() ? null : list.get(0);
    }

    public int insertSong(SongModel song) {
        String sql = "insert into songs (image,name,description,content,date_create,listens,id_cat) value(?,?,?,?,?,?,?)";
        return insert(sql, song.getImage(), song.getName(), song.getDescription(), song.getContent(),
                song.getDate_create(), song.getListens(), song.getId_cat());
    }

    public int delSong(int id) {
        String sql = "delete from songs where id=?";
        return delete(sql, id);
    }

    public int updateSong(SongModel song) {
        String sql = "update songs set image = ?, name =?,description=?,content =?,id_cat=? where id=?";
        return update(sql,song.getImage(), song.getName(), song.getDescription(),
                song.getContent(), song.getId_cat(), song.getId());
    }
    public int countSong(String search){
        StringBuffer sql = new StringBuffer("select count(*) from songs");
        if(search!=null){
            String  s =  "'%" + search + "%'";
            sql.append(" where name like "+s);
        }
        return count(sql.toString());
    }

}
