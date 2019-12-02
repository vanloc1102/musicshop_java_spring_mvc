<%-- 
    Document   : 404
    Created on : Oct 15, 2019, 9:03:09 AM
    Author     : vanlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
      <jsp:include page="include/head-css.jsp">
        <jsp:param name="title" value="404 Not Found"/>
    </jsp:include>
  </head>
  <body>
      <jsp:include page="include/header.jsp"/>
    <!-- Hero Section-->
    <section class="hero hero-page gray-bg padding-small">
      <div class="container">
        <h1>Page not found</h1>
      </div>
    </section>
    <!-- text page-->
    <section class="padding-small">
      <div class="container">
        <div class="row">
          <div class="col-xl-8 col-lg-10">
            <h2 class="text-superbig">404</h2>
            <p class="lead">We don't know what what happened but that <strong>page is not here</strong>.</p>
            <p class="lead">Please <a href="#" class="search text-bold">use search</a> or <a href="index.html" class="text-bold">start from the homepage</a>.</p>
          </div>
        </div>
      </div>
    </section>
    <jsp:include page="include/footer.jsp"/>
    <jsp:include page="include/footer-script.jsp"/>
  </body>
</html>
