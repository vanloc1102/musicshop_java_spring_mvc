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
                        <h4 class="title"> Revenue statistics </h4>
                        <p class="category">Here is a subtitle for this table</p>
                    </div>
                    <div class="content table-responsive table-full-width">
                        <table class="table table-hover table-striped">
                            <thead>

                            <th>Object(Customer,Category,Brand..)</th>
                            <th>Quantity</th>
                            <th>Sale figure</th>
                            <th>Average price</th>
                            <th>Min price</th>
                            <th>Max price</th>

                            </thead>
                            <tbody>
                            <c:forEach items="${listTest}" var="report">
                                <tr>
                                    <td>${report[0]}</td>
                                    <td>${report[1]}</td>
                                    <td>${report[2]}</td>
                                    <td>${report[3]}</td>
                                    <td>${report[4]}</td>
                                    <td>${report[5]}</td>
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
