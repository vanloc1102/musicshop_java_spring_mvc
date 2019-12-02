<%-- 
    Document   : customer-address
    Created on : Oct 14, 2019, 10:17:54 PM
    Author     : vanlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="include/head-css.jsp">
            <jsp:param name="title" value="Address Page"/>
        </jsp:include>
    </head>
    <body>
        <jsp:include page="include/header.jsp"/>
        <!-- Hero Section-->
        <section class="hero hero-page gray-bg padding-small">
            <div class="container">
                <div class="row d-flex">
                    <div class="col-lg-9 order-2 order-lg-1">
                        <h1>Your addresses</h1>
                    </div>
                    <div class="col-lg-3 text-right order-1 order-lg-2">
                        <ul class="breadcrumb justify-content-lg-end">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item active">Your addresses</li>
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
                            <a href="<c:url value="/user/profile"/>" class="list-group-item d-flex justify-content-between align-items-center"><span><span class="icon icon-profile"></span>Profile</span></a>
                            <a href="<c:url value="/user/address"/>" class="active list-group-item d-flex justify-content-between align-items-center"><span><span class="icon icon-map"></span>Addresses</span></a>
                            <a href="<c:url value="/logout"/>" class="list-group-item d-flex justify-content-between align-items-center"><span><span class="fa fa-sign-out"></span>Log out</span></a>
                        </nav>
                    </div>

                    <div class="col-lg-8 col-xl-9 pl-lg-3">
                        <form:form action="${pageContext.request.contextPath}/user/update-address" method="post" modelAttribute="customer">
                            <!-- Invoice Address-->
                            <div class="block-header mb-5">
                                <h5>Invoice address                    </h5>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="firstName" class="form-label">First Name</label>
                                    <input value="${customer.firstName}" id="firstName" type="text" name="firstName" placeholder="Enter you first name" class="form-control" readonly>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="lastName" class="form-label">Last Name</label>
                                    <input value="${customer.lastName}" id="lastName" type="text" name="lastName" placeholder="Enter your last name" class="form-control" readonly>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="email" class="form-label">Email Address</label>
                                    <input value="${customer.email}" id="email" type="text" name="email" placeholder="enter your email address" class="form-control" readonly>
                                </div>                                
                                <div class="form-group col-md-3">
                                    <label for="zip" class="form-label">ZIP</label>
                                    <input value="${customer.customerProfile.zip}" id="zip" type="text" name="zip" placeholder="ZIP code" class="form-control" required="required">
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="phone" class="form-label">Phone Number</label>
                                    <input value="${customer.customerProfile.phone}" id="phone" type="tel" name="phone" placeholder="Your phone number" class="form-control" required="required">
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="address" class="form-label">Address</label>
                                    <input value="${customer.customerProfile.state}" id="address" type="text" name="address" placeholder="Your address" class="form-control" required="required">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="country" class="form-label">Country</label>
                                    <input value="${customer.customerProfile.country}" id="country" type="text" name="country" placeholder="Your country" class="form-control" required="required">
                                </div>
                            </div>
                            <!-- /Invoice Address-->
                            <div class="row">
                                <div class="form-group col-12 mt-3">
                                    <button type="submit" class="btn btn-template wide"><i class="fa fa-save"></i>Save changes</button>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="include/footer.jsp"/>
        <jsp:include page="include/footer-script.jsp"/>
    </body>
</html>