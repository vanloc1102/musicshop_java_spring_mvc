/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.musicshop.controller;

import com.spring.musicshop.entities.AccountEntity;
import com.spring.musicshop.entities.BannerEntity;
import com.spring.musicshop.entities.CustomerEntity;
import com.spring.musicshop.entities.ProductEntity;
import com.spring.musicshop.entities.SubBannerEntity;
import com.spring.musicshop.models.Cart;
import com.spring.musicshop.repositories.BannerRepository;
import com.spring.musicshop.repositories.CustomerRepository;
import com.spring.musicshop.repositories.ProductDetailRepository;
import com.spring.musicshop.repositories.ProductRepository;
import com.spring.musicshop.repositories.SubBannerRepository;
import com.spring.musicshop.services.CartService;
import com.spring.musicshop.services.CategoryService;
import com.spring.musicshop.utils.CartUtil;
import java.security.Principal;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = {"/", "home"})
public class HomeController {
    
    @Autowired
    CategoryService categoryService;
    
    @Autowired
    BannerRepository bannerRepository;
    
    @Autowired
    SubBannerRepository subBannerRepository;
    
    @Autowired
    ProductRepository productRepository;
    
    @Autowired
    ProductDetailRepository productDetailRepository;
    
    @Autowired
    CartService cartService;
    
    @Autowired
    CustomerRepository customerRepository;
    
    @RequestMapping(method = RequestMethod.GET)
    public String viewHome(Model model, HttpServletRequest request, Principal principal) {      
        categoryService.showDropDownInHeader(model);
        List<BannerEntity> bannerList = (List<BannerEntity>)bannerRepository.findAll();
        model.addAttribute("bannerList", bannerList);
        List<SubBannerEntity> subbannerList = (List<SubBannerEntity>)subBannerRepository.findAll();
        model.addAttribute("subbannerList", subbannerList);
        List<ProductEntity> top8NewestProduct = (List<ProductEntity>)productRepository.findTop8ByOrderByProductDetailPublishedDateDesc();
        model.addAttribute("top8NewestProduct", top8NewestProduct);
        List<ProductEntity> top8HotProduct = (List<ProductEntity>)productRepository.findTop8ByOrderByProductDetailOrderedQuantityDesc();
        model.addAttribute("top8HotProduct", top8HotProduct);
        
        Cart myCart = CartUtil.getCartInSession(request);
        model.addAttribute("items", myCart.getCartItems());
        cartService.showCartOnHeader(model, request);
        if (principal != null && !(principal instanceof AnonymousAuthenticationToken)) {
            AccountEntity accountEntity = (AccountEntity) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            String username = accountEntity.getUsername();
            CustomerEntity customer = customerRepository.findByAccountUsernameIgnoreCase(username);            
            model.addAttribute("customer",customer);
        }   
        return "home";
    }   
    
    
    @RequestMapping(value = "blog")
    public String viewBlog(Model model){
        categoryService.showDropDownInHeader(model);
        return "blog";
    }
    
    @RequestMapping(value = "contact")
    public String viewContact(Model model){
        categoryService.showDropDownInHeader(model);
        return "contact";
    }
    
    @RequestMapping(value = "about-us")
    public String viewAbout(Model model){
        categoryService.showDropDownInHeader(model);
        return "about-us";
    }
    
    @RequestMapping(value = "FAQ")
    public String viewFAQ(Model model){
        categoryService.showDropDownInHeader(model);
        return "FAQ";
    }
}
