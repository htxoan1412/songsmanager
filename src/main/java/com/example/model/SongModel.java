package com.example.model;

import java.sql.Timestamp;

public class SongModel extends AbstractModel{
    private int id;
    private String image;
    private String name;
    private String description;
    private String content;
    private Timestamp date_create;
    private int listens;
    private int id_cat;
    private CategoryModel cat;

    public CategoryModel getCat() {
        return cat;
    }

    public void setCat(CategoryModel cat) {
        this.cat = cat;
    }

    public Timestamp getDate_create() {
        return date_create;
    }

    public void setDate_create(Timestamp date_create) {
        this.date_create = date_create;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }


    public int getListens() {
        return listens;
    }

    public void setListens(int listens) {
        this.listens = listens;
    }

    public int getId_cat() {
        return id_cat;
    }

    public void setId_cat(int id_cat) {
        this.id_cat = id_cat;
    }

    @Override
    public String toString() {
        return "SongModel{" +
                "id=" + id +
                ", image='" + image + '\'' +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", content='" + content + '\'' +
                ", date_create=" + date_create +
                ", listens=" + listens +
                ", id_cat=" + id_cat +
                '}';
    }
}
