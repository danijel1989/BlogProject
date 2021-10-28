<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
     <%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags" %>
     
     
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>Cubes school | Blog project</title>

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

  <jsp:include page="include-admin-navigation.jsp"></jsp:include>

  <jsp:include page="include-admin-sidebar.jsp"></jsp:include>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Blogs</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Blogs</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
      
        <div class="row">
       
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">All Blogs</h3>
                <div class="card-tools">
                  <a href="blog-form" class="btn btn-success">
                    <i class="fas fa-plus-square"></i>
                    Add new Blog
                  </a>
                </div>
              </div>
              <!-- /.card-header -->
              
              <div class="card">
              
              <!-- /.card-header -->
              <div class="card-body">
              
              
                <form id="entities-filter-form" method="GET" action="">
                  <div class="row">
                  
                    <div class="col-md-3 form-group">
                      <label>Name</label>
                      <input type="search" name="text" class="form-control" placeholder="Search by name" <c:if test="${text == textSelected}"> selected </c:if>>
                    </div>
                    
                     <div class="col-md-2 form-group">
                      <label>Category</label>
                      <select class="form-control" name="category">
                       <option value="${null}">-- choose category --</option>
                         	<c:forEach var="category" items="${categories}">
                           		<option value="${category.id}" <c:if test="${category.id == categorySelected}"> selected </c:if>  >${category.name}</option>
                        	</c:forEach>
                      </select>
                    </div>
                    
                    <div class="col-md-2 form-group">
                      <label>Author</label>
                      <select class="form-control" name="user" >
                         <option value="${null}">-- choose author --</option> 
                        <c:forEach var="user" items="${authors}">
                        <option value="${user.username}" <c:if test="${user.username == userSelected}"> selected </c:if> >${user.name}</option>
                        </c:forEach>
                      </select>
                    </div>
                    
                    <div class="col-md-1 form-group">
                      <label>Enabled</label>
                      <select class="form-control" name="enabled">
                        <option value="${null}" <c:if test="${null == enabledSelected}"> selected </c:if>  >---</option>
                        <option value="${true}" <c:if test="${true == enabledSelected}"> selected </c:if> >Enable</option>
                        <option value="${false}" <c:if test="${false == enabledSelected}"> selected</c:if> >Disable</option>
                      </select>
                    </div>
                  </div>
                  
                  <button type="submit" name="filter-form" value="filter"
                                class="btn btn-success text-uppercase">Apply filter</button>
                  
                </form>
                
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                
              </div>
            </div>
              
              
              
              
              <div class="card-body">
                <table class="table table-bordered">
                  <thead>                  
                    <tr>
                      <th style="width: 5px">ID</th>
                     
                      <th style="width: 20%;">Name</th>
                      
                      <th style="width: 30%;">Description</th>
                      
                      <th style="width: 10%;">Image</th>
                      
                      <th style="width: 10%;">Author</th>
                     
                      <th class="text-center">Category</th>
                      
                      <th class="text-center">Actions</th>
                    </tr>
                  </thead>
                  <tbody>
                  
                  <sec:authorize access="hasAnyRole('admin','blogger')">
                    <c:forEach var="blog" items="${blogsSearch}">
                    
                     		<tr>
	                      <td>
	                        ${blog.id}.
	                      </td>
	                      <td>
	                        <strong>${blog.name}</strong>
	                      </td>
	                      <td>
	                        ${blog.description}
	                      </td>
	                      <td class="text-center">
                       		 <img src="${blog.image}" style="max-width: 80px;">
                         </td>
	                       <td>
	                        ${blog.user.name}
	                      </td>
	                      <td>
	                        ${blog.category.name}
	                      </td>
	                      
	                      <td class="text-center">
	                        <div class="btn-group">
	                        
	                          <a href="blog-detail?id=${blog.id}" class="btn btn-info" target="_blank">
	                            <i class="fas fa-eye"></i>
	                          </a>
	                          
	                          <c:choose>
		                        	<c:when test="${blog.enabled}">
			                        	 <a href="blog-enabled?id=${blog.id}" class="btn btn-info" target="_blank">
			                             <i class="fas fa-check"></i>
			                             </a>
		                        	</c:when>
		                        	<c:otherwise>
		                        		 <a href="blog-enabled?id=${blog.id}" class="btn btn-danger" target="_blank">
			                             <i class="fas fa-check"></i>
			                             </a>
		                        	</c:otherwise>
	                          </c:choose>
	                          
	                          <a href="blog-update?id=${blog.id}" class="btn btn-info">
	                            <i class="fas fa-edit"></i>
	                          </a>
	                          <button type="button" class="btn btn-info" data-toggle="modal" data-target="#delete-modal-${blog.id}">
	                            <i class="fas fa-trash"></i>
	                          </button>
	                          
	                          <c:choose>
	                          	<c:when test="${blog.isImportant}">
		                          	<a href="blog-important?id=${blog.id}" class="btn btn-info">
		                            <i class="fas fa-star"></i>
		                            </a>
	                          	</c:when>
	                          	<c:otherwise>
	                          	    <a href="blog-important?id=${blog.id}" class="btn btn-info">
		                            <i class="far fa-star"></i>
		                            </a>
	                          	</c:otherwise>
	                          </c:choose>
	                          
	                        </div>
	                      </td>
	                    </tr>
	                     <div class="modal fade" id="delete-modal-${blog.id}">
						      <div class="modal-dialog">
						        <div class="modal-content">
						          <div class="modal-header">
						            <h4 class="modal-title">Delete Blog</h4>
						            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						              <span aria-hidden="true">&times;</span>
						            </button>
						          </div>
						          <div class="modal-body">
						            <p>Are you sure you want to delete blog ${blog.name}?</p>
						            <strong></strong>
						          </div>
						          <div class="modal-footer justify-content-between">
						            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						            <a href="blog-delete?id=${blog.id}">
						            <button type="button" class="btn btn-danger">Delete</button>
						            </a>
						          </div>
						        </div>
						        <!-- /.modal-content -->
						      </div>
						      <!-- /.modal-dialog -->
					    </div>
					    <!-- /.modal -->
					    
                    </c:forEach>
                    </sec:authorize>
                    
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                
              </div>
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="float-right d-none d-sm-inline">
      PHP Laravel
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2019 <a href="https://cubes.edu.rs">Cubes School</a>.</strong> All rights reserved.
  </footer>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/admin/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${pageContext.request.contextPath}/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/admin/dist/js/adminlte.min.js"></script>
</body>
</html>
