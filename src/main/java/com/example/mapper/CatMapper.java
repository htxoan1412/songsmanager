package com.example.mapper;

import com.example.model.CategoryModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CatMapper implements RowMapper<CategoryModel> {

    @Override
    public CategoryModel mapRow(ResultSet resultSet) {

        try {
            CategoryModel cat = new CategoryModel();
            cat.setId_cat(resultSet.getInt("id_cat"));
            cat.setName(resultSet.getString("name"));
            return cat;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }
}
