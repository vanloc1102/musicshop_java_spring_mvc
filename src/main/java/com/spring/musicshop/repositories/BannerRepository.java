package com.spring.musicshop.repositories;

import com.spring.musicshop.entities.BannerEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BannerRepository extends CrudRepository<BannerEntity, Integer> {
}
