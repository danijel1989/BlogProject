<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Blog project | Homepage</title>
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
    <!-- owl carousel 2 stylesheet-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/plugins/owl-carousel2/assets/owl.carousel.min.css" id="theme-stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/plugins/owl-carousel2/assets/owl.theme.default.min.css" id="theme-stylesheet">
  </head>
  <body>
  
  
    <jsp:include page="include-front-header.jsp"></jsp:include>

    <!-- Hero Section-->
    <div id="index-slider" class="owl-carousel">
    
    <c:forEach var="slider" items="${sliders}">
    
	   <c:if test="${slider.enabled}">
	   
	       <c:if test="${slider.orderNum != 0}">
		      <section style="background: url(${slider.image}); background-size: cover; background-position: center center" class="hero">
		        <div class="container">
		          <div class="row">
		            <div class="col-lg-7">
		              <h1>${slider.title}</h1>
		              <h4>${slider.description}</h4>
		              <a href="${slider.url}" class="hero-link"><strong>${slider.buttonTitle}</strong></a>
		            </div>
		          </div>
		        </div>
		      </section>
          </c:if>
      </c:if>
      
    </c:forEach>
     
    </div>

    <!-- Intro Section-->
    <section class="intro">
      <div class="container">
        <div class="row">
          <div class="col-lg-8">
            <h2 class="h3">Latest Blog Posts</h2>
            <p class="text-big"> Singled out three blog posts by the choise of our members</p>
          </div>
        </div>
      </div>
    </section>
    <section class="featured-posts no-padding-top">
      <div class="container">
      
       <c:forEach var="blog" items="${blogs}">
	        <!-- Post-->
	        
	       
	       <c:choose>
	       
	       		<c:when test="${blog.id%2!=0}">
	       		
	       		<div class="row d-flex align-items-stretch">
	          
	          <div class="text col-lg-7">
	            <div class="text-inner d-flex align-items-center">
	              <div class="content">
	              
	              
	                <header class="post-header">
	                
	                  <div class="category">
		                  <c:choose>
			                  	<c:when test="${blog.category.id == 20}">
			                  	<a>${blog.category.name}</a>
			                  	</c:when>
			                    <c:otherwise>
			                    <a href="front-blog-category/${blog.category.seoName}/${blog.category.id}">${blog.category.name}</a>
			                    </c:otherwise>
		                  </c:choose>
	                  </div>
	                  <a href="front-blog-details/${blog.seoName}/${blog.id}">
	                    <h2 class="h4">${blog.name}</h2>
	                  </a>
	                </header>
	                
	                
	                <p>${blog.description}</p>
	                <footer class="post-footer d-flex align-items-center"><a href="front-blog-user/${blog.user.seoName}/${blog.user.username}" class="author d-flex align-items-center flex-wrap">
	                    <div class="avatar"><img src="" alt="..." class="img-fluid"></div>
	                    <div class="title"><span>${blog.user.nameSurname}</span></div></a>
	                  <div class="date"><i class="icon-clock"></i> ${blog.dateFormatted}</div>
	                  <div class="comments"><i class="icon-comment"></i>${blog.commentsNum}</div>
	                </footer>
	              </div>
	            </div>
	          </div>
	          
	          <div class="image col-lg-5"><img src="${blog.image}" alt="..."></div>
	        </div>
	       		
	       		
	       		</c:when>
	       		
	       		<c:otherwise>
	       		
	       		<div class="row d-flex align-items-stretch">
	          
	          <div class="image col-lg-5"><img src="${blog.image}" alt="..."></div>
	         
	          <div class="text col-lg-7">
	            <div class="text-inner d-flex align-items-center">
	              <div class="content">
	              
	              
	                <header class="post-header">
	                
	                  <div class="category">
		                  <c:choose>
			                  	<c:when test="${blog.category.id == 20}">
			                  	<a>${blog.category.name}</a>
			                  	</c:when>
			                    <c:otherwise>
			                    <a href="front-blog-category/${blog.category.seoName}/${blog.category.id}">${blog.category.name}</a>
			                    </c:otherwise>
		                  </c:choose>
	                  </div>
	                  <a href="front-blog-details/${blog.seoName}/${blog.id}">
	                    <h2 class="h4">${blog.name}</h2>
	                  </a>
	                </header>
	                
	                
	                <p>${blog.description}</p>
	                <footer class="post-footer d-flex align-items-center"><a href="front-blog-user/${blog.user.seoName}/${blog.user.username}" class="author d-flex align-items-center flex-wrap">
	                    <div class="avatar"><img src="" alt="..." class="img-fluid"></div>
	                    <div class="title"><span>${blog.user.nameSurname}</span></div></a>
	                  <div class="date"><i class="icon-clock"></i> ${blog.dateFormatted}</div>
	                  <div class="comments"><i class="icon-comment"></i>${blog.commentsNum}</div>
	                </footer>
	              </div>
	            </div>
	          </div>
	          
	          
	        </div>
	       		
	       		</c:otherwise>
	       
	       </c:choose>
	       
	        
	        
	        <br><br>
	        
       </c:forEach>
      
      </div>
    </section>
    <!-- Divider Section-->
    <section style="background: url(${pageContext.request.contextPath}/front/img/divider-bg.jpg); background-size: cover; background-position: center bottom" class="divider">
      <div class="container">
        <div class="row">
          <div class="col-md-7">
            <h2>Cubes School | Blog Project</h2>
            <a href="contact-form" class="hero-link">Contact Us</a>
          </div>
        </div>
      </div>
    </section>
    
    
<!-- Latest Posts -->
    <section class="latest-posts"> 
      <div class="container">
        <header> 
          <h2>Latest blogs</h2>
          <p class="text-big">Latest 12 blog posts</p>
        </header>
        <div class="owl-carousel" id="latest-posts-slider">
        
        
          <div class="row">
          
          <c:forEach var="blog" items="${blogsSlider}">
          
            <div class="post col-md-4">
              <div class="post-thumbnail"><a href="front-blog-details/${blog.seoName}/${blog.id}"><img src="${blog.image}" alt="..." class="img-fluid"></a></div>
              <div class="post-details">
                <div class="post-meta d-flex justify-content-between">
                  <div class="date">${blog.dateFormatted}</div>
                  <div class="category"><a href="blog-category.html">Business</a></div>
                </div><a href="blog-post.html">
                  <h3 class="h4">${blog.name}</h3></a>
                <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.</p>
              </div>
            </div>
          
          </c:forEach>  
            
            
          </div>
          
          
          <div class="row">
          
             <c:forEach var="blog" items="${blogsSlider1}">
          
            <div class="post col-md-4">
              <div class="post-thumbnail"><a href="front-blog-details/${blog.seoName}/${blog.id}"><img src="${blog.image}" alt="..." class="img-fluid"></a></div>
              <div class="post-details">
                <div class="post-meta d-flex justify-content-between">
                  <div class="date">${blog.dateFormatted}</div>
                  <div class="category"><a href="blog-category.html">Business</a></div>
                </div><a href="blog-post.html">
                  <h3 class="h4">${blog.name}</h3></a>
                <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.</p>
              </div>
            </div>
          
          </c:forEach>  
            
          </div>
          
          
          <div class="row">
          
             <c:forEach var="blog" items="${blogsSlider2}">
          
            <div class="post col-md-4">
              <div class="post-thumbnail"><a href="front-blog-details/${blog.seoName}/${blog.id}"><img src="${blog.image}" alt="..." class="img-fluid"></a></div>
              <div class="post-details">
                <div class="post-meta d-flex justify-content-between">
                  <div class="date">${blog.dateFormatted}</div>
                  <div class="category"><a href="blog-category.html">Business</a></div>
                </div><a href="blog-post.html">
                  <h3 class="h4">${blog.name}</h3></a>
                <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.</p>
              </div>
            </div>
          
          </c:forEach>  
            
          </div>
          
          
        </div>
      </div>
    </section>
    
    <jsp:include page="include-front-footer.jsp"></jsp:include>  
  
  
    <!-- JavaScript files-->
    <script src="${pageContext.request.contextPath}/front/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/front/vendor/popper.js/umd/popper.min.js"> </script>
    <script src="${pageContext.request.contextPath}/front/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/front/vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="${pageContext.request.contextPath}/front/vendor/@fancyapps/fancybox/jquery.fancybox.min.js"></script>
    <script src="${pageContext.request.contextPath}/front/js/front.js"></script>


    <script src="${pageContext.request.contextPath}/front/plugins/owl-carousel2/owl.carousel.min.js"></script>
    <script>
      $("#index-slider").owlCarousel({
        "items": 1,
        "loop": true,
        "autoplay": true,
        "autoplayHoverPause": true
      });

      $("#latest-posts-slider").owlCarousel({
        "items": 1,
        "loop": true,
        "autoplay": true,
        "autoplayHoverPause": true
      });
    </script>
    
  </body>
</html>