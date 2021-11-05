package com.example.dao;

import com.example.mapper.RowMapper;

import java.sql.Connection;
import java.util.List;

public interface GenericDao {
    Connection getConnection();
    <T> List<T> query(String sql, RowMapper<T> rowMapper, Object... parameters);
    int delete(String sql, Object... parameters);
    int insert(String sql, Object... parameters);
    int update(String sql, Object... parameters);
    int count(String sql, Object... parameters);
}
