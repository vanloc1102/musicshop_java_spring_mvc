/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.musicshop.services;

import com.spring.musicshop.models.Cart;
import com.spring.musicshop.models.CartItem;
import com.spring.musicshop.utils.CartUtil;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

/**
 *
 * @author vanlo
 */
@Service
public class CartService {
    public void showCartOnHeader(Model model, HttpServletRequest request){
        double sum = 0;
        
        Cart myCart = CartUtil.getCartInSession(request);
        List<CartItem> cartList = myCart.getCartItems();
        model.addAttribute("items", cartList);
        for(CartItem cartItem: cartList){
            sum += cartItem.getTotal();
        }
        model.addAttribute("sum",sum);
        
    }
}
