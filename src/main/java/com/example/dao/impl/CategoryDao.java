package com.example.dao.impl;

import com.example.dao.ICategoryDao;
import com.example.mapper.CatMapper;
import com.example.model.CategoryModel;

import java.util.List;

public class CategoryDao extends AbstractDao implements ICategoryDao {
    @Override
    public List<CategoryModel> selCat() {
        String sql = "select * from categories";
        return query(sql, new CatMapper());
    }
    @Override
    public CategoryModel selCatById(int id) {
        String sql = "select * from categories where id_cat=?";
        List<CategoryModel> list = query(sql.toString(), new CatMapper(), id);
        return list.isEmpty() ? null : list.get(0);
    }
    @Override
    public int delCat(int id) {
        String sql = "delete from categories where id_cat=?";
        return delete(sql, id);
    }
    @Override
    public int insertCat(CategoryModel cat) {
        String sql = "insert into categories(name) values (?)";
        return insert(sql, cat.getName());
    }
    @Override
    public int updateCat(CategoryModel cat) {
        String sql = "update categories set name =? where id_cat=?";
        return update(sql, cat.getName(), cat.getId_cat());
    }
}
