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
            <h1>Slider Form</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item"><a href="slider-list">Sliders</a></li>
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
                <h3 class="card-title">Slider Form</h3>
              </div>
              <!-- /.card-header -->
              
              
              <!-- form start -->
              <form:form action="slider-save" modelAttribute="slider" role="form">
              
              <form:hidden path="id"/>
              <form:hidden path="enabled"/>
              
                <div class="card-body">
                  <div class="row">
                    <div class="col-md-6">
                    
                      <div class="form-group">
                        <label>Title</label>
                        <form:input type="text" class="form-control" placeholder="Enter title" path="title"/>
                      </div>
                      <div class="form-group">
                        <label>Description</label>
                        <form:textarea class="form-control" placeholder="Enter description" path="description"/>
                      </div>
                      <div class="form-group">
                        <label>Image</label>
                        <form:input type="text" class="form-control" placeholder="Enter image URL" path="image"/>
                      </div>
                      <div class="form-group">
                        <label>URL</label>
                        <form:input type="text" class="form-control" placeholder="Enter link URL" path="url"/>
                      </div>
                      <div class="form-group">
                        <label>Button Title</label>
                        <form:input type="text" class="form-control" placeholder="Enter button title" path="buttonTitle"/>
                      </div>
                      <div class="form-group">
                        <label>Order number</label>
                        <form:select type="text" class="form-control" placeholder="Enter button title" path="orderNum">
                             <form:option value="0">---</form:option>
                             <form:option value="1">1</form:option>
                             <form:option value="2">2</form:option>
                             <form:option value="3">3</form:option>
                             <form:option value="4">4</form:option>
                             <form:option value="5">5</form:option>
                        </form:select>
                      </div>
                      
                      
                     
	                       
                     
               
                      
                       
                     
                    </div>
                    
                  </div>
                  
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Save</button>
                  <a href="slider-list" class="btn btn-outline-secondary">Cancel</a>
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
