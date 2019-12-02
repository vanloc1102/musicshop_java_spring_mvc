/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.musicshop.repositories;

import com.spring.musicshop.entities.AccountRoleEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author vanlo
 */
@Repository
public interface AccountRoleRepository extends CrudRepository<AccountRoleEntity, Integer>{

}
