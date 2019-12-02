/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.musicshop.models;

import com.spring.musicshop.entities.ProductEntity;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author vanlo
 */
public class Cart {
    private final List<CartItem> cartItems = new ArrayList<>();

    public Cart() {
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }
    
    public double totalPriceOfCart(List<CartItem> itemList){
        double totalCost = 0;
        for(CartItem item:itemList){
            totalCost += item.getTotal();
        }
        return totalCost;
    }
    
    CartItem getItem(int id){
        for(CartItem item: cartItems){
            if(id==item.getId()){
                return item;
            }
        }
        return null;
    }
    
    public void addItemToCart(ProductEntity productEntity){
        CartItem cartItem = getItem(productEntity.getProductID());
        if(cartItem == null){
            CartItem item = new CartItem();
            item.setId(productEntity.getProductID());
            item.setName(productEntity.getProductName());
            item.setImage(productEntity.getImages().get(0).getImageURL());
            item.setPrice(productEntity.getProductDetail().getUnitPrice());
            item.setQuantity(1);
            item.setTotal(item.getPrice()*item.getQuantity());
            cartItems.add(item);
        }else{
            cartItem.setQuantity(cartItem.getQuantity() + 1);
        }
    }
    
    public void addItemToCartDetail(ProductEntity productEntity, int quantity){
        CartItem cartItem1 = getItem(productEntity.getProductID());
        if (cartItem1 == null){
            CartItem item1 = new CartItem();
            item1.setId(productEntity.getProductID());
            item1.setImage(productEntity.getImages().get(0).getImageURL());
            item1.setName(productEntity.getProductName());
            item1.setPrice(productEntity.getProductDetail().getUnitPrice());
            item1.setQuantity(quantity);
            item1.setTotal(item1.getPrice()*item1.getQuantity());
            cartItems.add(item1);
        }else {
            cartItem1.setQuantity(cartItem1.getQuantity() + quantity);
            cartItem1.setTotal(cartItem1.getTotal()+ quantity*cartItem1.getPrice());
        }
    }
    
    public void removeItem(ProductEntity productEntity){
        CartItem cartItem = getItem(productEntity.getProductID());
        if(cartItem != null){
            cartItems.remove(cartItem);
        }
    }
    public void updateItemInCart(ProductEntity productEntity, int quantity){
        CartItem cartItem = getItem(productEntity.getProductID());
        cartItem.setQuantity(quantity);
        cartItem.setTotal(quantity*cartItem.getPrice());
    }
}
