<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    
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
            <h1>Users Form</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item"><a href="user-list">Users</a></li>
              <li class="breadcrumb-item active">Blog Form</li>
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
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">User Form</h3>
              </div>
              <!-- /.card-header -->
              
              
              <!-- form start -->
              <form:form action="user-save" modelAttribute="user" role="form">
              
              <form:hidden path="password"/>
             
              <form:hidden path="username"/>
              
                <div class="card-body">
                  <div class="row">
                    <div class="col-md-6">
                    
	                      <div class="callout callout-success">
				                  <h5>Username</h5>
				                  <p>${user.username}</p>
	                	  </div>
                    
                    
	                      <div class="form-group">
	                        <label>Name</label>
	                        <form:input type="text" class="form-control" placeholder="Enter name" path="name"/>
	                      </div>
	                      <div class="form-group">
	                        <label>Surname</label>
	                        <form:input type="text" class="form-control" placeholder="Enter surname" path="surname"/>
	                      </div>
	                      
	                      <c:choose>
	                      		<c:when test="${isAdmin}">
	                      		
	                      		<div class="form-group">
			                        <label>User Role</label>
			                        
			                        
			                        <form:select path="roles" itemLabel="title" itemValue="authority" items="${userRoles}" 
			                        type="text" class="form-control" multiple="false" />
			                        
			                        
			                      

                                </div>
	                      		
	                      		</c:when>
	                      		
	                      		<c:otherwise>
	                      		
	                      		<form:hidden path="roles"/>
	                      		
	                      		</c:otherwise>
	                      </c:choose>
	                      
	                      
	                      
                    </div>
                  </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Save</button>
                  <a href="user-list" class="btn btn-outline-secondary">Cancel</a>
                </div>
              </form:form>
              
              
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
