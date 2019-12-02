<%-- 
    Document   : product
    Created on : Oct 14, 2019, 1:38:16 PM
    Author     : vanlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <jsp:include page="include/head-css.jsp">
            <jsp:param name="title" value="View Products"/>
    </jsp:include>
  </head>
  <body>
    <jsp:include page="include/header.jsp"/>
    <!-- Hero Section-->
    <section class="hero hero-page gray-bg padding-small">
      <div class="container">
        <div class="row d-flex">
          <div class="col-lg-9 order-2 order-lg-1">
            <h1>Shop</h1><p class="lead text-muted"></p>
          </div>
          <div class="col-lg-3 text-right order-1 order-lg-2">
            <ul class="breadcrumb justify-content-lg-end">
                <li class="breadcrumb-item"><a href="<c:url value="/"/>">Home</a></li>
              <li class="breadcrumb-item active">Shop</li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    <main>
      <div class="container">
        <div class="row">
          <!-- Sidebar-->
          <div class="sidebar col-xl-3 col-lg-4 sidebar">
            <div class="block">
              <h6 class="text-uppercase">Product Categories</h6>
              <c:if test="${not empty categoryList}">
              <ul class="list-unstyled">
                  <c:forEach var="cate" items="${categoryList}" varStatus="index">
                      <li><a href="<c:url value="/filter/category=${cate.categoryName}"/>">${cate.categoryName}<small></small></a></li>
                  </c:forEach>
              </ul>
              </c:if>
            </div>
              
            <div class="block">
              <h6 class="text-uppercase">Filter By Price  </h6>
              <div id="slider-snap"></div>
              
              <div class="value d-flex justify-content-between">
                  
                <div class="min">From 
                    <span id="slider-snap-value-lower" class="example-val"></span>$
                </div>
                <div class="max">To 
                    <span id="slider-snap-value-upper" class="example-val"></span>$
                </div>
              </div>
            </div>
              
            <div class="block">
              <h6 class="text-uppercase">Brands </h6>
              <c:if test="${not empty brandList}">
                    <c:forEach var="brand" items="${brandList}" varStatus="index"> 
                        <div class="form-group mb-1">
                          <input id="checkbox${brand.brandID}" type="checkbox" name="brand" class="checkbox-template" value="${brand.brandName}">
                          <label for="checkbox${brand.brandID}">${brand.brandName} <small></small></label>
                        </div>
                    </c:forEach>
              </c:if>
            </div>
              
            <div class="block">
                <h6 class="text-uppercase">Types</h6>
                    <c:if test="${not empty typeList}">
                        <c:forEach var = "type" items = "${typeList}" varStatus = "index">
                            <div class="form-group mb-1">
                                <input id="radio${type.typeID}" type="checkbox" name="type" class="checkbox-template" value="${type.typeName}">
                                <label for="radio${type.typeID}">${type.typeName}    <small></small></label>
                            </div>
                        </c:forEach>
                    </c:if>
            </div>  
            
            <form role="form" type="hidden" method="get" id="condition-form" action="filter">
                <input type="hidden" name="price-min" id="price-min">
                <input type="hidden" name="price-max" id="price-max">
                <input type="hidden" id="brand" name="brand">
                <input type="hidden" id="type" name="type">
                <input type="button" class="filter-submit" data-inline="true"
                           value="Filter" onclick="condition()">
            </form>
                       
          </div>
          <!-- /Sidebar end-->
          <!-- Grid -->
          <div class="products-grid col-xl-9 col-lg-8 sidebar-left">
            <header class="d-flex justify-content-between align-items-start">
                <span class="visible-items">Showing <strong>1-9 </strong>of <strong>${productList.size()} </strong>results</span>
                <select id="sorting" class="form-control-sm">
                  <option value="<c:url value="/filter/price"/>">No Sort</option>
                  <option value="<c:url value="/filter/price=sort-desc"/>">Hight Price</option>
                  <option value="<c:url value="/filter/price=sort-asc"/>">Low Price</option>
                  <option value="<c:url value="${pageContext.request.contextPath}/filter/oldest"/>">Oldest</option>
                  <option value="<c:url value="${pageContext.request.contextPath}/filter/newest"/>">Newest</option>
                </select>
            </header>
            <div class="row">
            <c:if test="${not empty productList}">
                <c:forEach var="product" items="${productList}" varStatus="index">
                    <!-- item-->
                    <div class="item col-xl-4 col-md-6">
                      <div class="product is-gray">
                        <div class="image d-flex align-items-center justify-content-center">
                                <img src="<c:url value="${product.images.get(0).imageURL}"/>" alt="product" class="img-fluid">
                            <div class="hover-overlay d-flex align-items-center justify-content-center">
                              <div class="CTA d-flex align-items-center justify-content-center">
                                  <a href="<c:url value="cart/add/${product.productID}"/>" class="add-to-cart"><i class="fa fa-shopping-cart"></i></a>
                                  <a href="<c:url value="/product/detail/${product.productID}"/>" class="visit-product active"><i class="icon-search"></i>View</a>                                 
                              </div>
                            </div>
                        </div>
                        <div class="title" align="center">                           
                            <a href="<c:url value="/category/filter/brand=${product.type.typeName}"/>"><small class="text-warning">${product.type.typeName}</small></a>
                            <a href="<c:url value="/product/detail/${product.productID}"/>"><h3 class="h6 no-margin-bottom">${product.productName}</h3></a>
                            <ul class="price list-inline">
                                    <li class="list-inline-item original"><span class="price text-muted">$${product.productDetail.unitPrice }</span></li>
                            </ul>  
                            <a href="<c:url value="/cart/add/${product.productID}"/>" class="btn btn-template " style="width: 180px" >
                                <span class="icon-cart" style="color: white"> ADD TO CART</span>
                            </a>
                        </div>
                      </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${productList.size() == 0}">
                <br>
                <div class="alert alert-warning">
                     There is no data
                </div>
            </c:if>
            </div>
                <nav aria-label="page navigation example" class="d-flex justify-content-center">
                    <ul class="pagination" id="pagination">
                                
                    </ul>
                </nav>
          </div>
          <!-- / Grid End-->
        </div>
      </div>
    </main>
    <div id="scrollTop"><i class="fa fa-long-arrow-up"></i></div>
    
    <jsp:include page="include/footer.jsp"/>
    <jsp:include page="include/footer-script.jsp"/>
    
    <script>
    var snapSlider = document.getElementById('slider-snap');

    noUiSlider.create(snapSlider, {
        start: [ 0, 1000 ],
        snap: false,
        connect: true,
        step: 1,
        range: {
            'min': 0,
            'max': 1000
        }
    });
    var snapValues = [
        document.getElementById('slider-snap-value-lower'),
        document.getElementById('slider-snap-value-upper')
    ];
    snapSlider.noUiSlider.on('update', function( values, handle ) {
        snapValues[handle].innerHTML = values[handle];
    });

    </script>
    
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
            });

            $('#pagination').twbsPagination({
                totalPages: parseInt(${totalPages}),
                visiblePages: parseInt(${visiblePages}),
                initiateStartPageClick: false,
                startPage: parseInt(${startPage}),
                onPageClick: function (event, page) {
                    window.location.href = "?page=" + page;
                }
            });
        });
    </script>
    
    <script type="text/javascript">

    function condition() {
        var brandInputs = document.getElementsByName("brand"),
            arrBrand = new Array();

        var typeInputs = document.getElementsByName("type"),
            arrType = new Array();

        for (var i = 0; i < brandInputs.length; i++) {
            // Take only those inputs which are checkbox

            if (brandInputs[i].type === "checkbox" && brandInputs[i].checked)
                arrBrand.push(brandInputs[i].value);
        }

        for (var j = 0; j < typeInputs.length; j++) {
            // Take only those inputs which are checkbox

            if (typeInputs[j].type === "checkbox" && typeInputs[j].checked)
                arrType.push(typeInputs[j].value);
        }

        var min = document.getElementById('slider-snap-value-lower').innerHTML,
            max = document.getElementById('slider-snap-value-upper').innerHTML;

        var arrBrandString = arrBrand.toString(),
            arrTypeString = arrType.toString();

        document.getElementById("brand").value = arrBrandString;
        document.getElementById("type").value = arrTypeString;
        document.getElementById("price-min").value = min;
        document.getElementById("price-max").value = max;
        document.getElementById("condition-form").submit();
    }

    </script>
    
    <script>
    $(document).ready(function () {
        $('#input-search').autocomplete({
            serviceUrl: '${pageContext.request.contextPath}/auto-complete',
            paramName: "search",
            delimiter: ",",
            transformResult: function (response) {
                return {
                    //must convert json to javascript object before process
                    suggestions: $.map($.parseJSON(response), function (item) {
                        return {value: item.name, data: item.id};
                    })
                };
            }
        });
    });
    </script>
    
  </body>
</html>
