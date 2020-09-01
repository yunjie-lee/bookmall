package com.lyj.service;

import com.lyj.pojo.Cart;

public interface OrderService {
    public String createOrder(Cart cart,Integer userId);
}
