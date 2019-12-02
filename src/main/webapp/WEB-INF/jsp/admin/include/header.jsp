<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="wrapper">
    <div class="sidebar" data-color="purple" data-image="<c:url value="/resources-management/assets/img/sidebar-5.jpg"/>">

        <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->


        <div class="sidebar-wrapper">
            <div class="logo">
                <a  class="simple-text">
                    Music Shop
                </a>
            </div>

            <ul class="nav">
                <li>
                    <a href="<c:url value="/admin/dashboard"/>">
                        <i class="pe-7s-timer"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/admin/report"/>">
                        <i class="pe-7s-graph"></i>
                        <p>Report</p>
                    </a>
                </li>
                <li class="active">
                    <a href="<c:url value="/admin/addcategory"/>">
                        <i class="pe-7s-user"></i>
                        <p>Add Category</p>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/admin/tablelist"/>">
                        <i class="pe-7s-note2"></i>
                        <p>Category & Suppliers</p>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/admin/addproduct"/>">
                        <i class="pe-7s-news-paper"></i>
                        <p>Addproduct</p>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/admin/listproduct"/>">
                        <i class="pe-7s-science"></i>
                        <p>List Product</p>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/admin/addsuppliers"/>">
                        <i class="pe-7s-map-marker"></i>
                        <p>Add Suppliers</p>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/admin/order"/>">
                        <i class="pe-7s-bell"></i>
                        <p>New order</p>
                    </a>
                </li>
                <li class="active-pro">
                    <a href="<c:url value="/"/>">
                        <i class="pe-7s-rocket"></i>
                        <p>Come Back Home</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="main-panel">
        <nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">User</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-left">
                        <li>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-dashboard"></i>
                                <p class="hidden-lg hidden-md">Dashboard</p>
                            </a>
                        </li>

                        <li>
                            <div class="w3l_search">
                                <form action="/header" method="post">
                                    <input type="search" name="name" placeholder="Search for a Product..." required id="input-search">
                                    <button type="submit" class="btn btn-default search" aria-label="Left Align">
                                        <i class="fa fa-search" aria-hidden="true"> </i>
                                    </button>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="">
                                <p>Account</p>
                            </a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <p>
                                    Group by
                                    <b class="caret"></b>
                                </p>

                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="<c:url value="/admin/report"/>">Group by Product</a></li>
                                <li><a href="<c:url value="/admin/reportcategory"/>">Group by Category</a></li>
                                <li><a href="<c:url value="/admin/reportsuppliers"/>">Group by brand</a></li>
                                <li><a href="<c:url value="/admin/reportordercustomer"/>">Group by Customer</a></li>
                                <li><a href="<c:url value="/admin/reportyear"/>">Group by Year</a></li>
                                <li><a href="<c:url value="/admin/reportmonth"/>">Group by Month</a></li>
                                <li><a href="<c:url value="/admin/reportquarter"/>">Group by Quater</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="<c:url value="/logout"/>">
                                <p>Log out</p>
                            </a>
                        </li>
                        <li class="separator hidden-lg hidden-md"></li>
                    </ul>
                </div>
            </div>
        </nav>

</body>
</html>
