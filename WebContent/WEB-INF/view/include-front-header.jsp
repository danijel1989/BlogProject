<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<header class="header">
      <!-- Main Navbar-->
      <nav class="navbar navbar-expand-lg">
        <div class="search-area">
          <div class="search-area-inner d-flex align-items-center justify-content-center">
            <div class="close-btn"><i class="icon-close"></i></div>
            <div class="row d-flex justify-content-center">
              <div class="col-md-8">
              
              
                <form action="front-search">
                  <div class="form-group">
                    <input type="search" name="text" id="search" placeholder="What are you looking for?">
                    <button type="submit" class="submit"><i class="icon-search-1"></i></button>
                  </div>
                </form>
                
              </div>
            </div>
          </div>
        </div>
        <div class="container">
          <!-- Navbar Brand -->
          <div class="navbar-header d-flex align-items-center justify-content-between">
            <!-- Navbar Brand --><a href="http://localhost:8080/BlogProject/homepage" class="navbar-brand">Blog Project</a>
            <!-- Toggle Button-->
            <button type="button" data-toggle="collapse" data-target="#navbarcollapse" aria-controls="navbarcollapse" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler"><span></span><span></span><span></span></button>
          </div>
          <!-- Navbar Menu -->
          <div id="navbarcollapse" class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
            
            
            
              <li class="nav-item"><a href="http://localhost:8080/BlogProject/homepage" class="nav-link active">Home</a>
              </li>
              <li class="nav-item"><a href="http://localhost:8080/BlogProject/front-blog-list" class="nav-link">Blog</a>
              </li>
              <li class="nav-item"><a href="http://localhost:8080/BlogProject/contact-form" class="nav-link">Contact</a>
              </li>
             
              <sec:authorize access="!hasAnyRole('admin','blogger')">
               <li class="nav-item"><a href="http://localhost:8080/BlogProject/login-page" class="nav-link">Log in</a>
              </li>
              </sec:authorize>
              
              <sec:authorize access="hasAnyRole('admin','blogger')">
              
              <li class="nav-item"><a href="http://localhost:8080/BlogProject/admin/dashboard" class="nav-link">Dashboard</a>
              </li>
              
              <form:form action="${pageContext.request.contextPath}/logout" method="post" hidden="true" name="LogoutForm">
         		<input type="submit" value="Log Out"/>
         	  </form:form>
         	  <li class="nav-item"><a href="javascript:document.LogoutForm.submit()" class="nav-link">Logout</a>
              </li>
         	  
         	  
              </sec:authorize>
              
              
            </ul>
            <div class="navbar-text"><a href="front-search" class="search-btn"><i class="icon-search-1"></i></a></div>
          </div>
        </div>
      </nav>
    </header>
