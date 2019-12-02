x<%-- 
    Document   : checkout-address
    Created on : Oct 14, 2019, 4:05:31 PM
    Author     : vanlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <jsp:include page="include/head-css.jsp">
        <jsp:param name="title" value="Checkout Information"/>
    </jsp:include>
  </head>
  <body>
    <jsp:include page="include/header.jsp"/>
    <section class="hero hero-page gray-bg padding-small">
        <div class="container">
            <div class="row d-flex">
                <div class="col-lg-9 order-2 order-lg-1">
                    <h1>Checkout</h1><p class="lead">You currently have ${items.size()} item(s) in your basket</p>
                </div>
                <div class="col-lg-3 text-right order-1 order-lg-2">
                    <ul class="breadcrumb justify-content-lg-end">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item active">Checkout</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <!-- Checkout Forms-->
    <section class="checkout">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    
                    <div class="tab-content">
                        <div id="address" class="active tab-block">
                            <form action="${pageContext.request.contextPath}/checkout-process" id="checkout-process" role="form" method="post"  >
                                <!-- Invoice Address-->
                                <div class="block-header mb-5">
                                    <h5>Invoice Information</h5>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="firstName" class="form-label">First Name</label>
                                        <input value="${profile.firstName}" id="firstName" type="text" name="firstName" placeholder="Enter you first name" class="form-control" required="required" />
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="lastName" class="form-label">Last Name</label>
                                        <input value="${profile.lastName}" id="lastName" type="text" name="lastName" placeholder="Enter your last name" class="form-control" required="required">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="email" class="form-label">Email Address</label>
                                        <input value="${customer.email}" id="email" type="text" name="email" placeholder="enter your email address" class="form-control" required="required">
                                    </div>                                
                                    <div class="form-group col-md-3">
                                        <label for="zip" class="form-label">ZIP</label>
                                        <input value="${profile.zip}" id="zip" type="text" name="zip" placeholder="ZIP code" class="form-control" required="required">
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="phone" class="form-label">Phone Number</label>
                                        <input value="${profile.phone}" id="phone" type="tel" name="phone" placeholder="Your phone number" class="form-control" required="required">
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="address" class="form-label">Address</label>
                                        <input value="${profile.state}" id="address" type="text" name="address" placeholder="Your address" class="form-control" required="required">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="country" class="form-label">Country</label>
                                        <input value="${profile.country}" id="country" type="text" name="country" placeholder="Your country" class="form-control" required="required">
                                    </div>
                                </div>                            
                                    <div class="CTAs d-flex justify-content-between flex-column flex-lg-row"><a href="<c:url value="/cart"/>" class="btn btn-template-outlined wide prev"> <i class="fa fa-angle-left"></i>Back to basket</a>
                                    <a id="form-submit" onclick="this.form.submit()" class="btn btn-template wide next">Place an order<i class="fa fa-angle-right"></i></a></div>
                            </form>
                        </div>

                        <%--cartitem session--%>
                        <div id="order-review" class="tab-block" style="padding-top: 50px;">
                            <div class="cart">
                                <div class="cart-holder">
                                    <div class="basket-header">
                                        <div class="row">
                                            <div class="col-6">Product</div>
                                            <div class="col-2">Price</div>
                                            <div class="col-2">Quantity</div>
                                            <div class="col-2">Unit Price</div>
                                        </div>
                                    </div>
                                    <div class="basket-body">
                                        <c:forEach var="cartItem" items="${items}" varStatus="index">
                                            <!-- Product-->
                                            <div class="item row d-flex align-items-center">
                                                <div class="col-6">
                                                    <div class="d-flex align-items-center"><img src="<c:url value="${cartItem.image}"/>" alt="..." class="img-fluid">
                                                        <div class="title"><a href="detail.html">
                                                            <h6>${cartItem.name}</h6><span class="text-muted">Size: Large</span></a></div>
                                                    </div>
                                                </div>
                                                <div class="col-2"><span>$${cartItem.price}</span></div>
                                                <div class="col-2"><span>${cartItem.quantity}</span></div>
                                                <div class="col-2"><span>$${cartItem.quantity*cartItem.price}</span></div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>                                
                            </div>                            
                        </div>

                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="block-body order-summary">
                        <h6 class="text-uppercase">Order Summary</h6>
                        <p>Shipping and additional costs are calculated based on values you have entered</p>
                        <ul class="order-menu list-unstyled">
                            <li class="d-flex justify-content-between"><span>Order Subtotal </span><strong>$${totalP}</strong></li>
                            <li class="d-flex justify-content-between"><span>Shipping and handling</span><strong>$10.00</strong></li>
                            <li class="d-flex justify-content-between"><span>Tax</span><strong>$0.00</strong></li>
                            <li class="d-flex justify-content-between"><span>Total</span><strong class="text-primary price-total">$${totalP + 10}</strong></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="include/footer.jsp"/>
    <jsp:include page="include/footer-script.jsp"/>
        
    <script>
        document.getElementById("form-submit").onclick = function() {
            document.getElementById("checkout-process").submit();
        };
    </script>
  </body>
</html>
