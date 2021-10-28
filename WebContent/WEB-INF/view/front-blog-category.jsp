<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Blog Project - Blogs by Category</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Custom icon font-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/fontastic.css">
    <!-- Google fonts - Open Sans-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
    <!-- Fancybox-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/vendor/@fancyapps/fancybox/jquery.fancybox.min.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/front/favicon.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <body>
    
    <jsp:include page="include-front-header.jsp"></jsp:include>
    
    <div class="container">
      <div class="row">
        <!-- Latest Posts -->
        <main class="posts-listing col-lg-8"> 
          <div class="container">
            <h2 class="mb-3">Blogs from category - "${category.name}"</h2>
            <div class="row">
            
            <c:forEach var="blog" items="${blogs}">
              <!-- post -->
              <div class="post col-xl-6">
                <div class="post-thumbnail"><a href="/BlogProject/front-blog-details/${blog.seoName}/${blog.id}"><img src="${blog.image}" alt="..." class="img-fluid"></a></div>
                <div class="post-details">
                  <div class="post-meta d-flex justify-content-between">
                    <div class="date meta-last">${blog.dateFormatted}</div>
                   <c:choose>
                	<c:when test="${blog.category.id == 20}">
                	<div class="category">
                  <a>${blog.category.name}</a>
                  </div>
                	</c:when>
                	<c:otherwise>
                	<div class="category">
                  <a href="/BlogProject/front-blog-category/${blog.category.seoName}/${blog.category.id}">${blog.category.name}</a>
                  </div>
                	</c:otherwise>
                </c:choose>
                  </div><a href="/BlogProject/front-blog-details/${blog.seoName}/${blog.id}">
                    <h3 class="h4">${blog.name}</h3></a>
                  <p class="text-muted">${blog.description}</p>
                  <footer class="post-footer d-flex align-items-center"><a href="/BlogProject/front-blog-user/${blog.user.seoName}/${blog.user.username}" class="author d-flex align-items-center flex-wrap">
                      <div class="avatar"><img src="${pageContext.request.contextPath}/front/img/avatar-3.jpg" alt="..." class="img-fluid"></div>
                      <div class="title"><span>${blog.user.nameSurname}</span></div></a>
                    <div class="date"><i class="icon-clock"></i> ${blog.dateFormatted}</div>
                    <div class="comments meta-last"><i class="icon-comment"></i>12</div>
                  </footer>
                </div>
              </div>
             </c:forEach> 
              
              
            </div>
            <!-- Pagination -->
            <nav aria-label="Page navigation example">
              <ul class="pagination pagination-template d-flex justify-content-center">
                <li class="page-item"><a href="#" class="page-link"> <i class="fa fa-angle-left"></i></a></li>
                <li class="page-item"><a href="#" class="page-link active">1</a></li>
                <li class="page-item"><a href="#" class="page-link">2</a></li>
                <li class="page-item"><a href="#" class="page-link">3</a></li>
                <li class="page-item"><a href="#" class="page-link"> <i class="fa fa-angle-right"></i></a></li>
              </ul>
            </nav>
          </div>
        </main>
        
        
         <jsp:include page="include-front-aside.jsp"></jsp:include>
        
      </div>
    </div>
    
    
    <jsp:include page="include-front-footer.jsp"></jsp:include>  
  
    <!-- JavaScript files-->
    <script src="${pageContext.request.contextPath}/front/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/front/vendor/popper.js/umd/popper.min.js"> </script>
    <script src="${pageContext.request.contextPath}/front/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/front/vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="${pageContext.request.contextPath}/front/vendor/@fancyapps/fancybox/jquery.fancybox.min.js"></script>
    <script src="${pageContext.request.contextPath}/front/js/front.js"></script>
  </body>
</html>