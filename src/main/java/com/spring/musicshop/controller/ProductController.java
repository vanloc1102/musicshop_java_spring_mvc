/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.musicshop.controller;


import com.spring.musicshop.entities.ImageEntity;
import com.spring.musicshop.entities.ProductEntity;
import com.spring.musicshop.entities.TypeEntity;
import com.spring.musicshop.models.Cart;
import com.spring.musicshop.repositories.ImageRepository;
import com.spring.musicshop.repositories.ProductDetailRepository;
import com.spring.musicshop.repositories.ProductRepository;
import com.spring.musicshop.repositories.TypeRepository;
import com.spring.musicshop.services.CartService;
import com.spring.musicshop.services.CategoryService;
import com.spring.musicshop.utils.CartUtil;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author vanlo
 */
@Controller
@RequestMapping(value = "/product")
public class ProductController {
    @Autowired
    CategoryService categoryService;
    
    @Autowired
    ProductRepository productRepository;
    
    @Autowired
    ProductDetailRepository productDetailRepository;
    
    @Autowired
    CartService cartService;
    
    
    @Autowired
    ImageRepository imageRepository;
    
    @Autowired
    TypeRepository typeRepository;
    
    private static final int dataPerPage = 9;
    private static int totalPages = 0;
    
    @RequestMapping(method = RequestMethod.GET)
    public String viewProduct(Model model, HttpServletRequest request,
            @RequestParam(value = "page",required = false,defaultValue = "1") String page){
        Cart myCart = CartUtil.getCartInSession(request);
        model.addAttribute("items", myCart.getCartItems());
        int selectedPage = Integer.valueOf(page);
        model.addAttribute("productList", getProductsPerPage(selectedPage));
        model.addAttribute("startPage", selectedPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("visiblePages", totalPages > 3 ? (totalPages / 2) : totalPages);
        categoryService.showDropDownInHeader(model);
        cartService.showCartOnHeader(model, request);
        return "product";
    }
    
    @RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
    public String viewProductDetail(Model model, @PathVariable int id, HttpServletRequest request){
        categoryService.showDropDownInHeader(model);
        cartService.showCartOnHeader(model, request);
        List<ImageEntity> imageList = (List<ImageEntity>)imageRepository.findByProductProductID(id);
        model.addAttribute("images", imageList);
        TypeEntity getType = typeRepository.findByProductsProductID(id);
        List<ProductEntity> relatedProducts = (List<ProductEntity>)productRepository.findByTypeTypeName(getType.getTypeName());
        model.addAttribute("related",relatedProducts);
        
        return "product-detail";        
        
}        
    
    
    private List<ProductEntity> getProductsPerPage(int page){
        List<ProductEntity> productList = (List<ProductEntity>) productRepository.findAll();
        totalPages = (int) Math.ceil((double)productList.size() / dataPerPage);
        int start = (page - 1) * dataPerPage;
        int end = start + dataPerPage;
        if(end >= productList.size()){
            end = productList.size();
        }
        
        List<ProductEntity> productsPerPage = new ArrayList<>();
        for(int i = start; i < end; i++){
            productsPerPage.add(productList.get(i));
        }
        return productsPerPage;
    }
    
    
}
