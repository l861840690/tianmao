package com.tianmao.service;

import com.tianmao.pojo.Product;
import com.tianmao.pojo.PropertyValue;

import java.util.List;

public interface PropertyValueService {
    void init(Product p);
    void update(PropertyValue pv);

    PropertyValue get(int ptid, int pid);
    List<PropertyValue> list(int pid);
}

