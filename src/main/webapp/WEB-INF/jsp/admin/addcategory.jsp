
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
                        <h4 class="title">Add Category</h4>
                    </div>


                    <div class="content">
                        <form:form action="${pageContext.request.contextPath}/admin/addcategory" method="post" modelAttribute="category">

                            <div class="row">

                                <div class="col-md-5">
                                    <div class="form-group">
                                        <label>Category Name</label>
                                        <form:input path="categoryName" class="form-control"></form:input>
                                        <form:errors path="categoryName"/>

                                    </div>
                                </div>

                            </div>


                            <button type="submit" class="btn btn-info btn-fill pull-right">Update Profile</button>

                            <div class="clearfix"></div>
                        </form:form>

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
