<%-- 
    Document   : Login-Register
    Created on : Oct 15, 2019, 6:15:45 AM
    Author     : vanlo
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
  <head>
      <jsp:include page="include/head-css.jsp">
          <jsp:param name="title" value="My Account"/>
      </jsp:include>
  </head>
  <body>
      <jsp:include page="include/header.jsp"/>
    <!-- Hero Section-->
    <section class="hero hero-page gray-bg padding-small">
      <div class="container">
        <div class="row d-flex">
          <div class="col-lg-9 order-2 order-lg-1">
            <h1>Customer zone</h1>
          </div>
          <div class="col-lg-3 text-right order-1 order-lg-2">
            <ul class="breadcrumb justify-content-lg-end">
              <li class="breadcrumb-item"><a href="index.html">Home</a></li>
              <li class="breadcrumb-item active">Customer zone</li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    <!-- text page-->
    <section class="padding-small">
      <div class="container">
        <div class="row">
          <div class="col-lg-6">
            <div class="block">
              <div class="block-header">
                <h5>Login</h5>
              </div>
              <div class="block-body"> 
                <p class="lead">Already our customer? </p>
                <p class="text-muted">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
                <hr>
                <c:if test="${errorSignIn != null}">
                    <div class="alert alert-danger">
                        <c:out value="${errorSignIn}"/>
                    </div>
                </c:if>
                <form action="<c:url value="/j_spring_security_check"/>" method="POST">
                  <div class="form-group">
                    <label for="username" class="form-label">Username</label>
                    <input name="username" type="text" class="form-control">
                  </div>
                  <div class="form-group">
                    <label for="password" class="form-label">Password</label>
                    <input name="password" type="password" class="form-control">
                  </div>
                  <div class="form-group text-center">
                    <button type="submit" class="btn btn-primary"><i class="fa fa-sign-in"></i> Log in</button>
                  </div>
                  <input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
                </form>
              </div>
            </div>
        </div>
            <div class="col-lg-6">
                <div class="block">
                <div class="block-header">
                  <h5>New account</h5>
                </div>
                <div class="block-body"> 
                    <p class="lead">Not our registered customer yet?</p>
                    <p>With registration with us new world of fashion, fantastic discounts and much more opens to you! The whole process will not take you more than a minute!</p>
                    <p class="text-muted">If you have any questions, please feel free to <a href="contact.html">contact us</a>, our customer service center is working for you 24/7.</p>
                    <hr>
                        <c:if test="${errorSignUp != null}">
                            <div class="alert alert-danger">
                                <c:out value="${errorSignUp}"/>
                            </div>
                        </c:if>
                        <form:form action="register" role="form" method="post" modelAttribute="customer">
                            <div class="row">
                            <div class="form-group col-lg-6">
                                <label for="form-firstname" class="form-label">First name</label>
                                <form:input path="firstName" id="form-firstname" name="form-firstname" type="text" class="form-control"/>
                            </div>
                            <div class="form-group col-lg-6">
                                <label for="form-lastname" class="form-label">Last name</label>
                                <form:input path="lastName" id="form-lastname" name="form-firstname" type="text" class="form-control"/>
                            </div>
                            </div>
                            <div class="form-group">
                                <label for="form-email" class="form-label">Email</label>
                                <form:input path="email" id="form-email" name="form-email" type="email" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label for="form-username" class="form-label">Username</label>
                                <form:input path="account.username" id="form-username" name="form-username" type="text" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="form-password" class="form-label">Password</label>
                                <form:input path="account.password" id="form-password" name="form-password" type="password" class="form-control" />
                            </div>
                            <div class="form-group text-center">
                                <button type="submit" class="btn btn-primary"><i class="icon-profile"></i>Register</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
      </div>
    </section>
    <jsp:include page="include/footer.jsp"/>
    <jsp:include page="include/footer-script.jsp"/>
  </body>
</html>
