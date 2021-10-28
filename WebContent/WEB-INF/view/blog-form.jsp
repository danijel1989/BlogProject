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
            <h1>Blog Form</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item"><a href="blog-list">Blogs</a></li>
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
                <h3 class="card-title">Blog Form</h3>
              </div>
              <!-- /.card-header -->
              
              
              <!-- form start -->
              <form:form action="blog-save" modelAttribute="blog" role="form">
              
              <form:hidden path="id"/>
              <form:hidden path="dateCreated"/>
              <form:hidden path="isImportant"/>
              <form:hidden path="user.username"/>
              <form:hidden path="enabled"/>
             
              
                <div class="card-body">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label>Name</label>
                        <form:input type="text" class="form-control" placeholder="Enter name" path="name"/>
                      </div>
                      <div class="form-group">
                        <label>Description</label>
                        <form:textarea class="form-control" placeholder="Enter description" path="description"/>
                      </div>
                       <div class="form-group">
                        <label>Blog category</label>
                        <form:select path="category.id" itemLabel="name" itemValue="id" items="${categories}" type="text" class="form-control" placeholder="Choose category"/>
                        
                      </div>
                      <div class="form-group">
                        <label>Blog tags</label>
                        <form:select path="tags" itemLabel="title" itemValue="id" items="${tags}" type="text" class="form-control" placeholder="Choose tags"/>
                      </div>
                      <div class="form-group">
                        <label>Image</label>
                        <form:input type="text" class="form-control" placeholder="Enter image URL" path="image"/>
                      </div>
                      
                      <div class="form-group">
                        <label>Choose New Photo 1</label>
                        <input type="file" class="form-control">
                      </div>
                      <div class="form-group">
                        <label>Choose New Photo 2</label>
                        <input type="file" class="form-control">
                      </div>
                    </div>
                    <div class="offset-md-1 col-md-5">
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group">
                            <label>Photo 1</label>

                            <div class="text-right">
                              <button type="button" class="btn btn-sm btn-outline-danger">
                                <i class="fas fa-remove"></i>
                                Delete Photo
                              </button>
                            </div>
                            <div class="text-center">
                              <img src="https://via.placeholder.com/400x600" alt="" class="img-fluid">
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group">
                            <label>Photo 2</label>

                            <div class="text-right">
                              <button type="button" class="btn btn-sm btn-outline-danger">
                                <i class="fas fa-remove"></i>
                                Delete Photo
                              </button>
                            </div>
                            <div class="text-center">
                              <img src="https://via.placeholder.com/400x600" alt="" class="img-fluid">
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Save</button>
                  <a href="blog-list" class="btn btn-outline-secondary">Cancel</a>
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
