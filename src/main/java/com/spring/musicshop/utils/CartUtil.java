/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.musicshop.utils;

import com.spring.musicshop.models.Cart;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author vanlo
 */

public class CartUtil {
    public static Cart getCartInSession(HttpServletRequest request){
        
        // Get Cart from Session
        Cart cartInfor = (Cart)request.getSession().getAttribute("myCart");
        
        // If null, create it
        if(cartInfor == null){
            cartInfor = new Cart();
            
            //Store in session           
            request.getSession().setAttribute("myCart",cartInfor);
        }
        
        return cartInfor;
    }
    
}
