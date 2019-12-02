<%-- 
    Document   : customer-profile
    Created on : Oct 14, 2019, 10:12:16 PM
    Author     : vanlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="include/head-css.jsp">
            <jsp:param name="title" value="Profile Page"/>
        </jsp:include>
    </head>
    <body>
        <jsp:include page="include/header.jsp"/>
        <!-- Hero Section-->
        <section class="hero hero-page gray-bg padding-small">
            <div class="container">
                <div class="row d-flex">
                    <div class="col-lg-9 order-2 order-lg-1">
                        <h1>Your profile</h1>
                    </div>
                    <div class="col-lg-3 text-right order-1 order-lg-2">
                        <ul class="breadcrumb justify-content-lg-end">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item active">Your profile</li>
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
                        <div class="block-header mb-5">
                            <h5>Change image  </h5>
                        </div>

                        <form:form action="${pageContext.request.contextPath}/user/uploadFile" method="POST" enctype="multipart/form-data" class="content-block">
                            <div class="input-group">
                                <input name="file" type="file" class="form-control"/>
                            </div>
                            <br>
                            <div class="text-center">
                                <button type="submit" class="btn btn-template"><i class="fa fa-save"></i>Change image</button>
                            </div>
                        </form:form>


                        <div class="block-header mb-5">
                            <h5>Change password  </h5>
                        </div>
                        <c:if test="${errorSignIn != null}">
                            <div class="alert alert-success">
                                <c:out value="${errorSignIn}"/>
                            </div>
                        </c:if>
                        <form role="form" action="${pageContext.request.contextPath}/user/change-password" method="post" class="content-block">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="username" class="form-label">Username</label>
                                        <input id="username" type="text" class="form-control" value="${customer.account.username}" name="username" readonly>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="password_old" class="form-label">Old password</label>
                                        <input id="password_old" type="password" class="form-control" name="password_old">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="password_1" class="form-label">New password</label>
                                        <input id="password_1" type="password" class="form-control" name= "password_1" required>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="password_2" class="form-label">Retype new password</label>
                                        <input id="password_2" type="password" class="form-control" name= "password_2" required>
                                    </div>
                                </div>
                            </div>
                            <!-- /.row-->
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i>Change password</button>
                            </div>

                        </form>
                        <div class="block-header mb-5">
                            <h5>Personal details</h5>
                        </div>
                        <form class="content-block" role="form" action="/user/update-profile" method="post">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="firstName" class="form-label">First name</label>
                                        <input id="firstName" type="text" class="form-control" value="${customer.firstName}" name="firstName">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="lastName" class="form-label">Last name</label>
                                        <input id="lastName" type="text" class="form-control" value="${customer.lastName}" name="lastName">
                                    </div>
                                </div>
                                <div class="col-sm-12 text-center">
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i>Save changes</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="include/footer.jsp"/>
        <jsp:include page="include/footer-script.jsp"/>
    </body>
</html>
