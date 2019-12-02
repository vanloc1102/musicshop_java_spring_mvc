<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                        <h4 class="title">Add Product</h4>
                    </div>
                    <div class="content">
                        <form:form action="/admin/editsuppliers" method="post" modelAttribute="supplier1" enctype="multipart/form-data">

                            <div class="row">
                                <div class="col-md-5">
                                    <div class="form-group">
                                        <label>Mã Nhà Cung Cấp</label>
                                        <form:input path="id" class="form-control"></form:input>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>SĐT

                                        </label>
                                        <form:input path="email" class="form-control"></form:input>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Logo</label>
                                        <input name="file" type="file" class="form-control">
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>
                                            Tên Tên Cung Cấp</label>
                                        <form:input path="name" class="form-control"></form:input>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>SĐT</label>
                                        <form:input path="phone" class="form-control"></form:input>
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
                        <img src="https://ununsplash.imgix.net/photo-1431578500526-4d9613015464?fit=crop&fm=jpg&h=300&q=75&w=400"
                             alt="..."/>
                    </div>
                    <div class="content">
                        <div class="author">
                            <a href="#">
                                <img class="avatar border-gray" src="/resources-management/assets/img/faces/admintu.jpg"
                                     alt="..."/>

                                <h4 class="title">Mike Andrew<br/>
                                    <small>michael24</small>
                                </h4>
                            </a>
                        </div>
                        <p class="description text-center"> "Lamborghini Mercy <br>
                            Your chick she so thirsty <br>
                            I'm in that two seat Lambo"
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
