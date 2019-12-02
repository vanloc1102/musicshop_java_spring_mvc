package com.spring.musicshop.admin.controller;

import com.spring.musicshop.entities.OrderDetailEntity;
import com.spring.musicshop.repositories.OrderDetailRepository;
import com.spring.musicshop.repositories.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.SQLException;
import java.util.List;

@Controller
@RequestMapping(value = "/")
public class ReportController {

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    OrderDetailRepository orderDetailRepository;

    @ModelAttribute("orderList")
    public List<OrderDetailEntity> showOrder(Model model) {
        List<OrderDetailEntity> orderDetailList =
                (List<OrderDetailEntity>) orderDetailRepository.findAll();
        return orderDetailList;
    }

    @RequestMapping(value = "/admin/order")
    public String showproorders(Model model){
        List<OrderDetailEntity> orderDetails =
                (List<OrderDetailEntity>) orderDetailRepository.lisorderbydesc();
        model.addAttribute("orderDetails",orderDetails);
        return "/admin/order";
    }


    ///// edit order

    @RequestMapping(value = "/admin/editorder", method = RequestMethod.GET)
    public String editoroder(@RequestParam("id") int id,
                               ModelMap model) {
        model.addAttribute("orderDetails", orderDetailRepository.findOne(id));
        return "admin/editorder";
    }


    @RequestMapping(value = "/admin/editorder", method = RequestMethod.POST)
    public String editordertr(@ModelAttribute("orderDetail") OrderDetailEntity orderDetail, Model model, RedirectAttributes rs) {
        OrderDetailEntity cs = orderDetailRepository.save(orderDetail);
        if (null != cs) {
            model.addAttribute("message", "Update success");
            model.addAttribute("orderDetail", orderDetailRepository.findOne(cs.getOrderDetailID()));
        } else {
            model.addAttribute("message", "Update failure");
            model.addAttribute("orderDetail", orderDetail);
        }
        return "admin/order";
    }


    @RequestMapping(value = "/admin/report")
    public String report(Model model) throws SQLException {
        OrderDetailEntity orderDetail = new OrderDetailEntity();
        model.addAttribute("orderDetail", orderDetail);
        List<Object[]> listTest =  orderDetailRepository.repo();
        System.out.println("id = " + listTest.get(0)[0] + "productId = " + listTest.get(0)[1]);
        model.addAttribute("listTest",listTest);
        return "/admin/report";
    }




    //// thong ke theo danh muc san pham
    @RequestMapping(value = "/admin/reportcategory")
    public String reportcategory(Model model) throws SQLException {
        OrderDetailEntity orderDetail = new OrderDetailEntity();
        model.addAttribute("orderDetail", orderDetail);
        List<Object[]> listTest =  orderDetailRepository.repowherecategory();
//        System.out.println("id = " + listTest.get(0)[0] + "productId = " + listTest.get(0)[1]);
        model.addAttribute("listTest",listTest);
        return "/admin/report";
    }




    //// thong ke theo danh muc san pham
    @RequestMapping(value = "/admin/reportsuppliers")
    public String reportsuppliers(Model model) throws SQLException {
        OrderDetailEntity orderDetail = new OrderDetailEntity();
        model.addAttribute("orderDetail", orderDetail);
        List<Object[]> listTest =  orderDetailRepository.repowheresuppliers();
        System.out.println("id = " + listTest.get(0)[0] + "productId = " + listTest.get(0)[1]);
        model.addAttribute("listTest",listTest);
        return "/admin/report";
    }

    //// thống kê theo năm
    @RequestMapping(value = "/admin/reportyear")
    public String reportyear(Model model) throws SQLException {
        OrderDetailEntity orderDetail = new OrderDetailEntity();
        model.addAttribute("orderDetail", orderDetail);
        List<Object[]> listTest =  orderDetailRepository.repowhereyear();
        System.out.println("id = " + listTest.get(0)[0] + "productId = " + listTest.get(0)[1]);
        model.addAttribute("listTest",listTest);
        return "/admin/report";
    }

    //// thống kê theo tháng
    @RequestMapping(value = "/admin/reportmonth")
    public String reportmonth(Model model) throws SQLException {
        OrderDetailEntity orderDetail = new OrderDetailEntity();
        model.addAttribute("orderDetail", orderDetail);
        List<Object[]> listTest =  orderDetailRepository.repowheremonth();
        System.out.println("id = " + listTest.get(0)[0] + "productId = " + listTest.get(0)[1]);
        model.addAttribute("listTest",listTest);
        return "/admin/report";
    }


    //// thống kê theo quý
    @RequestMapping(value = "/admin/reportquarter")
    public String reportquarter(Model model) throws SQLException {
        OrderDetailEntity orderDetail = new OrderDetailEntity();
        model.addAttribute("orderDetail", orderDetail);
        List<Object[]> listTest =  orderDetailRepository.repowhereQUARTER();
        System.out.println("id = " + listTest.get(0)[0] + "productId = " + listTest.get(0)[1]);
        model.addAttribute("listTest",listTest);
        return "/admin/report";
    }




    //// thống kê theo người dùng
    // end task 21/03/2017
    @RequestMapping(value = "/admin/reportordercustomer")
    public String reportordercustomer(Model model) throws SQLException {
        OrderDetailEntity orderDetail = new OrderDetailEntity();
        model.addAttribute("orderDetail", orderDetail);
        List<Object[]> listTest =  orderDetailRepository.reportCustommer();
        System.out.println("id = " + listTest.get(0)[0] + "productId = " + listTest.get(0)[1]);
        model.addAttribute("listTest",listTest);
        return "/admin/report";
    }


}