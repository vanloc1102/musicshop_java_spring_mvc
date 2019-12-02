package com.spring.musicshop.repositories;

import com.spring.musicshop.entities.CustomerProfileEntity;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface CustomerProfileRepository extends CrudRepository<CustomerProfileEntity, Integer> {
    
    @Transactional
    @Modifying
    @Query("update CustomerProfileEntity cp set cp.zip = ?1, cp.phone = ?2, cp.state = ?3, cp.country = ?4 where cp.customerProfileID = ?5")
    void updateProfile(int zip, int phone,String address, String country, int ID);
}
