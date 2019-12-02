package com.spring.musicshop.repositories;

import com.spring.musicshop.entities.TypeEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TypeRepository extends CrudRepository<TypeEntity, Integer> {
    TypeEntity findByProductsProductID(int id);
}
