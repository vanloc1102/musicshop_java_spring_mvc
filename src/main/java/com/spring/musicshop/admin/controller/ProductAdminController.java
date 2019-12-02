package com.spring.musicshop.admin.controller;



import com.spring.musicshop.entities.BrandEntity;
import com.spring.musicshop.entities.CategoryEntity;
import com.spring.musicshop.entities.ImageEntity;
import com.spring.musicshop.entities.ProductEntity;
import com.spring.musicshop.entities.TypeEntity;
import com.spring.musicshop.repositories.BrandRepository;
import com.spring.musicshop.repositories.CategoryRepository;
import com.spring.musicshop.repositories.ProductRepository;
import com.spring.musicshop.repositories.TypeRepository;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/")
public class ProductAdminController {

    @Autowired
    ProductRepository productRepository;

    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    BrandRepository brandRepository;
    
    @Autowired
    TypeRepository typeRepository;


    //// show trang add product
    @RequestMapping(value = "/admin/addproduct")
    public String addproduct(Model model) {
        ProductEntity product = new ProductEntity();
        model.addAttribute("product", product);
        return "admin/addproduct";
    }   

    // thêm category
    @RequestMapping(value = "/admin/addproduct", method = RequestMethod.POST)
    public String addProduct(@ModelAttribute("product") ProductEntity product,
                             ModelMap model,
                             @RequestParam("file") MultipartFile file
            , HttpServletRequest httpServletRequest) {
        String path = httpServletRequest.getSession().getServletContext().getRealPath("/") + "resources/upload/";

        try {
            FileUtils.forceMkdir(new File(path));
            File upload = new File(path + file.getOriginalFilename());
            file.transferTo(upload);
        } catch (IOException e) {
            e.printStackTrace();
        }
        ArrayList<ImageEntity> images = new ArrayList<>();
        ImageEntity img = new ImageEntity();
        img.setImageURL(file.getOriginalFilename());
        images.add(img);
        product.setImages(images);
        ProductEntity p = productRepository.save(product);
        if (null != p) {
            model.addAttribute("message", "Update success");
            model.addAttribute("product", product);
        } else {
            model.addAttribute("message", "Update failure");
            model.addAttribute("product", product);
        }
        return "redirect:/admin/listproduct";
    }
    
    // showw select option ở add
    @ModelAttribute("categoryList")
    public List<CategoryEntity> showCaegory(Model model) {
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
    
    @ModelAttribute("typeList")
    public List<TypeEntity> typeList(Model model) {
        List<TypeEntity> typeList =
                (List<TypeEntity>) typeRepository.findAll();
        return typeList;
    }


    // Edit product
    @RequestMapping(value = "/admin/editproduct", method = RequestMethod.GET)
    public String editSupper(@RequestParam("id") int id,
                             ModelMap model) {
        model.addAttribute("product1", productRepository.findOne(id));
        return "admin/editproduct";
    }

    // product by category

    @RequestMapping(value = "/admin/editproduct", method = RequestMethod.POST)
    public String editSupp(@ModelAttribute("product") ProductEntity product, Model model,
                           @RequestParam("file") MultipartFile file
            , HttpServletRequest httpServletRequest) {


        String path = httpServletRequest.getSession().getServletContext().getRealPath("/") + "resources/upload/";


        try {
            FileUtils.forceMkdir(new File(path));
            File upload = new File(path + file.getOriginalFilename());
            file.transferTo(upload);
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        ArrayList<ImageEntity> images = new ArrayList<>();
        ImageEntity img = new ImageEntity();
        img.setImageURL(file.getOriginalFilename());
        images.add(img);
        product.setImages(images);
        ProductEntity cs = productRepository.save(product);
        
        if (null != cs) {
            model.addAttribute("message", "Update success");
            model.addAttribute("product", productRepository.findOne(cs.getProductID()));
        } else {
            model.addAttribute("message", "Update failure");
            model.addAttribute("product", product);
        }
        return "admin/listproduct";
    }


    ///delete Category
    @RequestMapping(value = "deletepro/{id}", method = RequestMethod.GET)
    public String deleteProduct(@PathVariable("id") int id, ModelMap model) {
        productRepository.delete(id);
        return "redirect:/admin/listproduct";
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class,
                new CustomDateEditor(sdf, true));
    }
}
