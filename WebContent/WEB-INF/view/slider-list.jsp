<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
     
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
            <h1>Sliders</h1>
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
                <h3 class="card-title">All Sliders</h3>
                <div class="card-tools">
                  <a href="slider-form" class="btn btn-success">
                    <i class="fas fa-plus-square"></i>
                    Add new Slider
                  </a>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table class="table table-bordered">
                  <thead>                  
                    <tr>
                      <th style="width: 5px">ID</th>
                     
                      <th style="width: 20%;">Image</th>
                      
                      <th style="width: 10%;">Title</th>
                      
                      <th style="width: 30%;">Description</th>
                     
                      <th class="text-center">URL</th>
                      
                      <th class="text-center">Button Title</th>
                      
                      <th style="width: 5%;">Order</th>
                      
                      <th class="text-center">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                  
                    <c:forEach var="slider" items="${sliders}">
                    
                        	<tr>
	                      <td>
	                        ${slider.id}.
	                      </td>
	                       <td class="text-center">
                       		 <img src="${slider.image}" style="max-width: 80px;">
                         </td>
	                      <td>
	                        ${slider.title}
	                      </td>
	                      <td>
	                        ${slider.description}
	                      </td>
	                      <td>
	                        <a href="${slider.url}">URL</a>
	                      </td>
	                       <td>
	                        ${slider.buttonTitle}
	                      </td>
	                      <c:choose>
	                      	<c:when test="${slider.orderNum != 0}">
	                      		<td>
			                        ${slider.orderNum}
			                      </td>
	                      	</c:when>
	                        <c:otherwise>
		                        <td>
			                        ---
			                      </td>
	                        </c:otherwise>
	                      </c:choose>
	                      
	                      <td class="text-center">
	                        <div class="btn-group">
	                        
	                        <c:choose>
	                          <c:when test="${slider.enabled}">
	                             <a href="slider-enabled?id=${slider.id}" class="btn btn-info">
		                            <i class="fas fa-toggle-on"></i>
		                          </a>
	                          </c:when>
	                          <c:otherwise>
	                              <a href="slider-enabled?id=${slider.id}" class="btn btn-danger">
		                            <i class="fas fa-toggle-on"></i>
		                          </a>
	                          </c:otherwise>
	                        </c:choose>
	                          <a href="slider-update?id=${slider.id}" class="btn btn-info">
	                            <i class="fas fa-edit"></i>
	                          </a>
	                          <button type="button" class="btn btn-info" data-toggle="modal" data-target="#delete-modal-${slider.id}">
	                            <i class="fas fa-trash"></i>
	                          </button>
	                        </div>
	                      </td>
	                    </tr>
	                     <div class="modal fade" id="delete-modal-${slider.id}">
						      <div class="modal-dialog">
						        <div class="modal-content">
						          <div class="modal-header">
						            <h4 class="modal-title">Delete Slider</h4>
						            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						              <span aria-hidden="true">&times;</span>
						            </button>
						          </div>
						          <div class="modal-body">
						            <p>Are you sure you want to delete slider ${slider.title}?</p>
						            <strong></strong>
						          </div>
						          <div class="modal-footer justify-content-between">
						            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						            <a href="slider-delete?id=${slider.id}">
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
