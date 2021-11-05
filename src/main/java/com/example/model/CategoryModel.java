package com.example.model;

public class CategoryModel extends AbstractModel{
    private  int id_cat;
    private String name;

    public CategoryModel() {
    }

    public CategoryModel(int id_cat, String name) {
        this.id_cat = id_cat;
        this.name = name;
    }

    public int getId_cat() {
        return id_cat;
    }

    public void setId_cat(int id_cat) {
        this.id_cat = id_cat;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "CategoryModel{" +
                "id_cat=" + id_cat +
                ", name='" + name + '\'' +
                '}';
    }
}
