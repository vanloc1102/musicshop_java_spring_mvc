package com.spring.musicshop.repositories;

import com.spring.musicshop.entities.BrandEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BrandRepository extends CrudRepository<BrandEntity, Integer> {
}
