package com.example.dao;

import com.example.model.CategoryModel;

import java.util.List;

public interface ICategoryDao extends GenericDao{
    List<CategoryModel> selCat();
    CategoryModel selCatById(int id);
    int delCat(int id);
    int insertCat(CategoryModel cat);
    int updateCat(CategoryModel cat);
}
