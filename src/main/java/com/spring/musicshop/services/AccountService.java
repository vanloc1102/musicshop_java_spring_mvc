/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.musicshop.services;

import com.spring.musicshop.entities.AccountEntity;
import com.spring.musicshop.repositories.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AccountService {

    @Autowired
    private AccountRepository accountRepository;

    public AccountEntity
            findAccountByUsernameAndPassword(String username, String password) {
        return accountRepository.findAccountByUsernameAndPassword(username, password);
    }
}
