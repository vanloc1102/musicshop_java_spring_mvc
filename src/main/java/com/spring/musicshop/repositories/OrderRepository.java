package com.spring.musicshop.repositories;

import com.spring.musicshop.entities.OrderEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends CrudRepository<OrderEntity, Integer> {
    List<OrderEntity> findByEmailOrderByOrderDateDesc(String email);
}
