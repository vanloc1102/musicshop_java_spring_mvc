<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <h4 class="title">Add Suppliers</h4>
                    </div>
                    <div class="content">
                        <form:form action="${pageContext.request.contextPath}/admin/addsuppliers" method="post" modelAttribute="supplier"
                                   enctype="multipart/form-data">

                            <div class="row">
                                <div class="col-md-5">
                                    <div class="form-group">
                                        <label>Brand Name</label>
                                        <form:input path="brandName" class="form-control"></form:input>
                                    </div>
                                </div>
                            </div>


                            <button type="submit" class="btn btn-info btn-fill pull-right">Update </button>
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


<jsp:include page="include/footer.jsp"/>
<jsp:include page="include/footer-script.jsp"/>

</body>

</html>
