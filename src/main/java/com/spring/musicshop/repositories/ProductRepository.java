package com.spring.musicshop.repositories;

import com.spring.musicshop.entities.ProductEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends CrudRepository<ProductEntity, Integer> {
    List<ProductEntity> findTop8ByOrderByProductDetailPublishedDateDesc();
    List<ProductEntity> findTop8ByOrderByProductDetailOrderedQuantityDesc();
    List<ProductEntity> findByProductDetailUnitPriceBetween(float min,float max);
    List<ProductEntity> findByCategoryCategoryName(String name);
    List<ProductEntity> findByBrandBrandName(String name);
    List<ProductEntity> findByTypeTypeName(String name);
    
    List<ProductEntity> findByOrderByProductDetailPublishedDateDesc();
    List<ProductEntity> findByOrderByProductDetailPublishedDateAsc();


    List<ProductEntity> findByProductDetailUnitPriceBetweenOrderByProductDetailUnitPriceAsc(float min, float max);
    List<ProductEntity> findByProductDetailUnitPriceBetweenOrderByProductDetailUnitPriceDesc(float min, float max);



    List<ProductEntity> findByProductNameContaining(String input);
    @Query(value = "SELECT * FROM product p INNER JOIN productdetail pd ON p.productid = pd.productdetailid INNER JOIN type t ON p.typeid = t.typeid INNER JOIN brand b ON p.brandid = b.brandid ?", nativeQuery = true)
    List<ProductEntity> filter(String query);
    
    @Query(value = "select *from product ORDER BY productID desc", nativeQuery = true)
    public List<ProductEntity> listproductdesc ();
    
}
