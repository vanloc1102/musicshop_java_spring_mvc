<%-- 
    Document   : checkout-success
    Created on : Oct 14, 2019, 8:23:46 PM
    Author     : vanlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <jsp:include page="include/head-css.jsp">
        <jsp:param name="title" value="Checkout Step 5"/>
    </jsp:include>
  </head>
  <body>
      <jsp:include page="include/header.jsp"/>
    <!-- Hero Section-->
    <section class="hero hero-page gray-bg padding-small">
      <div class="container">
        <div class="row d-flex">
          <div class="col-lg-9 order-2 order-lg-1">
            <h1>Order confirmed</h1>
          </div>
          <div class="col-lg-3 text-right order-1 order-lg-2">
            <ul class="breadcrumb justify-content-lg-end">
              <li class="breadcrumb-item"><a href="index.html">Home</a></li>
              <li class="breadcrumb-item active">Order confirmed</li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    <!-- Checout Forms-->
    <section class="checkout">
      <div class="container">
        <div class="confirmation-icon"><i class="fa fa-check"></i></div>
        <h2>Thank you for your order. Please check your email for confirming the order.</h2>
        <p class="mb-5">Your order hasn't shipped yet but we will send you ane email when it does.</p>
        <p> <a href="<c:url value="/"/>" class="btn btn-template wide">Return your home page</a></p>
      </div>
    </section>
    
    <jsp:include page="include/footer.jsp"/>
    
    <jsp:include page="include/footer-script.jsp"/>
  </body>
</html>
