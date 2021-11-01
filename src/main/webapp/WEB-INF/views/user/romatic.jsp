<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html> 
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Anime</title>
    <meta content="" name="description">
    <meta content="" name="keywords">


   	<!-- font -->
   	<jsp:include page="/WEB-INF/views/user/layout/font.jsp"></jsp:include>
	<!-- Variable -->
	<jsp:include page="/WEB-INF/views/common/variable.jsp"></jsp:include>
    <!-- CSS -->
	<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>
	
	
 
</head>

<body>

	<!-- Search -->
	<jsp:include page="/WEB-INF/views/user/layout/search.jsp"></jsp:include>

	<!-- Nav -->
	<jsp:include page="/WEB-INF/views/user/layout/nav.jsp"></jsp:include>
	
	
	<main id="main">
		<div class="listfilm">
			<!-- ======= Intro Single ======= -->
			<section class="intro-single">
			    <div class="container">
				<div class="row">
				    <div class="col-md-12 col-lg-8" data-aos="zoom-out-right">
						<div class="title-single-box">
							<h1 class="title-single">${cat.name }</h1>
							<span class="color-text-a">Tổng hợp</span>
						</div>
				    </div>
				    <div class="col-md-12 col-lg-4" data-aos="zoom-out-left">
						<nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
							<ol class="breadcrumb">
							<li class="breadcrumb-item">
								<a href="${base }/index">Trang chủ</a>
							</li>
							<li class="breadcrumb-item active" aria-current="page">
								${cat.name }
							</li>
							</ol>
						</nav>
				    </div>
				</div>
			    </div>
			</section><!-- End Intro Single-->
			
			<!-- ======= Property Grid ======= -->
			<section class="property-grid grid">
			    <div class="container">
					<div class="row">
					    <div class="col-sm-12" data-aos="fade-up" data-aos-duration="3000">
							<div class="grid-option">
								Sắp xếp theo: 
									<p>
										<a class="border m-1" href="${base }/romatic/${cat.id }?act=0">A-Z</a>
										<a class="border m-1" href="${base }/romatic/${cat.id }?act=1">Z-A</a>
										<a class="border m-1" href="${base }/romatic/${cat.id }?act=2">Lượt xem</a>
										<a class="border m-1" href="${base }/romatic/${cat.id }?act=3">Bình luận</a>
										<a class="border" href="${base }/romatic/${cat.id }?act=4">Đánh giá sao</a>
									</p>
							</div>
					    </div>
					    <c:forEach var="proPopular" items="${proCates }">
							<div class="col-md-4 mt-3">
								<div class="card-box-b card-shadow news-box">
								    <div class="img-box-b">
										<img src="${base }/upload/${proPopular.avatar }"" alt="" class="img-b img-fluid">
								    </div>
								    <div class="card-overlay">
										<div class="card-header-b">
											<div class="card-category-b">
												<a href="${base }/anime-watching/${proPopular.seo }" class="category-b">Tập ${proPopular.ep }</a>
											</div>
											<div class="card-title-b">
												<h2 class="title-2">
													<a href="${base }/anime-watching/${proPopular.seo }">${proPopular.title }</a>
												</h2>
											</div>
											<div class="card-date">
												<span class="date-b">${proPopular.price }<i class="fas fa-star"></i></span>
											</div>
										</div>
								    </div>
								</div>
							</div>
						</c:forEach>
					    
					</div>
			    </div>
			</section><!-- End Property Grid Single-->
		
		</div><!----End List film----->
	
	</main>
	
	<!-- Footer -->
    <jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>

    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
    <div id="preloader"></div>

    <!-- Javascript -->
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
	<script type="text/javascript">
		
	</script>
</body>

</html>