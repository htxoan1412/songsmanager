package com.example.dao.impl;

import com.example.mapper.UserMapper;
import com.example.model.UserModel;

import java.util.List;

public class UserDao extends AbstractDao{
    public List<UserModel> selUser(){
        String sql = "select * from user";
        return query(sql,new UserMapper());
    }
    public UserModel checkLogin(String name,String pass){
        String sql = "select * from user where email=? and password=?";
        List<UserModel> list = query(sql,new UserMapper(),name,pass);
        return list.isEmpty() ? null : list.get(0);
    }
    public int insertUser(UserModel user){
        String sql = "insert into user(name,password,email,phone,birthday,action,role) values (?,?,?,?,?,?,?)";
        return insert(sql,user.getName(),user.getPassword(),user.getEmail(),user.getPhone(),user.getBirthday(),user.getAction(),user.getRole());

    }
    public int delUser(int id){
        String sql = "delete from user where id=?";
        return delete(sql,id);
    }
    public UserModel selUserById(int id) {
        String sql = "select * from user where id=?";
        List<UserModel> list = query(sql.toString(), new UserMapper(),id);
        return list.isEmpty() ? null : list.get(0);
    }

    public int updateUser(UserModel user){
        String sql = "update user set name=?,password=?,email= ?,birthday= ?,phone= ?,action= ?,role= ? where id=?";
        return update(sql,user.getName(),user.getPassword(),user.getEmail(),user.getBirthday(),user.getPhone(),user.getAction()
        ,user.getRole(),user.getId());
    }

//    public static void main(String[] args) {
//        UserDao u = new UserDao();
//        UserModel m = new UserModel();
//        m.setName("xoan");
//        m.setPassword("123");
//        m.setPhone("123456789");
//        m.setBirthday("2000-02-02");
//        m.setEmail("xoan@gmail.com");
//        m.setRole("1");
//        m.setAction("1");
//
//        u.updateUser(m);
////        u.selUserById(7);
//       UserModel list =u.selUserById(7);
//
//           System.out.println(list.toString());
//
//    }
}
