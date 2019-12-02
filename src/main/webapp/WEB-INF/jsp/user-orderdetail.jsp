<%-- 
    Document   : customer-orderdetail
    Created on : Oct 15, 2019, 8:32:52 AM
    Author     : vanlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="include/head-css.jsp">
            <jsp:param name="title" value="Order Detail"/>
        </jsp:include>
    </head>
    <body>
        <jsp:include page="include/header.jsp"/>
        <!-- Hero Section-->
        <section class="hero hero-page gray-bg padding-small">
            <div class="container">
                <div class="row d-flex">
                    <div class="col-lg-9 order-2 order-lg-1">
                        <h1>Order MWS ${order.customer.customerID}${order.orderID}</h1><p class="lead">Order MWS ${order.customer.customerID}${order.orderID} <strong>${order.orderDate}</strong> and is currently <strong>Being prepared</strong>.</p><p class="text-muted">If you have any questions, please feel free to <a href="contact.html">contact us</a>, our customer service center is working for you 24/7.</p>          </div>
                    <div class="col-lg-3 text-right order-1 order-lg-2">
                        <ul class="breadcrumb justify-content-lg-end">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item"><a href="customer-orders.html">Orders</a></li>
                            <li class="breadcrumb-item active">Order MWS ${order.customer.customerID}${order.orderID}</li>
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
                            <a href="<c:url value="/user/orders"/>" class="list-group-item d-flex justify-content-between align-items-center"><span><span class="icon icon-bag"></span>Orders</span><small class="badge badge-pill badge-primary">${orderCustomer.size()}</small></a>
                            <a href="<c:url value="/user/profile"/>" class="active list-group-item d-flex justify-content-between align-items-center"><span><span class="icon icon-profile"></span>Profile</span></a>
                            <a href="<c:url value="/user/address"/>" class="list-group-item d-flex justify-content-between align-items-center"><span><span class="icon icon-map"></span>Addresses</span></a>
                            <a href="<c:url value="/logout"/>" class="list-group-item d-flex justify-content-between align-items-center"><span><span class="fa fa-sign-out"></span>Log out</span></a>
                        </nav>
                    </div>
                    <div class="col-lg-8 col-xl-9 pl-lg-3">
                        <div class="basket basket-customer-order">
                            <div class="basket-holder">
                                <div class="basket-header">
                                    <div class="row">
                                        <div class="col-6">Product</div>
                                        <div class="col-2">Price</div>
                                        <div class="col-2">Quantity</div>
                                        <div class="col-2 text-right">Total</div>
                                    </div>
                                </div>
                                <div class="basket-body">
                                    <!-- Product-->
                                    <c:forEach var="orderDetail" items="${order.orderDetailList}" varStatus="<index>">
                                        <div class="item">
                                            <div class="row d-flex align-items-center">
                                                <div class="col-6">
                                                    <div class="d-flex align-items-center"><img src="<c:url value="${orderDetail.product.images.get(0).imageURL}"/>" alt="..." class="img-fluid">
                                                        <div class="title"><a href="detail.html">
                                                                <h6>${orderDetail.product.productName}</h6><span class="text-muted">Size: Large</span></a></div>
                                                    </div>
                                                </div>
                                                <div class="col-2"><span>$ ${orderDetail.product.productDetail.unitPrice}</span></div>
                                                <div class="col-2">${orderDetail.orderDetailQuantity}</div>
                                                <div class="col-2 text-right"><span>$ ${orderDetail.product.productDetail.unitPrice *orderDetail.orderDetailQuantity}</span></div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="basket-footer">
                                    <div class="item">
                                        <div class="row">
                                            <div class="offset-md-6 col-4"> <strong>Order subtotal</strong></div>
                                            <div class="col-2 text-right"><strong>$${order.totalPrice}</strong></div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="row">
                                            <div class="offset-md-6 col-4"> <strong>Shipping and handling</strong></div>
                                            <div class="col-2 text-right"><strong>$10.00</strong></div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="row">
                                            <div class="offset-md-6 col-4"> <strong>Tax</strong></div>
                                            <div class="col-2 text-right"><strong>$0.00</strong></div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="row">
                                            <div class="offset-md-6 col-4"> <strong>Total</strong></div>
                                            <div class="col-2 text-right"><strong>$${order.totalPrice+10}</strong></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="include/footer.jsp"/>
        <jsp:include page="include/footer-script.jsp"/>
       
    </body>
</html>
