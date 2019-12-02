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
import com.spring.musicshop.entities.ProductDetailEntity;
import com.spring.musicshop.models.Cart;
import com.spring.musicshop.models.CartItem;
import com.spring.musicshop.repositories.CustomerProfileRepository;
import com.spring.musicshop.repositories.CustomerRepository;
import com.spring.musicshop.repositories.OrderDetailRepository;
import com.spring.musicshop.repositories.OrderRepository;
import com.spring.musicshop.repositories.ProductDetailRepository;
import com.spring.musicshop.repositories.ProductRepository;
import com.spring.musicshop.services.CartService;
import com.spring.musicshop.services.CategoryService;
import com.spring.musicshop.services.CustomerService;
import com.spring.musicshop.utils.CartUtil;
import java.security.Principal;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author vanlo
 */
@Controller
public class CheckoutController {
    
    @Autowired
    ProductRepository productRepository;

    @Autowired
    CustomerRepository customerRepository;

    @Autowired
    CustomerProfileRepository customerProfileRepository;

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    OrderDetailRepository orderDetailRepository;

    @Autowired
    CartService cartService;

    @Autowired
    CustomerService customerService;
    
    @Autowired
    CategoryService categoryService;
    
    @Autowired
    ProductDetailRepository productDetailRepository;
    
    @RequestMapping(value = "/checkout", method = RequestMethod.GET)
    public String viewCheckout(Model model, HttpServletRequest request, HttpSession session,Principal principal){
        cartService.showCartOnHeader(model, request);
        categoryService.showDropDownInHeader(model);
        
        Cart myCart = CartUtil.getCartInSession(request);
        model.addAttribute("items", myCart.getCartItems());
        
        double totalP = myCart.totalPriceOfCart(myCart.getCartItems());
        model.addAttribute("totalP",totalP);
        
        if (principal != null && !(principal instanceof AnonymousAuthenticationToken)) {
            AccountEntity accountEntity = (AccountEntity) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            String username = accountEntity.getUsername();
            CustomerEntity customer = customerRepository.findByAccountUsernameIgnoreCase(username);            
            model.addAttribute("customer",customer);
            CustomerProfileEntity customerProfile = customerRepository.findByAccountUsernameIgnoreCase(username).getCustomerProfile();            
            model.addAttribute("profile",customerProfile);
        }        
        return "checkout-orderreview";
    }
    
    @RequestMapping(value = "/checkout-process", method = RequestMethod.POST)
    public String preOrder(@RequestParam(value = "firstName") String firstName,
                           @RequestParam(value = "lastName") String lastName,
                           @RequestParam(value = "email") String email,
                           @RequestParam(value = "phone") int phone,
                           @RequestParam(value = "zip") int zip,
                           @RequestParam(value = "address") String address,
                           HttpServletRequest request, Model model, HttpSession session, Principal principal){
        cartService.showCartOnHeader(model, request);
        categoryService.showDropDownInHeader(model);
        Cart myCart = CartUtil.getCartInSession(request);
        List<CartItem> itemList = myCart.getCartItems();
        
            AccountEntity accountEntity = (AccountEntity) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            String username = accountEntity.getUsername();
            CustomerEntity customer = customerRepository.findByAccountUsernameIgnoreCase(username);            
            model.addAttribute("customer",customer);
            
            OrderEntity order = new OrderEntity();
            order.setFirstName(firstName);
            order.setLastName(lastName);
            order.setEmail(email);
            order.setPhone(phone);
            order.setZip(zip);
            order.setAddress(address);
            order.setOrderDate(new Date());
            order.setTotalPrice(myCart.totalPriceOfCart(itemList));
            order.setCustomer(customer);
            orderRepository.save(order);
            
            for (int i =0;i<itemList.size(); i++){
            OrderDetailEntity orderDetailEntity =new OrderDetailEntity();
            orderDetailEntity.setOrder(order);
            orderDetailEntity.setOrderDetailQuantity(itemList.get(i).getQuantity());
            orderDetailEntity.setProduct(productRepository.findOne(itemList.get(i).getId()));
            orderDetailEntity.setTotalPrice(itemList.get(i).getPrice());
            orderDetailRepository.save(orderDetailEntity);
            
            ProductDetailEntity productDetailEntity = productDetailRepository.findOne(itemList.get(i).getId());
            productDetailEntity.setOrderedQuantity(itemList.get(i).getQuantity() + productDetailEntity.getOrderedQuantity());
            productDetailRepository.save(productDetailEntity);
        }

            myCart = new Cart();
            request.getSession().setAttribute("myCart",myCart);
            customerService.checkOutOrder(order);
            model.addAttribute("items", itemList);                   
        return "checkout-success";         
    }    
}
