<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="select" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <jsp:include page="include/head-css.jsp"/>
</head>
<body>
<jsp:include page="include/header.jsp"/>

<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-8">
                <div class="card">
                    <div class="header">
                        <h4 class="title">Edit Order</h4>
                    </div>
                    <div class="content">
                        ${message}
                        <form:form action="${pageContext.request.contextPath}/admin/editorder" method="post" modelAttribute="orderDetails">
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="form-group">
                                        <label>Mã hàng hóa</label>
                                        <form:input path="orderDetailID" class="form-control" name="id"></form:input>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Số lượng</label>
                                        <form:input path="orderDetailQuantity" class="form-control"></form:input>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>
                                            Tổng tiền</label>
                                        <form:input type="text"  path="totalPrice" class="form-control"></form:input>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Đơn giá</label>
                                        <form:input type="text"  path="product.productDetail.unitPrice" class="form-control"></form:input>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>
                                            Mã Oder </label>
                                        <form:input type="text" path="order.orderID" class="form-control" required="true"></form:input>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Product</label>
                                        <form:input type="text" path="product.productID" class="form-control" required="true"></form:input>

                                    </div>
                                </div>

                            </div>

                            <button type="submit" class="btn btn-info btn-fill pull-right">Update Profile</button>
                            <div class="clearfix"></div>
                        </form:form>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card card-user">
                    <div class="image">
                        <img src="<c:url value="https://ununsplash.imgix.net/photo-1431578500526-4d9613015464?fit=crop&fm=jpg&h=300&q=75&w=400"/>"
                             alt="..."/>
                    </div>
                    <div class="content">
                        <div class="author">
                            <a href="#">
                                <img class="avatar border-gray" src="<c:url value="/resources-management/assets/img/faces/avatar.jpg"/>"
                                     alt="..."/>

                                <h4 class="title">Admin<br/>
                                    <small>@locnguyen</small>
                                </h4>
                            </a>
                        </div>
                        
                            <p class="description text-center"> "Hi Admin <br>
                                The Admin Status module allows 
                                certain messages to be shown on
                                the top of the page to users with
                                the right permission. <br>
                            </p>
                    </div>
                    <hr>
                    <div class="text-center">
                        <button href="#" class="btn btn-simple"><i class="fa fa-facebook-square"></i></button>
                        <button href="#" class="btn btn-simple"><i class="fa fa-twitter"></i></button>
                        <button href="#" class="btn btn-simple"><i class="fa fa-google-plus-square"></i></button>

                    </div>
                </div>
            </div>
            
        </div>
    </div>
</div>

<jsp:include page="include/footer-script.jsp"/>
<jsp:include page="include/footer.jsp"/>
    
</body>
</html>
