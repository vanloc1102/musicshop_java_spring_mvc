<%-- 
    Document   : product-detail
    Created on : Oct 15, 2019, 8:39:26 AM
    Author     : vanlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <jsp:include page="include/head-css.jsp">
        <jsp:param name="title" value="Product Detail"/>
    </jsp:include>
  </head>
  <body>
      <jsp:include page="include/header.jsp"/>
    <!-- Hero Section-->
    <section class="hero hero-page gray-bg padding-small">
      <div class="container">
        <div class="row d-flex">
          <div class="col-lg-9 order-2 order-lg-1">
            <h1>${images.get(0).product.productName}</h1>
          </div>
          <div class="col-lg-3 text-right order-1 order-lg-2">
            <ul class="breadcrumb justify-content-lg-end">
              <li class="breadcrumb-item"><a href="index.html">Home</a></li>
              <li class="breadcrumb-item"><a href="category.html">Shop</a></li>
              <li class="breadcrumb-item active">${images.get(0).product.productName}</li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    <section class="product-details">
      <div class="container">
        <div class="row">
          <div class="product-images col-lg-6">
            <div data-slider-id="1" class="owl-carousel items-slider owl-drag">
                <c:if test="${not empty images}">
                    <c:forEach var="image" items="${images}" varStatus="index">
                        <div class="item"><img src="<c:url value="${image.imageURL}"/>" alt="shirt"></div>
                    </c:forEach>
                </c:if>
            </div>
            <div data-slider-id="1" class="owl-thumbs">
                <c:if test="${not empty images}">
                    <c:forEach var="image" items="${images}" varStatus="index">
                        <button class="owl-thumb-item"><img src="<c:url value="${image.imageURL}"/>" alt="shirt"></button>
                    </c:forEach>
                </c:if>
            </div>
          </div>
          <div class="details col-lg-6">
              <form method="GET" role="form" name="add-to-cart" action="${pageContext.request.contextPath}/cart/addDetail/${images.get(0).product.productID}" >
                <div class="d-flex align-items-center justify-content-between flex-column flex-sm-row">
                  <ul class="price list-inline no-margin">
                      <li class="list-inline-item original"><span class="price text-muted">$${images.get(0).product.productDetail.unitPrice}</span></li>
                  </ul>
                  <div class="review d-flex align-items-center">
                      <p><span class="text-muted">Published Date : ${images.get(0).product.productDetail.publishedDate}</span></p>
                  </div>
                </div>
                <table class="table">
                    <tbody>
                       <tr>
                        <th class="border-0">Name:</th>
                        <td class="border-0">${images.get(0).product.productName}</td>
                      </tr>
                      <tr>
                        <th>Material:</th>
                        <td>Wood</td>
                      </tr>
                      <tr>
                        <th>Styles:</th>
                        <td>${images.get(0).product.type.typeName}</td>
                      </tr>
                      <tr>
                        <th>Brand:</th>
                        <td>${images.get(0).product.brand.brandName}</td>
                      </tr>
                      <tr>
                        <th>Categories:</th>
                        <td>${images.get(0).product.category.categoryName}</td>
                      </tr>               
                    </tbody>
                </table>
                
                <div class="d-flex align-items-center justify-content-center justify-content-lg-start">                    
                  <div class="quantity d-flex align-items-center">
                    <div class="dec-btn">-</div>
                    <input type="text" value="1" class="quantity-no" name="product-quantity">
                    <div class="inc-btn">+</div>
                  </div>
                  <input type="hidden" name="product-id">
                </div>
                <ul class="CTAs list-inline">
                    <li class="list-inline-item"><button type="submit" class="btn btn-template wide"> <i class="icon-cart"></i>Add to Cart</button></li>
                  
                </ul>
            </form>
          </div>
        </div>
      </div>
    </section>
    <section class="product-description no-padding">
      <div class="container">
        <ul role="tablist" class="nav nav-tabs flex-column flex-sm-row">
          <li class="nav-item"><a data-toggle="tab" href="#description" role="tab" class="nav-link active">Description</a></li>
          <li class="nav-item"><a data-toggle="tab" href="#additional-information" role="tab" class="nav-link">Additional Information</a></li>
          <li class="nav-item"><a data-toggle="tab" href="#reviews" role="tab" class="nav-link">Reviews</a></li>
        </ul>
        <div class="tab-content">
          <div id="description" role="tabpanel" class="tab-pane active">
            <p>${images.get(0).product.productDetail.description}.</p>            
          </div>
          <div id="additional-information" role="tabpanel" class="tab-pane">
            <table class="table">
                <tbody>
                      <tr>
                        <th class="border-0">Material:</th>
                        <td class="border-0">Wood</td>
                      </tr>
                      <tr>
                        <th>Styles:</th>
                        <td>${images.get(0).product.productName}</td>
                      </tr>
                      <tr>
                        <th>Brand:</th>
                        <td>${images.get(0).product.brand.brandName}</td>
                      </tr>
                      <tr>
                        <th>Categories:</th>
                        <td>${images.get(0).product.category.categoryName}</td>
                      </tr>               
                </tbody>
            </table>
          </div>
          <div id="reviews" role="tabpanel" class="tab-pane">
                <div id="fb-root"></div>
                    <script async defer crossorigin="anonymous" 
                    src="https://connect.facebook.net/en_EN/sdk.js#xfbml=1&version=v5.0"></script>
                <div class="container" style="margin-top: 60px;">
                    <div class="fb-comments" data-href="https://developers.facebook.com/docs/plugins/comments#configurator" data-width="" data-numposts="5"></div>
                </div>

         </div>
        </div>
      </div>
      <div class="container-fluid">
        <div class="share-product gray-bg d-flex align-items-center justify-content-center flex-column flex-md-row"><strong class="text-uppercase">Share this on</strong>
          <ul class="list-inline text-center">
            <li class="list-inline-item"><a href="#" target="_blank" title="twitter"><i class="fa fa-twitter"></i></a></li>
            <li class="list-inline-item"><a href="#" target="_blank" title="facebook"><i class="fa fa-facebook"></i></a></li>
            <li class="list-inline-item"><a href="#" target="_blank" title="instagram"><i class="fa fa-instagram"></i></a></li>
            <li class="list-inline-item"><a href="#" target="_blank" title="pinterest"><i class="fa fa-pinterest"></i></a></li>
            <li class="list-inline-item"><a href="#" target="_blank" title="vimeo"><i class="fa fa-vimeo"></i></a></li>
          </ul>
        </div>
      </div>
    </section>
    <section class="related-products">
      <div class="container">
        <header class="text-center">
          <h2><small>Related Products</small>You may also like</h2>
        </header>
        <div class="owl-carousel owl-theme products-slider">
            <!-- item-->
            <c:forEach var="related" items="${related}" varStatus="index">
                <div class="item">
                    <div class="product is-gray">
                        <div class="image d-flex align-items-center justify-content-center">
                            <img src="<c:url value="${related.images.size() > 0 ? related.images.get(0).imageURL : ''}"/>" alt="product" class="img-fluid"/>
                            <div class="hover-overlay d-flex align-items-center justify-content-center">
                                <div class="CTA d-flex align-items-center justify-content-center">
                                    <a href="cart/add/${related.productID}" class="add-to-cart"><i class="fa fa-shopping-cart"></i></a>
                                    <a href="<c:url value="/product/detail/${related.productID}"/>" class="visit-product active"><i class="icon-search"></i>View</a>                                            
                                </div>
                            </div>
                        </div>
                        <div class="title">
                            <a href="<c:url value="/product/detail/${related.productID}"/>">
                                <h3 class="h6 text-uppercase no-margin-bottom">${related.productName}</h3>
                            </a>
                            <ul class="price list-inline">                
                                <li class="list-inline-item original"><span class="price text-muted">$${related.productDetail.unitPrice}</span></li>
                            </ul>                                   
                        </div>
                    </div>
                </div>                                
            </c:forEach>
        </div>
      </div>
    </section>
    <jsp:include page="include/footer.jsp"/>
    <jsp:include page="include/footer-script.jsp"/>
  </body>
</html>
