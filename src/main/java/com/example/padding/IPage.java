package com.example.padding;

import com.example.sort.Sorter;

public interface IPage {
    Integer getPag();
    Integer getOffset();
    Integer getLimit();
    Sorter getSorter();
}
