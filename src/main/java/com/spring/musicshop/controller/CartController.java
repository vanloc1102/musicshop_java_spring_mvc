/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.musicshop.controller;


import com.spring.musicshop.entities.AccountEntity;
import com.spring.musicshop.entities.CustomerEntity;
import com.spring.musicshop.models.Cart;
import com.spring.musicshop.repositories.CustomerRepository;
import com.spring.musicshop.repositories.ProductRepository;
import com.spring.musicshop.services.CartService;
import com.spring.musicshop.services.CategoryService;
import com.spring.musicshop.utils.CartUtil;
import java.util.ArrayList;
import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

/**
 *
 * @author vanlo
 */
@Controller
@RequestMapping(value= "/cart")
public class CartController {
    
    @Autowired
    ProductRepository productRepository;
    
    @Autowired
    CartService cartService;
    
    @Autowired
    CategoryService categoryService;
    
    @Autowired
    CustomerRepository customerRepository;
    
    @RequestMapping(method = RequestMethod.GET)
    public String viewCart(HttpServletRequest request, Model model){
        Cart myCart = CartUtil.getCartInSession(request);
        model.addAttribute("items",myCart.getCartItems());
        double totalP = myCart.totalPriceOfCart(myCart.getCartItems());
        model.addAttribute("totalP", totalP);
        cartService.showCartOnHeader(model, request);
        categoryService.showDropDownInHeader(model);
        AccountEntity accountEntity = (AccountEntity) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = accountEntity.getUsername();
        CustomerEntity customer = customerRepository.findByAccountUsernameIgnoreCase(username);            
        model.addAttribute("customer",customer);
        
        return "cart";
    }
    
    @RequestMapping(value = "/add/{id}", method = RequestMethod.GET)
    public String addCart(HttpServletRequest request, @PathVariable int id){
        Cart myCart = CartUtil.getCartInSession(request);
        myCart.addItemToCart(productRepository.findOne(id));
        return "redirect:/cart";
    }
    
    @RequestMapping(value = "/addDetail/{id}", method = RequestMethod.GET)
    public String addCart1(HttpServletRequest request, @PathVariable int id, Model model){
        Cart myCart = CartUtil.getCartInSession(request);
        int quantity = Integer.parseInt(request.getParameter("product-quantity"));
        myCart.addItemToCartDetail(productRepository.findOne(id), quantity);
        cartService.showCartOnHeader(model, request);
        categoryService.showDropDownInHeader(model);
        return "redirect:/cart";
    }
    
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String deleteCart(HttpServletRequest request, @PathVariable int id){
        Cart myCart = CartUtil.getCartInSession(request);
        myCart.removeItem(productRepository.findOne(id));
        return "redirect:/cart";
    }
    
    @RequestMapping(value = "/update",method = POST)
    public String updateCart(HttpServletRequest request){
        ArrayList<String> parameterNams = new  ArrayList<>();
        Enumeration enumeration = request.getParameterNames();
        while (enumeration.hasMoreElements()){
            String parameterName = (String) enumeration.nextElement();
            parameterNams.add(parameterName);
        }
        Cart myCart;
        for ( int i= 0;i<parameterNams.size(); i+=2){
            String id = request.getParameter(parameterNams.get(i));
            String quantity = request.getParameter(parameterNams.get(i+1));

            myCart = CartUtil.getCartInSession(request);
            myCart.updateItemInCart(productRepository.findOne(Integer.parseInt(id)),Integer.parseInt(quantity));
        }
        return "redirect:/cart";

    }

}
