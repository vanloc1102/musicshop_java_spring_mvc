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
                        <h4 class="title">All Product In Store</h4>
                        <%--<p class="category">Here is a subtitle for this table</p>--%>
                    </div>
                    <div class="content table-responsive table-full-width">
                        <table class="table table-hover table-striped">
                            <thead>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Category</th>
                            <th>Type</th>
                            <th>Brand</th>
                            <th>Action</th>
                            <th>Action</th>
                            </thead>
                            <tbody>
                            <c:forEach items="${productList}" var="productList">
                                <tr>
                                    <td>${productList.productID}</td>
                                    <td>${productList.productName}</td>
                                    <td>${productList.category.categoryName}</td>
                                    <td>${productList.type.typeName}</td>
                                    <td>${productList.brand.brandName}</td>
                                    <td><a href="${pageContext.request.contextPath}/admin/editproduct?id=${productList.productID}"><img src="<c:url value="/resources-management/assets/img/icon/edit.svg "/>" height="20" width="20" ></a></td>
                                        <%--<a href="/admin/editproduct?id=${productList.id}"></a></td>--%>

                                    <td><a href="${pageContext.request.contextPath}/deletepro/${productList.productID}"><img src="<c:url value="/resources-management/assets/img/icon/delete.svg"/>" height="20"
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
