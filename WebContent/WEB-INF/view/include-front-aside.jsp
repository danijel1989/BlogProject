      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
 
 
 <aside class="col-lg-4">
          <!-- Widget [Search Bar Widget]-->
          <div class="widget search">
            <header>
              <h3 class="h6">Search the blog</h3>
            </header>
            <form action="/BlogProject/front-search" class="search-form">
              <div class="form-group">
                <input name="text" type="search" placeholder="What are you looking for?">
                <button type="submit" class="submit"><i class="icon-search"></i></button>
              </div>
            </form>
          </div>
          <!-- Widget [Latest Posts Widget]        -->
          <div class="widget latest-posts">
            <header>
              <h3 class="h6">Latest Posts</h3>
            </header>
            
           <c:forEach var="blog" items="${blogsAside}">
	            <div class="blog-posts">
		            <a href="/BlogProject/front-blog-details/${blog.seoName}/${blog.id}">
		                <div class="item d-flex align-items-center">
		                  <div class="image"><img src="${blog.image}" alt="..." class="img-fluid"></div>
		                  <div class="title"><strong>${blog.name}</strong>
		                    <div class="d-flex align-items-center">
		                      <div class="views"><i class="icon-eye"></i> ${blog.seenCount}</div>
		                      <div class="comments"><i class="icon-comment"></i>${blog.commentsNum}</div>
		                    </div>
		                  </div>
		                </div>
		             </a>
	            </div>
	           
            </c:forEach> 
            
          </div>
          
          
          <!-- Widget [Categories Widget]-->
          <div class="widget categories">
            <header>
              <h3 class="h6">Categories</h3>
            </header>
            
              <c:forEach var="category" items="${categoriesAside}">
            	<div class="item d-flex justify-content-between"><a href="/BlogProject/front-blog-category/${category.seoName}/${category.id}">${category.name}</a><span>${category.numBlogs}</span></div>
            </c:forEach>
          </div>
          
          
          <!-- Widget [Tags Cloud Widget]-->
          <div class="widget tags">       
            <header>
              <h3 class="h6">Tags</h3>
            </header>
            <ul class="list-inline">
            
            <c:forEach var="tag" items="${tagsAside}">
              <li class="list-inline-item"><a href="/BlogProject/front-blog-tag/${tag.seoTitle}/${tag.id}" class="tag">#${tag.title}</a></li>
            </c:forEach>  
            </ul>
          </div>
          
        </aside>