<%-- 
    Document   : blog
    Created on : Oct 15, 2019, 9:07:53 AM
    Author     : vanlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <jsp:include page="include/head-css.jsp">
        <jsp:param name="title" value="Blog Page"/>
    </jsp:include>
  </head>
  <body>
      <jsp:include page="include/header.jsp"/>
    <!-- Hero Section-->
    <section class="hero hero-page gray-bg padding-small">
      <div class="container">
        <div class="row d-flex">
          <div class="col-lg-9 order-2 order-lg-1">
            <h1>Blog</h1>
          </div>
          <div class="col-lg-3 text-right order-1 order-lg-2">
            <ul class="breadcrumb justify-content-lg-end">
              <li class="breadcrumb-item"><a href="index.html">Home</a></li>
              <li class="breadcrumb-item active">Blog</li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    <section class="blog">
      <div class="container">
        <div class="row">
          <!-- post-->
          <div class="col-lg-6">
            <div class="post post-gray d-flex align-items-center flex-md-row flex-column">
              <div class="thumbnail d-flex-align-items-center justify-content-center"><img src="img/blog-1.jpg" alt="..."></div>
              <div class="info"> 
                <h4 class="h5"> <a href="post.html">Newest photo apps          </a></h4><span class="date"><i class="fa fa-clock-o"></i>May 10th 2016</span>
                <p>ellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Aenean ultricies mi vitae est. </p><a href="post.html" class="read-more">Read More<i class="fa fa-long-arrow-right"></i></a>
              </div>
            </div>
          </div>
          <!-- /end post-->
          
          <!-- post-->
          <div class="col-lg-6">
            <div class="post post-gray d-flex align-items-center flex-md-row flex-column">
              <div class="thumbnail d-flex-align-items-center justify-content-center"><img src="img/blog-2.jpg" alt="..."></div>
              <div class="info"> 
                <h4 class="h5"> <a href="post.html">Best books about Photography          </a></h4><span class="date"><i class="fa fa-clock-o"></i>May 10th 2016</span>
                <p>Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante.  Mauris placerat eleifend leo.</p><a href="post.html" class="read-more">Read More<i class="fa fa-long-arrow-right"></i></a>
              </div>
            </div>
          </div>
          <!-- /end post-->
          
          <!-- post-->
          <div class="col-lg-6">
            <div class="post post-gray d-flex align-items-center flex-md-row flex-column">
              <div class="thumbnail d-flex-align-items-center justify-content-center"><img src="img/blog2.jpg" alt="..."></div>
              <div class="info"> 
                <h4 class="h5"> <a href="post.html">Best books about Fashion          </a></h4><span class="date"><i class="fa fa-clock-o"></i>May 10th 2016</span>
                <p>ellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae.  Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p><a href="post.html" class="read-more">Read More<i class="fa fa-long-arrow-right"></i></a>
              </div>
            </div>
          </div>
          <!-- /end post-->
          
          <!-- post-->
          <div class="col-lg-6">
            <div class="post post-gray d-flex align-items-center flex-md-row flex-column">
              <div class="thumbnail d-flex-align-items-center justify-content-center"><img src="img/blog1.jpg" alt="..."></div>
              <div class="info"> 
                <h4 class="h5"> <a href="post.html">Autumn fashion tips and tricks          </a></h4><span class="date"><i class="fa fa-clock-o"></i>May 10th 2016</span>
                <p>Pellentesque habitant morbi tristique senectus. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante.  Mauris placerat eleifend leo.</p><a href="post.html" class="read-more">Read More<i class="fa fa-long-arrow-right"></i></a>
              </div>
            </div>
          </div>
          <!-- /end post-->
          
          <!-- post-->
          <div class="col-lg-6">
            <div class="post post-gray d-flex align-items-center flex-md-row flex-column">
              <div class="thumbnail d-flex-align-items-center justify-content-center"><img src="img/blog-1.jpg" alt="..."></div>
              <div class="info"> 
                <h4 class="h5"> <a href="post.html">Newest photo apps          </a></h4><span class="date"><i class="fa fa-clock-o"></i>May 10th 2016</span>
                <p>ellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Aenean ultricies mi vitae est. </p><a href="post.html" class="read-more">Read More<i class="fa fa-long-arrow-right"></i></a>
              </div>
            </div>
          </div>
          <!-- /end post-->
          
          <!-- post-->
          <div class="col-lg-6">
            <div class="post post-gray d-flex align-items-center flex-md-row flex-column">
              <div class="thumbnail d-flex-align-items-center justify-content-center"><img src="img/blog-2.jpg" alt="..."></div>
              <div class="info"> 
                <h4 class="h5"> <a href="post.html">Best books about Photography          </a></h4><span class="date"><i class="fa fa-clock-o"></i>May 10th 2016</span>
                <p>Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante.  Mauris placerat eleifend leo.</p><a href="post.html" class="read-more">Read More<i class="fa fa-long-arrow-right"></i></a>
              </div>
            </div>
          </div>
          <!-- /end post-->
          
        </div>
        <!-- Pagination -->
        <nav aria-label="..." class="d-block w-100">
          <ul class="pagination pagination-custom d-flex justify-content-between d-block w-100">
            <li class="page-item"><a href="#" class="page-link">&lt; Older posts</a></li>
            <li class="page-item disabled"><a href="#" tabindex="-1" class="page-link">Newer posts  &gt;                                   </a></li>
          </ul>
        </nav>
      </div>
    </section>
    <jsp:include page="include/footer.jsp"/>
    <jsp:include page="include/footer-script.jsp"/>
  </body>
</html>
