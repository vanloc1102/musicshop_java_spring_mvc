package com.spring.musicshop.admin.controller;

import com.spring.musicshop.entities.BrandEntity;
import com.spring.musicshop.repositories.BrandRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/")
public class SuppliersProduct {


    @Autowired
    BrandRepository brandRepository;


    @RequestMapping(value = "/admin/addsuppliers")
    public String addproduct(Model model) {
        BrandEntity supplier = new BrandEntity();
        model.addAttribute("supplier", supplier);
        return "admin/addsuppliers";
    }


 // thêm supplier
    @RequestMapping(value = "/admin/addsuppliers", method = RequestMethod.POST)
    public String addCourse(@Validated @ModelAttribute("supplier") BrandEntity supplier,
                            ModelMap model,
                            BindingResult bindingResult) {
        BrandEntity c = brandRepository.save(supplier);
        if (bindingResult.hasErrors()) {

            model.addAttribute("message", "Please");
            return "/admin/addsupplier";

        } else {

            model.addAttribute("message", "Success");
        }
        return "admin/tablelist";
    }


    // Edit category
    @RequestMapping(value = "/admin/editsuppliers", method = RequestMethod.GET)
    public String editSupper(@RequestParam("id") int id,
                             ModelMap model) {
        model.addAttribute("supplier1", brandRepository.findOne(id));
        return "admin/editsuppliers";
    }

    @RequestMapping(value = "/admin/editsuppliers", method = RequestMethod.POST)
    public String editSupp(@ModelAttribute("supplier") BrandEntity supplier, Model model, RedirectAttributes rs) {
        BrandEntity cs = brandRepository.save(supplier);
        if (null != cs) {
            model.addAttribute("message", "Update success");
            model.addAttribute("category", brandRepository.findOne(cs.getBrandID()));
        } else {
            model.addAttribute("message", "Update failure");
            model.addAttribute("category", supplier);
        }
        return "admin/tablelist";
    }
     

    ///delete Category
    @RequestMapping(value = "deletesup/{id}", method = RequestMethod.GET)
    public String deletesup(@PathVariable("id") int id, ModelMap model) {
        brandRepository.delete(id);
        return "redirect:/admin/tablelist";
    }

}
