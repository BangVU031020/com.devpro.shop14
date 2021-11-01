<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
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
<link href="${base }/user/css/blog.css" rel="stylesheet">



</head>

<body>

	<!-- Search -->
	<jsp:include page="/WEB-INF/views/user/layout/search.jsp"></jsp:include>

	<!-- Nav -->
	<jsp:include page="/WEB-INF/views/user/layout/nav.jsp"></jsp:include>


	<main id="main">
		<div class="container">

			<div class="row">
				<div class="card" style="width: 100%">
					<img data-aos="fade-up" class="card-img-top"
						src="${base }/user/img/sword-art-online-alicization-war-of-underworld-cover.jpg"
						alt="Card image">
					<div data-aos="fade-down" class="card-body text-center">
						<h4>Chào mừng đến với Blog của chúng tôi</h4>
						<p>Blog Anime chính thức.</p>

					</div>
				</div>

			</div>
			<div class="row m-3">
				<div class="col-md-12">
					<div class="title-wrap d-flex justify-content-between"
						data-aos="zoom-in">
						<div class="title-box mt-3">
							<h2 class="title-a">
								<i class="far fa-address-card"></i> TỔNG HỢP BÀI VIẾT
							</h2>
						</div>
					</div>
				</div>
				<div class="card-deck ">
					<c:forEach var="p" items="${post }">
						<div class="card" data-aos="zoom-out">
							<img class="card-img-top" src="${base }/upload/${p.img }"
								alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">
									<a href="">${p.title }</a>
								</h5>
							</div>
							<div class="card-footer">
								<small class="text-muted">${p.createDate }</small>
							</div>
						</div>

					</c:forEach>

				</div>
			</div>


			<div class="row">
				<div class="col-md-12">
					<div class="title-wrap d-flex justify-content-between"
						data-aos="zoom-in">
						<div class="title-box mt-3">
							<h2 class="title-a">
								<i class="fas fa-video"></i> CHƯƠNG TRÌNH SẮP RA MẮT
							</h2>
						</div>
					</div>
				</div>

				<c:forEach var="product" items="${products }">
					<div class="col-sm-6" data-aos="zoom-in-right">
						<div class="card-box-b card-shadow news-box mt-3 ">
							<div class="img-box-b">
								<c:forEach var="proImg" items="${product.productsImages }">
									<img src="${base }/upload/${proImg.path }" alt=""
										class="img-b img-fluid">
								</c:forEach>
							</div>
							<div class="card-overlay ">
								<div class="card-header-b">
									<div class="card-category-b">
										<a href="" class="category-b"><i
											class="fas fa-bullhorn"></i> ${product.releaseDate }</a>
									</div>
									<div class="card-title-b">
										<h2 class="title-2">
											<a href="${base }/anime-watching">${product.title }</a>
										</h2>
									</div>
								</div>
							</div>
						</div>
					</div>

				</c:forEach>


			</div>


		</div>
	</main>

	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>

	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<div id="preloader"></div>

	<!-- Javascript -->
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
</body>

</html>