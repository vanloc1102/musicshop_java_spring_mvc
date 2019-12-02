package com.spring.musicshop.repositories;

import com.spring.musicshop.entities.ImageEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import org.springframework.stereotype.Repository;

@Repository
public interface ImageRepository extends CrudRepository<ImageEntity, Integer> {
    List<ImageEntity> findByProductProductID(int id);

}
