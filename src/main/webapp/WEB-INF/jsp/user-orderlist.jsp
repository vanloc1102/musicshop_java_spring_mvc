<%-- 
    Document   : customer-orderlist
    Created on : Oct 15, 2019, 8:27:52 AM
    Author     : vanlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="include/head-css.jsp">
            <jsp:param name="title" value="Order List"/>
        </jsp:include>
    </head>
    <body>
        <jsp:include page="include/header.jsp"/>
        <!-- Hero Section-->
        <section class="hero hero-page gray-bg padding-small">
            <div class="container">
                <div class="row d-flex">
                    <div class="col-lg-9 order-2 order-lg-1">
                        <h1>Your orders</h1><p class="lead">Your orders in one place.</p>
                    </div>
                    <div class="col-lg-3 text-right order-1 order-lg-2">
                        <ul class="breadcrumb justify-content-lg-end">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item active">Orders</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <section class="padding-small">
            <div class="container">
                <div class="row">
                    <!-- Customer Sidebar-->
                    <div class="customer-sidebar col-xl-3 col-lg-4 mb-md-5">
                        <div class="customer-profile"><a href="#" class="d-inline-block"><img src="<c:url value="/resources/upload/${customer.customerImg}"/>" class="img-fluid rounded-circle customer-image"></a>
                            <h5>${customer.lastName} ${customer.firstName}</h5>

                        </div>
                        <nav class="list-group customer-nav">
                            <a href="<c:url value="/user/orders"/>" class="active list-group-item d-flex justify-content-between align-items-center"><span><span class="icon icon-bag"></span>Orders</span><small class="badge badge-pill badge-primary">${orderCustomer.size()}</small></a>
                            <a href="<c:url value="/user/profile"/>" class="list-group-item d-flex justify-content-between align-items-center"><span><span class="icon icon-profile"></span>Profile</span></a>
                            <a href="<c:url value="/user/address"/>" class="list-group-item d-flex justify-content-between align-items-center"><span><span class="icon icon-map"></span>Addresses</span></a>
                            <a href="<c:url value="/logout"/>" class="list-group-item d-flex justify-content-between align-items-center"><span><span class="fa fa-sign-out"></span>Log out</span></a>
                        </nav>
                    </div>
                    <div class="col-lg-8 col-xl-9 pl-lg-3">
                        <table class="table table-hover table-responsive-md">
                            <thead>
                                <tr>
                                    <th>Order</th>
                                    <th>Date</th>
                                    <th>Total</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="order" items="${orderCustomer}" varStatus="index">
                                    <tr>
                                        <th>MWS ${order.customer.customerID}${order.orderID}</th>
                                        <td>${order.orderDate}</td>
                                        <td>$${order.totalPrice}</td>
                                        <td><span class="badge badge-success">Received</span></td>
                                        <td><a href="<c:url value="/user/orders/detail/${order.orderID}"/>" class="btn btn-primary btn-sm">View</a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="include/footer.jsp"/>
        <jsp:include page="include/footer-script.jsp"/>

    </body>
</html>
