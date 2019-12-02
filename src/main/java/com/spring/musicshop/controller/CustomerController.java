/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.musicshop.controller;


import com.spring.musicshop.entities.AccountEntity;
import com.spring.musicshop.entities.AccountRoleEntity;
import com.spring.musicshop.entities.ConfirmationTokenEntity;
import com.spring.musicshop.entities.CustomerEntity;
import com.spring.musicshop.enums.AccountRole;
import com.spring.musicshop.repositories.AccountRoleRepository;
import com.spring.musicshop.repositories.BannerRepository;
import com.spring.musicshop.repositories.ConfirmationTokenRepository;
import com.spring.musicshop.repositories.CustomerRepository;
import com.spring.musicshop.repositories.ProductRepository;
import com.spring.musicshop.repositories.SubBannerRepository;
import com.spring.musicshop.services.CartService;
import com.spring.musicshop.services.CategoryService;
import com.spring.musicshop.services.CustomerService;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CustomerController {

    @Autowired
    CategoryService categoryService;

    @Autowired
    CartService cartService;

    @Autowired
    BannerRepository bannerRepository;

    @Autowired
    SubBannerRepository subBannerRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    CustomerService customerService;

    @Autowired
    CustomerRepository customerRepository;
    
    @Autowired
    ConfirmationTokenRepository confirmationTokenRepository;
    
    @Autowired
    AccountRoleRepository accountRoleRepository;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showSignUpPage(Model model, HttpServletRequest request,HttpSession session,
        @RequestParam(value = "isError", required = false) boolean isError) {
        model.addAttribute("customer", new CustomerEntity());
        cartService.showCartOnHeader(model, request);
        categoryService.showDropDownInHeader(model);                        
        if (isError) {
            model.addAttribute("errorSignIn", "Login failed. Incorrect user name or password");           
        }      
        return "login";
    }
    
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerUser(CustomerEntity customer, Model model){
        boolean isEmailExisting = customerService.isEmailExisting(customer.getEmail());
        boolean isUsernameExisting = customerService.isUserNameExisting(customer.getAccount().getUsername());
        
        if(isEmailExisting){
            model.addAttribute("errorSignUp", "Email <" + customer.getEmail() + "> already existing");
            customer.setEmail("");
            model.addAttribute("customer", customer);
            return "login";
        }else if(isUsernameExisting){
            model.addAttribute("errorSignUp", "Username <" + customer.getAccount().getUsername() + "> already existing");
            customer.getAccount().setUsername("");
            model.addAttribute("customer", customer);
            return "login"; 
        } else{           
            ArrayList<AccountRoleEntity> roles = new ArrayList<>();
            roles.add(new AccountRoleEntity());
            AccountEntity acc = customer.getAccount();
            acc.setAccountRoles(roles);
            customer.setAccount(acc);
            customerRepository.save(customer);
            
            ConfirmationTokenEntity confirmationToken = new ConfirmationTokenEntity(customer);
            confirmationTokenRepository.save(confirmationToken);
            
            customerService.sendActivationEmail(customer, confirmationToken);   
            model.addAttribute("message", "Thanks for your registration. Please go to your mailbox to activate your account.");
            model.addAttribute("cssBootstrap", "alert-success");
            
        }
        return "register-success";
    }
    
    @RequestMapping(value = "/active-account", method = RequestMethod.GET)
    public String activeAccount(Model model, @RequestParam("token")String confirmationToken){
        ConfirmationTokenEntity token = confirmationTokenRepository.findByConfirmationToken(confirmationToken);
        
        if(token != null){
            CustomerEntity customer = customerRepository.findByEmailIgnoreCase(token.getCustomer().getEmail());
            customer.getAccount().setIsEnabled(true);
            customerRepository.save(customer);
            model.addAttribute("message", "Your account is verified.Please login to enjoy our services.");
            model.addAttribute("cssBootstrap", "alert-success");           
        }
        else{
            model.addAttribute("message", "The link is invalid or broken");
            model.addAttribute("cssBootstrap", "alert-success"); 
        }
        return "register-success";
    }
   
}
