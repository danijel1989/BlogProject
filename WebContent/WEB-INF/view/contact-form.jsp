<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
           <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     

    <!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Blog project - Contact form</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/https://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
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
    
    <!-- Hero Section -->
    <section style="background: url(${pageContext.request.contextPath}/front/img/hero.jpg); background-size: cover; background-position: center center" class="hero">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <h1>Cubes school - Blog project 2020/2021</h1>
          </div>
        </div>
      </div>
    </section>
    <div class="container">
      <div class="row">
        <!-- Latest Posts -->
        <main class="col-lg-8"> 
          <div class="container">
          
          
            <form:form action="contact-save" modelAttribute="message" class="commenting-form">
            
              <div class="row">
                <div class="form-group col-md-6">
                  <form:input path="name" type="text" placeholder="Your Name" class="form-control"/>
                </div>
                <div class="form-group col-md-6">
                  <form:input path="surname" type="text" placeholder="Your Surname" class="form-control"/>
                </div>
                <div class="form-group col-md-6">
                  <form:input path="email" type="email" placeholder="Email Address (will not be published)" class="form-control"/>
                </div>
                <div class="form-group col-md-12">
                  <form:textarea path="message" placeholder="Type your message" class="form-control" rows="20"/>
                </div>
                <div class="form-group col-md-12">
                  <button type="submit" class="btn btn-secondary">Submit Your Message</button>
                </div>
              </div>
            </form:form>
            
            
          </div>
        </main>
        <aside class="col-lg-4">
          <!-- Widget [Contact Widget]-->
          <div class="widget categories">
            <header>
              <h3 class="h6">Contact Info</h3>
              <div class="item d-flex justify-content-between">
                <span>15 Yemen Road, Yemen</span>
                <span><i class="fa fa-map-marker"></i></span>
              </div>
              <div class="item d-flex justify-content-between">
                <span>(020) 123 456 789</span>
                <span><i class="fa fa-phone"></i></span>
              </div>
              <div class="item d-flex justify-content-between">
                <span>info@company.com</span>
                <span><i class="fa fa-envelope"></i></span>
              </div>
            </header>
            
          </div>
          <div class="widget latest-posts">
            <header>
              <h3 class="h6">Latest Posts</h3>
            </header>
            
                  <c:forEach var="blog" items="${blogsAside}">
	            <div class="blog-posts">
		            <a href="front-blog-details?id=${blog.id}">
		                <div class="item d-flex align-items-center">
		                  <div class="image"><img src="${blog.image}" alt="..." class="img-fluid"></div>
		                  <div class="title"><strong>${blog.name}</strong>
		                    <div class="d-flex align-items-center">
		                      <div class="views"><i class="icon-eye"></i> ${blog.seenCount}</div>
		                      <div class="comments"><i class="icon-comment"></i>12</div>
		                    </div>
		                  </div>
		                </div>
		             </a>
	            </div>
	           
            </c:forEach> 
            
            
            </div>
          </div>
        </aside>
      </div>
    </div>
    
    
    <!-- Page Footer-->
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