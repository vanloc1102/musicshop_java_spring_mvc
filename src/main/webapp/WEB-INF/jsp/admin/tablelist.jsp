<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="include/head-css.jsp"/>
</head>
<body>
<jsp:include page="include/header.jsp"/>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Manager Product Categories</h4>
                                <p class="category">Here is a subtitle for this table.</p>
                            </div>
                            <div class="content table-responsive table-full-width">

                                <table class="table table-hover table-striped">
                                    <thead>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Action</th>
                                    <th>Action</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${categoryList}" var="categoryList">
                                        <tr>
                                            <td>${categoryList.categoryID}</td>
                                            <td>${categoryList.categoryName}</td>
                                            <td><a href="<c:url value="/admin/editCategory?id=${categoryList.categoryID}"/>">
                                                    <img src="<c:url value="/resources-management/assets/img/icon/edit.svg"/>" height="20" width="20"></a></td>
                                                    <td><a href="<c:url value="/delete/${categoryList.categoryID}"/>">
                                                    <img src="<c:url value="/resources-management/assets/img/icon/delete.svg"/>" height="20"width="20"></a></td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>


                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="card card-plain">
                            <div class="header">
                                <h4 class="title">Manager Product Suppliers</h4>
                                <p class="category">Here is a subtitle for this table</p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">
                                    <thead>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Action</th>
                                    <th>Action</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${supplierList}" var="supplierList">
                                        <tr>
                                            <td>${supplierList.brandID}</td>
                                            <td>${supplierList.brandName}</td>
                                            <td>
                                                <a href="<c:url value="/admin/editsuppliers?id=${supplierList.brandID}"/>"><img src="<c:url value="/resources-management/assets/img/icon/edit.svg "/>" height="20" width="20"></a></td>
                                            <td><a href="<c:url value="/deletesup/${supplierList.brandID}"/>"><img src="<c:url value="/resources-management/assets/img/icon/delete.svg"/>" height="20"
                                                                                             width="20"></a></td>


                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>

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
