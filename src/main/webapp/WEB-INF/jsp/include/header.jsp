<%-- 
    Document   : header
    Created on : Oct 14, 2019, 1:20:34 PM
    Author     : vanlo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- navbar-->
<header class="header">
    <!-- Tob Bar-->
    <div class="top-bar">
        <div class="container-fluid">
            <div class="row d-flex align-items-center">
                <div class="col-lg-6 hidden-lg-down text-col">
                    <ul class="list-inline">
                        <li class="list-inline-item"><i class="icon-telephone"></i>020-800-456-747</li>
                        <li class="list-inline-item">Free shipping on orders over $300</li>
                    </ul>
                </div>
                <div class="col-lg-6 d-flex justify-content-end">
                    <!-- Language Dropdown-->
                    <div class="dropdown show"><a id="langsDropdown" href="https://example.com" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><img src="<c:url value="${request.contextPath}/resources/img/united-kingdom.svg"/>" alt="english">English</a>
                        <div aria-labelledby="langsDropdown" class="dropdown-menu"><a href="#" class="dropdown-item"><img src="<c:url value="${request.contextPath}/resources/img/germany.svg"/>" alt="german">German</a><a href="#" class="dropdown-item"> <img src="<c:url value="${request.contextPath}/resources/img/france.svg"/>" alt="french">French</a></div>
                    </div>
                    <!-- Currency Dropdown-->
                    <div class="dropdown show"><a id="currencyDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle">USD</a>
                        <div aria-labelledby="currencyDropdown" class="dropdown-menu"><a href="#" class="dropdown-item">EUR</a><a href="#" class="dropdown-item"> GBP</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <nav class="navbar navbar-expand-lg">
        <div class="search-area">
            <div class="search-area-inner d-flex align-items-center justify-content-center">
                <div class="close-btn"><i class="icon-close"></i></div>
                <form action="${pageContext.request.contextPath}/filter/search" method="get">
                    <div class="form-group">
                        <input type="search" name="searchInput" id="input-search" placeholder="What are you looking for?">
                        <button type="submit" class="submit"><i class="icon-search"></i></button>
                    </div>
                </form>
            </div>
        </div>
        <div class="container-fluid">  
            <!-- Navbar Header --> <a href="<c:url value="/"/>" class="navbar-brand"><img src="<c:url value="${request.contextPath}/resources/img/logo.jpg"/>" alt="..."></a>
            <button type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler navbar-toggler-right"><i class="fa fa-bars"></i></button>
            <!-- Navbar Collapse -->
            <div id="navbarCollapse" class="collapse navbar-collapse">
                <ul class="navbar-nav mx-auto">
                    <li><a id="navbarHomeLink" href="<c:url value="${request.contextPath}/"/>" class="nav-link ">Home</a></li>
                    <li class="nav-item"><a href="<c:url value="${request.contextPath}/product"/>" class="nav-link">Shop</a></li>                        
                    <c:if test="${not empty categoryList}">
                        <li class="nav-item dropdown">
                            <a id="navbarDropdownMenuLink" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link">Category<i class="fa fa-angle-down"></i></a>
                            <ul aria-labelledby="navbarDropdownMenuLink" class="dropdown-menu">
                                <c:forEach var="cate" items="${categoryList}" varStatus="index">
                                    <li><a href="<c:url value="/filter/category=${cate.categoryName}"/>" class="dropdown-item">${cate.categoryName}</a></li>
                                    </c:forEach>                                    
                            </ul>
                        </li>
                    </c:if>

                    <c:if test="${not empty brandList}">
                        <li class="nav-item dropdown"><a id="navbarDropdownMenuLink" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link">Brand<i class="fa fa-angle-down"></i></a>
                            <ul aria-labelledby="navbarDropdownMenuLink" class="dropdown-menu">
                                <c:forEach var="brand" items="${brandList}" varStatus="index">
                                    <li><a href="<c:url value="/filter/brand=${brand.brandName}"/>" class="dropdown-item">${brand.brandName}</a></li>
                                    </c:forEach>
                            </ul>
                        </li>
                    </c:if>
                    <li class="nav-item"><a href="<c:url value="${request.contextPath}/blog"/>" class="nav-link">Blog </a></li>
                    <li class="nav-item"><a href="<c:url value="${request.contextPath}/contact"/>" class="nav-link">Contact</a></li>
                    <li class="nav-item"><a href="<c:url value="${request.contextPath}/about-us"/>" class="nav-link">About us</a></li>
                    <li class="nav-item"><a href="<c:url value="${request.contextPath}/FAQ"/>" class="nav-link">FAQ</a></li>

                </ul>
                <div class="right-col d-flex align-items-lg-center flex-column flex-lg-row">
                    <!-- Search Button-->
                    <div class="search"><i class="icon-search"></i></div>
                    <!-- User Not Logged - link to login page-->
                    <sec:authorize access="!isAuthenticated()">
                        <div class="user">
                            <a id="userdetails" href="<c:url value="/login"/>" class="user-link"><i class="icon-profile"></i></a>
                        </div>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                        <!-- User Logged: Dropdown -->
                        <div class="user dropdown show">
                            <a id="userdetails" href="https://example.com" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle">
                                <img src="<c:url value="/resources/upload/${customer.customerImg}"/>" alt="" class="rounded-circle" style="width: 30px; height: 30px; margin-right: 5px ">
<!--                                <i class="icon-profile" ></i>-->
                            </a>
                            <ul aria-labelledby="userdetails" class="dropdown-menu">
                                <li class="dropdown-item"><a href="<c:url value="/user/orders"/>">Orders</a></li>
                                <li class="dropdown-item"><a href="<c:url value="/user/address"/>">Addresses</a></li>
                                <li class="dropdown-item"><a href="<c:url value="/user/profile"/>">Profile     </a></li>
                                <li class="dropdown-divider">     </li>
                                <li class="dropdown-item"><a href="<c:url value="/logout"/>">Logout</a></li>
                            </ul>
                        </div>
                    </sec:authorize>
                    <!-- Cart Dropdown-->
                    <div class="cart dropdown show">
                        <c:set var="cart" value="${sessionScope.get('myCart')}" scope="session"/>
                        <a id="cartdetails" href="https://example.com" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle">
                            <i class="icon-cart"></i>
                            <c:if test="${cart == null}">
                                <div class="cart-no">0</div>
                            </c:if>
                            <c:if test="${cart != null}">
                                <div class="cart-no">${cart.cartItems.size()}</div>
                            </c:if>
                        </a>
                        <a href="cart.html" class="text-primary view-cart">View Cart</a>
                        <div aria-labelledby="cartdetails" class="dropdown-menu">
                            <!-- cart item-->
                            <div class="dropdown-item cart-product">
                                <c:if test="${not empty items}">
                                    <c:forEach var="cartItem" items="${items}" varStatus="index">
                                        <div class="d-flex align-items-center">
                                            <div class="img"><img src="<c:url value="${cartItem.image}"/>" alt="..." class="img-fluid"></div>
                                            <div class="details d-flex justify-content-between">
                                                <div class="text"> <a href="#"><strong>${cartItem.name}</strong></a><small>Quantity: ${cartItem.quantity} </small><span class="price">$${cartItem.price*cartItem.quantity} </span></div>
                                                <a href="<c:url value="/cart/delete/${cartItem.id}"/>" class="delete"><i class="fa fa-trash-o"></i></a>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${items.size() == 0}">
                                    <br>
                                    <div class="alert alert-warning">
                                        Cart is empty
                                    </div>
                                </c:if>
                            </div>
                            <!-- total price-->
                            <div class="dropdown-item total-price d-flex justify-content-between"><span>Total</span><strong class="text-primary">$${sum}</strong></div>
                            <!-- call to actions-->
                            <div class="dropdown-item CTA d-flex"><a href="<c:url value="/cart"/>" class="btn btn-template wide">View Cart</a><a href="<c:url value="/checkout"/>" class="btn btn-template wide">Checkout</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</header>