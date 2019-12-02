package com.spring.musicshop.repositories;

import com.spring.musicshop.entities.OrderDetailEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderDetailRepository  extends CrudRepository<OrderDetailEntity, Integer> {
    List<OrderDetailEntity> findByOrderOrderID(int id);
    
    /// list order ở bảng report

    @Query(value = "select *from productorderdetail ORDER BY orderDetailID desc\n ", nativeQuery = true)
    public List<OrderDetailEntity> lisorderbydesc ();
    
    /// thống kê theo san pham
    @Query(value = "SELECT p.productName ,  \n" +
            "SUM(o.orderDetailQuantity) as quantity ,    \n" +
            "SUM(o.orderDetailQuantity * o.total_price) as sum, \n" +
            "AVG(o.total_price) as avg  , \n" +
            "Min(o.total_price) as min  , \n" + 
            "max(o.total_price) as max \n" +
            "FROM productorderdetail o\n" +
            "INNER JOIN product p ON o.productID = p.productID\n" +
            "GROUP BY p.productName;", nativeQuery = true)

    public List<Object[]> repo();
    
    /// thong ke san pham theo danh muc
    @Query(value = "SELECT c.categoryName ,  \n" +
            "SUM(o.orderDetailQuantity) as quantity ,    \n" +
            "SUM(o.orderDetailQuantity * o.total_price) as sum, \n" +
            "AVG(o.total_price) as avg  , \n" +
            "Min(o.total_price) as min  , \n" +
            "max(o.total_price) as max \n" +
            "FROM productorderdetail o\n" +
            "INNER JOIN product p ON o.productID = p.productID\n" +
            "INNER JOIN category c ON p.categoryID = c.categoryID\n" +
            "GROUP BY c.categoryName;\n", nativeQuery = true)

    public List<Object[]> repowherecategory();
    
    /// thong ke san pham theo hãng // nhà cung cấp
    @Query(value = "SELECT b.brandName ,  \n" +
            "SUM(o.orderDetailQuantity) as quantity ,    \n" +
            "SUM(o.orderDetailQuantity * o.total_price) as sum, \n" +
            "AVG(o.total_price) as avg  , \n" +
            "Min(o.total_price) as min  , \n" +
            "max(o.total_price) as max \n" +
            "FROM productorderdetail o\n" +
            "INNER JOIN product p ON o.productID = p.productID\n" +
            "INNER JOIN brand b ON p.brandID = b.brandID\n" +
            "GROUP BY b.brandName;\n", nativeQuery = true)

    public List<Object[]> repowheresuppliers();
    
    // thong ke san pham theo năm // theo các năm
    @Query(value = "Select YEAR(od.orderDate) , \n" +
            "SUM(o.orderDetailQuantity) as quantity ,    \n" +
            "SUM(o.orderDetailQuantity * o.total_price) as sum, \n" +
            "AVG(o.total_price) as avg  , \n" +
            "Min(o.total_price) as min  , \n" +
            "max(o.total_price) as max \n" +
            "FROM productorderdetail o\n" +
            "INNER JOIN productorder od ON o.orderID =od.orderID\n" +
            "GROUP BY YEAR(od.orderDate);\n", nativeQuery = true)

    public List<Object[]> repowhereyear();
    
    // thong ke san pham theo tháng // theo các Tháng
    @Query(value = "Select month(od.orderDate) , \n" +
            "SUM(o.orderDetailQuantity) as quantity ,    \n" +
            "SUM(o.orderDetailQuantity * o.total_price) as sum, \n" +
            "AVG(o.total_price) as avg  , \n" +
            "Min(o.total_price) as min  , \n" +
            "max(o.total_price) as max \n" +
            "FROM productorderdetail o\n" +
            "INNER JOIN productorder od ON o.orderID =od.orderID\n" +
            "GROUP BY month(od.orderDate);", nativeQuery = true)

    public List<Object[]> repowheremonth();
    
    // thong ke san pham theo quý // theo các quý
    @Query(value = "Select QUARTER(od.orderDate), \n" +
            "\tSUM(o.orderDetailQuantity) as quantity ,    \n" +
            "\tSUM(o.orderDetailQuantity * o.total_price) as sum, \n" +
            "\tAVG(o.total_price) as avg  , \n" +
            "\tMin(o.total_price) as min  , \n" +
            "\tmax(o.total_price) as max \n" +
            "\tFROM productorderdetail o\n" +
            "\tINNER JOIN productorder od ON o.orderID =od.orderID\n" +
            "\tGROUP By QUARTER(od.orderDate);", nativeQuery = true)

    public List<Object[]> repowhereQUARTER();
    
    //// thống kê sản phẩm theo người đặt hàng
    /// end task 21/03/2018
    @Query(value = " \tSELECT c.customerID,  \n" +
            "            SUM(o.orderDetailQuantity) as quantity,    \n" +
            "            SUM(o.orderDetailQuantity * o.total_price) as sum, \n" +
            "\t\t\tAVG(o.total_price) as avg, \n" +
            "            Min(o.total_price) as min, \n" +
            "            max(o.total_price) as max \n" +
            "            FROM productorderdetail o\n" +
            "            INNER JOIN productorder p ON o.orderID = p.orderID\n" +
            "            INNER JOIN customer c ON p.customerID = c.customerID\n" +
            "            GROUP BY c.customerID;", nativeQuery = true)

    public List<Object[]> reportCustommer();
    
    
}
