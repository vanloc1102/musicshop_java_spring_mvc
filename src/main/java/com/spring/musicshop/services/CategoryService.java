package com.spring.musicshop.services;

import com.spring.musicshop.entities.BrandEntity;
import com.spring.musicshop.entities.CategoryEntity;
import com.spring.musicshop.entities.TypeEntity;
import com.spring.musicshop.repositories.BrandRepository;
import com.spring.musicshop.repositories.CategoryRepository;
import com.spring.musicshop.repositories.TypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service
public class CategoryService {

    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    BrandRepository brandRepository;

    @Autowired
    TypeRepository typeRepository;

    public void showDropDownInHeader(Model model){
        List<CategoryEntity> categoryList = (List<CategoryEntity>) categoryRepository.findAll();
        model.addAttribute("categoryList",categoryList);
        List<BrandEntity> brandList = (List<BrandEntity>) brandRepository.findAll();
        model.addAttribute("brandList",brandList);
        List<TypeEntity> typeList = (List<TypeEntity>) typeRepository.findAll();
        model.addAttribute("typeList",typeList);
    }

}
