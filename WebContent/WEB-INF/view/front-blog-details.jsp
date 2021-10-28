<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
          <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
     
     


<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>CUbes school | Blog Project</title>
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
        <main class="post blog-post col-lg-8"> 
          <div class="container">
            <div class="post-single">
              <div class="post-thumbnail"><img src="${blog.image}" alt="..." class="img-fluid"></div>
              <div class="post-details">
                <div class="post-meta d-flex justify-content-between">
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

                
                </div>
                <h1>${blog.name}<a href="#"><i class="fa fa-bookmark-o"></i></a></h1>
                <div class="post-footer d-flex align-items-center flex-column flex-sm-row"><a href="/BlogProject/front-blog-user/${blog.user.seoName}/${blog.user.username}" class="author d-flex align-items-center flex-wrap">
                    <div class="avatar"><img src="img/avatar-1.jpg" alt="..." class="img-fluid"></div>
                    <div class="title"><span>${blog.user.nameSurname}</span></div></a>
                  <div class="d-flex align-items-center flex-wrap">       
                    <div class="date"><i class="icon-clock"></i> ${blog.dateFormatted}</div>
                    <div class="views"><i class="icon-eye"></i> ${blog.seenCount}</div>
                    <div class="comments meta-last"><a href="#post-comments"><i class="icon-comment"></i>${blog.commentsNum}</a></div>
                  </div>
                </div>
                <div class="post-body">
                  <p class="lead">${blog.description}</p>
                </div>
                <div class="post-tags">
                 <c:forEach var="tag" items="${blogTags}">
	                <a href="/BlogProject/front-blog-tag/${tag.seoTitle}/${tag.id}" class="tag">#${tag.title}</a>
	             </c:forEach>  
                </div>
                
                
                <div class="posts-nav d-flex justify-content-between align-items-stretch flex-column flex-md-row">
                
                
               <c:if test="${prev != null}">
	                <a href="/BlogProject/front-blog-details/${prev.seoName}/${prev.id}" class="prev-post text-left d-flex align-items-center">
	                    <div class="icon prev"><i class="fa fa-angle-left"></i></div>
	                    <div class="text"><strong class="text-primary"> ${prev.name} </strong>
	                      <h6></h6>
	                    </div>
	                 </a>
               </c:if>
                 
                <c:if test="${next != null}">
	                 <a href="/BlogProject/front-blog-details/${next.seoName}/${next.id}" class="next-post text-right d-flex align-items-center justify-content-end">
	                    <div class="text"><strong class="text-primary">${next.name}</strong>
	                      <h6></h6>
	                    </div>
	                    <div class="icon next"><i class="fa fa-angle-right">   </i></div>
	                 </a>
                  </c:if>
                 
                </div>
                <div class="post-comments" id="post-comments">
                  <header>
                    <h3 class="h6">Post Comments<span class="no-of-comments">(${blog.commentsNum})</span></h3>
                  </header>
                  
                 <c:forEach var="comment" items="${blog.comments}">
                 <c:if test="${comment.enabled}">
	                  <div class="comment">
	                    <div class="comment-header d-flex justify-content-between">
	                      <div class="user d-flex align-items-center">
	                        <div class="image"><img src="img/user.svg" alt="..." class="img-fluid rounded-circle"></div>
	                        <div class="title"><strong>${comment.name}</strong><span class="date">${comment.dateFormatted}</span></div>
	                      </div>
	                    </div>
	                    <div class="comment-body">
	                      <p>${comment.content}</p>
	                    </div>
	                  </div>
                  </c:if>
                </c:forEach>
                 
                
                <div class="add-comment">
                  <header>
                    <h3 class="h6">Leave a reply</h3>
                  </header>
                  
                  <form:form method="post" action="/BlogProject/comment-save/${blog.seoName}/${blog.id}" modelAttribute="comment" class="commenting-form" role="form" >
                  
                  <form:hidden path="id"/>
                  <form:hidden path="dateCreated"/>
                  
                  
                    <div class="row">
                      <div class="form-group col-md-6">
                        <form:input path="name" type="text"  placeholder="Name" class="form-control"/>
                      </div>
                      <div class="form-group col-md-6">
                        <form:input path="email" type="email"  placeholder="Email Address (will not be published)" class="form-control"/>
                      </div>
                      <div class="form-group col-md-12">
                        <form:textarea path="content" type="text"  placeholder="Type your content" class="form-control"/>
                      </div>
                      <div class="form-group col-md-12">
                        <button type="submit" class="btn btn-secondary">Submit Comment</button>
                      </div>
                    </div>
                  </form:form>
                  
                  
                </div>
              </div>
            </div>
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