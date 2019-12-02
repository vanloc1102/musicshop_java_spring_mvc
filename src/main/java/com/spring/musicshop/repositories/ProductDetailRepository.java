package com.spring.musicshop.repositories;

import com.spring.musicshop.entities.ProductDetailEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductDetailRepository extends CrudRepository<ProductDetailEntity, Integer> {
    ProductDetailEntity findByProductProductID(int id);
}
