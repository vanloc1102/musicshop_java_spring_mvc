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
                        <h4 class="title">Order Analysis</h4>
                        <%--<p class="category">Here is a subtitle for this table</p>--%>
                    </div>
                    <div class="content table-responsive table-full-width">
                        <table class="table table-hover table-striped">
                            <thead>

                            <th>Id</th>
                            <th>Tên Sản Phẩm</th>
                            <th>Giá cao nhất	</th>

                            </thead>
                            <tbody>
                            <c:forEach items="${orderDetails}" var="orderDetails">
                                <tr>
                                    <td>${orderDetails.order.orderID}</td>
                                    <td>${orderDetails.product.productName}</td>
                                    <td>${orderDetails.totalPrice}</td>
                                    <td><a href="<c:url value="/admin/editorder?id=${orderDetails.orderDetailID}"/>"> Edit</a></td>

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
