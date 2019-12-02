package com.spring.musicshop.admin.controller;


import com.spring.musicshop.entities.BrandEntity;
import com.spring.musicshop.entities.CategoryEntity;
import com.spring.musicshop.entities.ProductEntity;
import com.spring.musicshop.repositories.BrandRepository;
import com.spring.musicshop.repositories.CategoryRepository;
import com.spring.musicshop.repositories.OrderDetailRepository;
import com.spring.musicshop.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;


@Controller
@RequestMapping(value = "/")
public class AdminController {

    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    BrandRepository brandRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    OrderDetailRepository orderDetailRepository;



    @RequestMapping(value = "/admin/user")
    public String admin(Model model) {

        return "admin/user";
    }


    // Hiển thị ListProduct ở trang admin
    @RequestMapping(value = "/admin/listproduct")
    public String listProduct(Model model) {
        List<ProductEntity> list = (List<ProductEntity>) productRepository.findAll();
        model.addAttribute("productList", list);
        return "admin/listproduct";
    }


    @RequestMapping(value = "/admin/tablelist")
    public String tables(Model model) {

        return "admin/tablelist";
    }



    // show check out page
    @RequestMapping(value = "/admin/addcategory")
    public String checkOut(Model model) {
        CategoryEntity category = new CategoryEntity();
        model.addAttribute("category", category);
        return "admin/addcategory";
    }


    // thêm category
    @RequestMapping(value = "/admin/addcategory", method = RequestMethod.POST)
    public String addCourse(@Validated @ModelAttribute("category") CategoryEntity category,
                            ModelMap model,
                            BindingResult bindingResult) {
        CategoryEntity c = categoryRepository.save(category);
        if (bindingResult.hasErrors()) {

            model.addAttribute("message", "Please");
            return "/admin/addcategory";

        } else {

            model.addAttribute("message", "Success");
        }
        return "admin/tablelist";
    }


    /// list category ở table list
    @ModelAttribute("categoryList")
    public List<CategoryEntity> showCategory(Model model) {
        List<CategoryEntity> categoryList =
                (List<CategoryEntity>) categoryRepository.findAll();
        return categoryList;
    }

    @ModelAttribute("supplierList")
    public List<BrandEntity> supplierList(Model model) {
        List<BrandEntity> supplierList =
                (List<BrandEntity>) brandRepository.findAll();
        return supplierList;
    }

    @ModelAttribute("productList")
    public List<ProductEntity> showproduct(Model model) {
        List<ProductEntity> productList =
                (List<ProductEntity>) productRepository.listproductdesc();
        return productList;
    }

    // Edit category
    @RequestMapping(value = "/admin/editCategory", method = RequestMethod.GET)
    public String editCategory(@RequestParam("id") int id,
                               ModelMap model) {
        model.addAttribute("category1", categoryRepository.findOne(id));
        return "admin/editcategory";
    }

    @RequestMapping(value = "/admin/editCategory", method = RequestMethod.POST)
    public String editStudent(@ModelAttribute("category") CategoryEntity category, Model model, RedirectAttributes rs) {
        CategoryEntity cs = categoryRepository.save(category);
        if (null != cs) {
            model.addAttribute("message", "Update success");
            model.addAttribute("category", categoryRepository.findOne(cs.getCategoryID()));
        } else {
            model.addAttribute("message", "Update failure");
            model.addAttribute("category", category);
        }
        return "admin/tablelist";
    }

    /// delete Category
    @RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
    public String addCourse(@PathVariable("id") int id, ModelMap model) {
        categoryRepository.delete(id);
        return "redirect:/admin/tablelist";
    }






}
