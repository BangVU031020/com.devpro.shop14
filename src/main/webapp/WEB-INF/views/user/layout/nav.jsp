<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!-- ======= Header/Navbar ======= -->
	<nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
		<div class="container">
			<button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarDefault" aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
				<span></span>
				<span></span>
				<span></span>
			</button>
			<a class="navbar-brand text-brand" href="${base }/index">Ani<span class="color-b">me</span></a>
			<div class="navbar-collapse collapse justify-content-center menu" id="navbarDefault">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link " href="${base }/index">Trang chủ</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle " href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Danh mục
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<c:forEach var="cate" items="${category }">
								<a class="dropdown-item " href="${base }/romatic/${cate.id }">${cate.name }</a>
							</c:forEach>
						</div>
					</li>
					<li class="nav-item">
						<a class="nav-link " href="${base }/blog">Blog</a>
					</li>
					        
					<li class="nav-item">
						<a class="nav-link" href="${base }/contact">Liên hệ</a>
					</li>
				</ul>
			</div>
			
			<c:if test="${isLogined }">
				<button type="button" class="btn btn-b-n d-md-block  mr-1" >
					<a href="${base }/logout"><i class="fas fa-sign-out-alt"></i></a>
				</button>
			</c:if>
			
				<button type="button" class="btn btn-b-n d-md-block  mr-1" >
				<c:choose>
				
					<c:when test="${isLogined }">
						<a href="${base }/user-detail">
							<b>${userLogined.username }
							<c:choose>
								<c:when test="${userLogined.avatar != null }">
									<img class="rounded-circle" style="width: 15px; height: 15xp;" alt="..." src="${base }/upload/${userLogined.avatar }">
								</c:when>
								<c:when test="${userLogined.avatar == null }">
									<i class="fas fa-user" ></i>
								</c:when>
							</c:choose>
							
						</a>
					</c:when>
					<c:otherwise>
						<a href="${base }/login">
							<i class="fas fa-user" ></i>
						</a>
					</c:otherwise>
				</c:choose>
				
				</button>
			<button type="button" class="btn btn-b-n navbar-toggle-box-collapse d-md-block" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-expanded="false">
				<span class="fa fa-search" aria-hidden="true"></span>
			</button>
		</div>
	</nav><!-- End Header/Navbar -->
