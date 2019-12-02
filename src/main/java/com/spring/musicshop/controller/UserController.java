/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.musicshop.controller;

import com.spring.musicshop.entities.AccountEntity;
import com.spring.musicshop.entities.CustomerEntity;
import com.spring.musicshop.entities.CustomerProfileEntity;
import com.spring.musicshop.entities.OrderDetailEntity;
import com.spring.musicshop.entities.OrderEntity;
import com.spring.musicshop.repositories.AccountRepository;
import com.spring.musicshop.repositories.CustomerProfileRepository;
import com.spring.musicshop.repositories.CustomerRepository;
import com.spring.musicshop.repositories.OrderDetailRepository;
import com.spring.musicshop.repositories.OrderRepository;
import com.spring.musicshop.services.CartService;
import com.spring.musicshop.services.CategoryService;
import com.spring.musicshop.services.CustomerService;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author vanlo
 */
@Controller
@RequestMapping("/user")
public class UserController {
    
    @Autowired
    CustomerProfileRepository customerProfileRepository;

    @Autowired
    CustomerRepository customerRepository;

    @Autowired
    CustomerService customerService;
    
    @Autowired
    CartService cartService;
    
    @Autowired
    CategoryService categoryService;
    
    @Autowired
    AccountRepository accountRepository;
    
    @Autowired
    OrderRepository orderRepository;
    
    @Autowired
    OrderDetailRepository orderDetailRepository;
    
    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String showProfile(Model model, HttpServletRequest request){
        cartService.showCartOnHeader(model, request);
        categoryService.showDropDownInHeader(model);
        AccountEntity accountEntity = (AccountEntity) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = accountEntity.getUsername();
        CustomerEntity customer = customerRepository.findByAccountUsernameIgnoreCase(username);            
        model.addAttribute("customer",customer);
        
        return "user-profile";
    }
    
    @RequestMapping(value = "/address", method = RequestMethod.GET)
    public String showAddress(Model model, HttpServletRequest request){
        cartService.showCartOnHeader(model, request);
        categoryService.showDropDownInHeader(model);
        AccountEntity accountEntity = (AccountEntity) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = accountEntity.getUsername();
        CustomerEntity customer = customerRepository.findByAccountUsernameIgnoreCase(username);
        model.addAttribute("customer",customer);
        CustomerProfileEntity customerProfile = customerRepository.findByAccountUsernameIgnoreCase(username).getCustomerProfile();            
        model.addAttribute("profile",customerProfile);
        
        return "user-address";
    }
    
    @RequestMapping(value = "/orders", method = RequestMethod.GET)
    public String showOrders(Model model, HttpServletRequest request){
        cartService.showCartOnHeader(model, request);
        categoryService.showDropDownInHeader(model);
        AccountEntity accountEntity = (AccountEntity) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = accountEntity.getUsername();
        CustomerEntity customer = customerRepository.findByAccountUsernameIgnoreCase(username);
        model.addAttribute("customer",customer);
        List<OrderEntity> orderCustomer = orderRepository.findByEmailOrderByOrderDateDesc(customer.getEmail());
        model.addAttribute("orderCustomer",orderCustomer);
        return "user-orderlist";
    }
    
    @RequestMapping(value = "/orders/detail/{id}", method = RequestMethod.GET)
    public String viewOrder(@PathVariable int id, Model model, HttpServletRequest request){
        cartService.showCartOnHeader(model, request);
        categoryService.showDropDownInHeader(model);
        AccountEntity accountEntity = (AccountEntity) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = accountEntity.getUsername();
        CustomerEntity customer = customerRepository.findByAccountUsernameIgnoreCase(username);
        model.addAttribute("customer",customer);
        model.addAttribute("order", orderRepository.findOne(id));
        List<OrderDetailEntity> orderDetailList = orderDetailRepository.findByOrderOrderID(id);
        model.addAttribute("orderDetailList",orderDetailList);
        return "user-orderdetail";
    }
            
    
    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public String uploadFileHandler(
            @RequestParam("file") MultipartFile file,HttpServletRequest request,Model model) {
        AccountEntity accountEntity = (AccountEntity) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = accountEntity.getUsername();
        CustomerEntity customer = customerRepository.findByAccountUsernameIgnoreCase(username);

        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                // Creating the directory to store file
                ServletContext context = request.getServletContext();
                String pathUrl = context.getRealPath("/upload");

                int index = pathUrl.indexOf("target");
                String pathFolder = pathUrl.substring(0, index) + "src\\main\\webapp\\resources\\upload\\";
                Path path = Paths.get(pathFolder + file.getOriginalFilename());
                Files.write(path, bytes);

                // sau khi upload file xong lấy file name ra để insert vào database
                String name = file.getOriginalFilename();

                customer.setCustomerImg(name);
                customerRepository.save(customer);
                model.addAttribute("customer",customer);
                return "redirect:/user/profile";
            } catch (IOException e) {
                return "You failed to upload " + " => " + e.getMessage();
            }
        } else {
            return "You failed to upload "
                    + " because the file was empty.";
        }       
    }
    
    @RequestMapping(value = "/change-password", method = RequestMethod.POST)
    public String changePassword(@RequestParam("password_old") String oldPassword,
                                 @RequestParam("password_1") String newPassword,
                                 @RequestParam("password_2") String renewPassword,
                                 Model model, HttpServletRequest request) {
        AccountEntity accountEntity = (AccountEntity) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String currentPassword = accountEntity.getPassword();
        if (!oldPassword.equalsIgnoreCase(currentPassword)) {
            model.addAttribute("errorSignIn", "Password change failed. Incorrect current password");
            model.addAttribute("cssBootstrap", "alert-danger");
            showProfile(model, request);
            return "user-profile";
        } else {
            if (!renewPassword.equals(newPassword)) {
                model.addAttribute("errorSignIn", "Password change failed. New passwords do not match");
                model.addAttribute("cssBootstrap", "alert-danger");
                showProfile(model, request);
                return "user-profile";
            } else {
                accountRepository.updatePassword(newPassword, accountEntity.getUsername());
                model.addAttribute("errorSignIn", "Change password successfully. please login Again.");
                model.addAttribute("cssBootstrap", "alert-success");
                showProfile(model, request);
                return "user-profile";
            }
        }
    }

    @RequestMapping(value = "/update-profile", method = RequestMethod.POST)
    public String updateProfile(@RequestParam("firstName") String firstName,
                                @RequestParam("lastName") String lastName,
                                Model model, HttpServletRequest request) {
        AccountEntity accountEntity = (AccountEntity) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = accountEntity.getUsername();
        int customerID = customerRepository.findByAccountUsernameIgnoreCase(username).getCustomerID();
        
        customerRepository.updateProfile(firstName, lastName, customerID);
        showProfile(model, request);
        return "redirect:/user/profile";
    }
    
    @RequestMapping(value = "/update-address", method = RequestMethod.POST)
    public String updateAddress(@RequestParam("zip")int zip,
            @RequestParam("phone")int phone,
            @RequestParam("address")String address,
            @RequestParam("country")String country,
            Model model, HttpServletRequest request){
        AccountEntity accountEntity = (AccountEntity) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = accountEntity.getUsername();
        int customerProfileID = customerRepository.findByAccountUsernameIgnoreCase(username).getCustomerProfile().getCustomerProfileID();
        
        customerProfileRepository.updateProfile(zip, phone, address, country, customerProfileID);
        showAddress(model, request);
        return "redirect:/user/address";
    }
    
}
