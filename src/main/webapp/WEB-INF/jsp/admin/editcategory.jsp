
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
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
                        <h4 class="title">Edit Profile</h4>
                    </div>

                    <form:form action="${pageContext.request.contextPath}/admin/editCategory"  modelAttribute="category1" method="post">
                    <div class="content">

                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>ID Category</label>
                                       <form:input path="categoryID" type="text" name="id" class="form-control"/>

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Category Name</label>

                                        <form:input path="categoryName" type="text" name="name" class="form-control"/>
                                    </div>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-info btn-fill pull-right">Update Category</button>

                            <div class="clearfix"></div>
                    </div>
                    </form:form>
                </div>

            </div>
        </div>
    </div>
</div>
<jsp:include page="include/footer.jsp"/>
<jsp:include page="include/footer-script.jsp"/>
</body>
</html>
