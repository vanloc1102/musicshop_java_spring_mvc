/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.musicshop.controller;


import com.spring.musicshop.entities.ProductEntity;
import com.spring.musicshop.repositories.ProductRepository;
import com.spring.musicshop.services.CartService;
import com.spring.musicshop.services.CategoryService;
import java.util.ArrayList;
import java.util.Iterator;
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
@RequestMapping("/filter")
public class FilterAndSearchController { 
    @Autowired
    ProductRepository productRepository;
    
    @Autowired
    CategoryService categoryService;
    
    @Autowired
    CartService cartService;
    
    @RequestMapping(value = "/category={categoryName}", method = RequestMethod.GET)
    public String categoryFilter(Model model, @PathVariable String categoryName, HttpServletRequest request){
        List<ProductEntity> productCategoryFiltered = productRepository.findByCategoryCategoryName(categoryName);
        model.addAttribute("productList", productCategoryFiltered);
        categoryService.showDropDownInHeader(model);
        cartService.showCartOnHeader(model, request);
        return "product";
    }
    
    @RequestMapping(value = "/price", method = RequestMethod.GET)
    public String priceFilter(Model model, @RequestParam(value = "price-min") float min,
            @RequestParam(value = "price-max") float max){
        List<ProductEntity> productPriceFiltered = productRepository.findByProductDetailUnitPriceBetween(min, max);
        model.addAttribute("productList", productPriceFiltered);    
        return "product";
    }
    
    @RequestMapping(value = "/price=sort-asc", method = RequestMethod.GET)
    public String priceFilterOldest(Model model, @RequestParam(value = "price-min") float min,
            @RequestParam(value = "price-max") float max){
        List<ProductEntity> productPriceFiltered = productRepository.findByProductDetailUnitPriceBetweenOrderByProductDetailUnitPriceAsc(min, max);
        model.addAttribute("productList", productPriceFiltered);
        return "product";
    }
    
    @RequestMapping(value = "/price=sort-desc", method = RequestMethod.GET)
    public String priceFilterNewest(Model model, @RequestParam(value = "price-min") float min,
            @RequestParam(value = "price-max") float max){
        List<ProductEntity> productPriceFiltered = productRepository.findByProductDetailUnitPriceBetweenOrderByProductDetailUnitPriceDesc(min, max);
        model.addAttribute("productList", productPriceFiltered);
        return "product";
    }
    
    @RequestMapping(value = "/brand={brandName}", method = RequestMethod.GET)
    public String brandFilter(Model model, @PathVariable String brandName, HttpServletRequest request){
        List<ProductEntity> productBrandFiltered = productRepository.findByBrandBrandName(brandName);
        model.addAttribute("productList", productBrandFiltered);
        categoryService.showDropDownInHeader(model);
        cartService.showCartOnHeader(model, request);
        return "product";
    }
    
    @RequestMapping(value = "/type={typeName}", method = RequestMethod.GET)
    public String typeFilter(Model model, @PathVariable String typeName){
        List<ProductEntity> productTypeFiltered = productRepository.findByTypeTypeName(typeName);
        model.addAttribute("productList", productTypeFiltered);
        return "product";
    }
    
    @RequestMapping(value = "/newest", method = RequestMethod.GET)
    public String publishDescFilter(Model model){
        List<ProductEntity> productDescFiltered = productRepository.findByOrderByProductDetailPublishedDateDesc();
        model.addAttribute("productList", productDescFiltered);
        return "product";
    }
    
    @RequestMapping(value = "/oldest", method = RequestMethod.GET)
    public String publishAscFilter(Model model){
        List<ProductEntity> productAscFiltered = productRepository.findByOrderByProductDetailPublishedDateAsc();
        model.addAttribute("productList", productAscFiltered);
        return "product";
    }
    
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(@RequestParam(value = "searchInput") String searchInput, Model model, HttpServletRequest request){
        categoryService.showDropDownInHeader(model);
        cartService.showCartOnHeader(model, request);
        List<ProductEntity> resultList;
        if(searchInput.isEmpty()){
            resultList = (List<ProductEntity>)productRepository.findAll();
        }else{
            resultList = productRepository.findByProductNameContaining(searchInput);
        }
        model.addAttribute("productList", resultList);
        return "product";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String filterByQuery(Model model,
            @RequestParam(value = "brand") String brand,
            @RequestParam(value = "type") String type,
            @RequestParam(value = "price-min") float min,
            @RequestParam(value = "price-max") float max){
        categoryService.showDropDownInHeader(model);
        List<ProductEntity> productList = (List<ProductEntity>)productRepository.findAll();
        List<ProductEntity> selectedProductList = new ArrayList<>();
        
        String[] brands = new String[0];
        String[] types = new String[0];
        
        if(brand != "") brands = brand.split(",");
        if(type != "") types = type.split(",");
        
        for(Iterator<ProductEntity> ls = productList.iterator(); 
                ls.hasNext(); ){
            ProductEntity product = ls.next();
            
            if(product.getProductDetail().getUnitPrice() >= min && product.getProductDetail().getUnitPrice() <= max){
                if(brands.length != 0 && types.length != 0){
                    for(int i = 0; i < brands.length; i++){
                        if(product.getBrand().getBrandName().equalsIgnoreCase(brands[i])){
                           for(int j = 0; j < types.length; j++){
                               if(product.getType().getTypeName().equalsIgnoreCase(types[i])){
                                   selectedProductList.add(product);
                               }
                           } 
                        }
                    }
                }
                if (brands.length ==0 && types.length !=0){

                    for (int j = 0; j < types.length; j++){
                        if (product.getType().getTypeName().equalsIgnoreCase(types[j])){
                            selectedProductList.add(product);                            
                        }
                    }
                }
                if (brands.length != 0 && types.length == 0){
                    for (int i = 0; i < brands.length; i++) {
                        if (product.getBrand().getBrandName().equalsIgnoreCase(brands[i])){
                             selectedProductList.add(product);                           
                        }
                    }
                }

                if (brands.length == 0 && types.length == 0) selectedProductList.add(product);
            }
        }
        model.addAttribute("productList", selectedProductList);
        return "product";
    }       
}
