package com.spring.musicshop.repositories;

import com.spring.musicshop.entities.CustomerEntity;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface CustomerRepository extends CrudRepository<CustomerEntity, Integer> {

    CustomerEntity findByEmailIgnoreCase(String email);
    CustomerEntity findByAccountUsernameIgnoreCase(String username); 

    @Transactional
    @Modifying
    @Query("update CustomerEntity c set c.firstName = ?1, c.lastName = ?2 where c.customerID = ?3")
    void updateProfile(String firstName, String lastName, int ID);
    
}
