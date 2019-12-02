/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.musicshop.services;


import com.spring.musicshop.entities.ConfirmationTokenEntity;
import com.spring.musicshop.entities.CustomerEntity;
import com.spring.musicshop.entities.OrderEntity;
import com.spring.musicshop.models.GmailSender;
import com.spring.musicshop.repositories.CustomerProfileRepository;
import com.spring.musicshop.repositories.CustomerRepository;
import java.io.UnsupportedEncodingException;
import javax.mail.MessagingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author vanlo
 */
@Service
public class CustomerService {
    
    @Autowired
    CustomerRepository customerRepository;

    @Autowired
    CustomerProfileRepository customerProfileRepository;    
    
    public boolean isEmailExisting(String email){
        CustomerEntity customer = customerRepository.findByEmailIgnoreCase(email);
        return customer != null ? true : false;
    }
    
    public boolean isUserNameExisting(String username){
        CustomerEntity customer = customerRepository.findByAccountUsernameIgnoreCase(username);
        return customer != null ? true : false;
    }     
    
    
    public void sendActivationEmail(CustomerEntity customer, ConfirmationTokenEntity confirmationToken){
        String subject = "Registration successfully";
        String activationUrl = "http://localhost:8080/musicshop/active-account?email=" + customer.getEmail() + "&token=" + confirmationToken.getConfirmationToken();
        String mailBody = "<h1> Dear " + customer.getLastName() + ",<h1>"
                + "<h2>You've registered successfully to our website. Enjoy with us</h2>"
                + "<br/>Please click on the following link to activate your account. Once activated, you can sign-in"
                + "<br/>" + activationUrl;

        try {
            GmailSender.send(customer.getEmail(), subject, mailBody, true);
        } catch (MessagingException | UnsupportedEncodingException e) {
            System.out.println(e);
        }
    }
    
    public void checkOutOrder(OrderEntity order){
        sendOrderEmail(order);
    }
    
    private void sendOrderEmail(OrderEntity order){
        String subject = "Thanks you order";
        String mailBody = "<h1> Dear " + order.getFirstName() + order.getLastName() + ",<h1>"
                + "<h2>Address: " + order.getAddress() + "</h2>"
                + "<h2>Order Day: " + order.getOrderDate() + "</h2>"
                + "<h2>Total Price: $ " + order.getTotalPrice() + "</h2>"
                + "<h2>You've order successfully to our website.</h2>";
        
        try {
            GmailSender.send(order.getEmail(), subject, mailBody, true);
        } catch (MessagingException | UnsupportedEncodingException e) {
            System.out.println(e);
        }
    }
    
}
