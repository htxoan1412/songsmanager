package com.example.mapper;

import com.example.model.CategoryModel;
import com.example.model.SongModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SongMapper implements RowMapper<SongModel> {
    @Override
    public SongModel mapRow(ResultSet resultSet) {
        try {
            SongModel song = new SongModel();
            song.setId(resultSet.getInt("id"));
            song.setImage(resultSet.getString("image"));
            song.setName(resultSet.getString("name"));
            song.setDescription(resultSet.getString("description"));
            song.setContent(resultSet.getString("content"));
            song.setDate_create(resultSet.getTimestamp("date_create"));
            song.setListens(resultSet.getInt("listens"));
            song.setId_cat(resultSet.getInt("id_cat"));
            //set cat
            try {
                CategoryModel categoryModel = new CategoryModel();
                categoryModel.setId_cat(resultSet.getInt("id_cat"));
                categoryModel.setName(resultSet.getString("cname"));
                song.setCat(categoryModel);
            }catch (Exception e){
                e.getMessage();
            }
            return song;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }

    }
}
