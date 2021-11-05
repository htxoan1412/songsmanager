package com.example.service.impl;


import com.example.dao.ICategoryDao;
import com.example.dao.impl.CategoryDao;
import com.example.model.CategoryModel;
import com.example.service.ICategoryService;

import java.util.List;

public class CategoryService implements ICategoryService {
    private ICategoryDao categoryDao= new CategoryDao();

    @Override
    public List<CategoryModel> selCat() {
        return categoryDao.selCat();
    }
}
