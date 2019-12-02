<%-- 
    Document   : cart
    Created on : Oct 14, 2019, 1:27:51 PM
    Author     : vanlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
  <head>
      <jsp:include page="include/head-css.jsp">
          <jsp:param name="title" value="View Cart"/>
      </jsp:include>
  </head>
  <body>
    <jsp:include page="include/header.jsp"/>
    <!-- Hero Section-->
    <section class="hero hero-page gray-bg padding-small">
      <div class="container">
        <div class="row d-flex">
          <div class="col-lg-9 order-2 order-lg-1">
            <h1>Shopping cart</h1><p class="lead text-muted">You currently have ${items.size()} items in your shopping cart</p>
          </div>
          <div class="col-lg-3 text-right order-1 order-lg-2">
            <ul class="breadcrumb justify-content-lg-end">
              <li class="breadcrumb-item"><a href="index.html">Home</a></li>
              <li class="breadcrumb-item active">Shopping cart</li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    <!-- Shopping Cart Section-->
    <section class="shopping-cart">
      <c:if test="${not empty items}">
        <div class="container">
          <div class="basket">
            <div class="basket-holder">
              <div class="basket-header">
                <div class="row">
                  <div class="col-5">Product</div>
                  <div class="col-2">Price</div>
                  <div class="col-2">Quantity</div>
                  <div class="col-2">Total</div>
                  <div class="col-1 text-center">Remove</div>
                </div>
              </div>
              <div class="basket-body">
                <form method="post" role="form" action="cart/update" name="update-form" id="update-form">
                    <c:forEach var="cartItem" items="${items}" varStatus="loop">
                    <!-- Product-->
                    <div class="item">
                      <div class="row d-flex align-items-center">
                        <div class="col-5">
                            <div class="d-flex align-items-center"><img src="<c:url value="${cartItem.image}"/>" alt="..." class="img-fluid">
                            <div class="title"><a href="detail.html">
                                <h5>${cartItem.name}</h5></a></div>
                          </div>
                        </div>
                        <div class="col-2"><span>$${cartItem.price}</span></div>
                        <div class="col-2">
                          <div class="d-flex align-items-center">
                            <div class="quantity d-flex align-items-center">
                              <div class="dec-btn">-</div>
                              <input type="hidden" name="product-id-${loop.index}" value="${cartItem.id}" >
                              <input type="text" name="product-quantity-update-${loop.index}" value="${cartItem.quantity}" class="quantity-no">
                              <div class="inc-btn">+</div>
                            </div>
                          </div>
                        </div>
                        <div class="col-2"><span>$${cartItem.quantity*cartItem.price}</span></div>
                        <div class="col-1 text-center"><a href="<c:url value="/cart/delete/${cartItem.id}"/>"><i class="delete fa fa-trash"></i></a></div>
                      </div>
                    </div>
                    </c:forEach>
                </form>
              </div>
            </div>
          </div>
        </div>
      </c:if>
      <div class="container">
          <div class="CTAs d-flex align-items-center justify-content-center justify-content-md-end flex-column flex-md-row">
              <a href="<c:url value="/product"/>" class="btn btn-template-outlined wide">Continue Shopping</a>
              <a onclick="submitForms()" class="btn btn-template wide">Update Cart</a>
          </div>
          <script>
            submitForms = function(){
            document.forms["update-form"].submit();
            };
          </script>
      </div>
    </section>
    <!-- Order Details Section-->
    <section class="order-details no-padding-top"> 
      <div class="container">
        <div class="row">                         
          <div class="col-lg-6">
            <div class="block">
              <div class="block-header">
                <h6 class="text-uppercase">Coupon Code</h6>
              </div>
              <div class="block-body">
                <p>If you have a coupon code, please enter it in the box below</p>
                <form action="#">
                  <div class="form-group d-flex">
                    <input type="text" name="coupon">
                    <button type="submit" class="cart-black-button">Apply coupon</button>
                  </div>
                </form>
              </div>
            </div>
            <div class="block">
              <div class="block-header">
                <h6 class="text-uppercase">Instructions for seller</h6>
              </div>
              <div class="block-body">
                <p>If you have some information for the seller you can leave them in the box below</p>
                <form action="#">
                  <textarea name="instructions"></textarea>
                </form>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="block">
              <div class="block-header">
                <h6 class="text-uppercase">Order Summary</h6>
              </div>
              <div class="block-body">
                <p>Shipping and additional costs are calculated based on values you have entered.</p>
                <ul class="order-menu list-unstyled">
                  <li class="d-flex justify-content-between"><span>Order Subtotal </span><strong>$${totalP}</strong></li>
                  <li class="d-flex justify-content-between"><span>Shipping and handling</span><strong>$10.00</strong></li>
                  <li class="d-flex justify-content-between"><span>Tax</span><strong>$0.00</strong></li>
                  <li class="d-flex justify-content-between"><span>Total</span><strong class="text-primary price-total">$${totalP+10}</strong></li>
                </ul>
              </div>
            </div>
          </div>
            <div class="col-lg-12 text-center CTAs"><a href="<c:url value="/checkout"/>" class="btn btn-template btn-lg wide">Proceed to checkout<i class="fa fa-long-arrow-right"></i></a></div>
        </div>
      </div>
    </section>
    <jsp:include page="include/footer.jsp"/>
    <jsp:include page="include/footer-script.jsp"/>
  </body>
</html>
