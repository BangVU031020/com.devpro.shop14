<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
 
</head>

<body>

	<!-- Search -->
	<jsp:include page="/WEB-INF/views/user/layout/search.jsp"></jsp:include>

	<!-- Nav -->
	<jsp:include page="/WEB-INF/views/user/layout/nav.jsp"></jsp:include>
	
	<!-- ======= Intro Section ======= -->
	<div class="intro intro-carousel" data-aos="fade-up">
		<div id="carousel" class="owl-carousel owl-theme">
			<c:forEach var="proHot" items="${productHot }">
				<c:forEach var="proImg" items="${proHot.productsImages }">
				<div class="carousel-item-a intro-item bg-image" style="background-image: url(${base }/upload/${proImg.path })">
					<div class="overlay overlay-a"></div>
					<div class="intro-content display-table">
						<div class="table-cell">
						<div class="container">
						    <div class="row">
							<div class="col-lg-8">
							    <div class="intro-body">
								<p class="intro-title-top">Mới <br/> Tập ${proHot.ep }
								</p>
								<h1 class="intro-title mb-4">
								    <span class="color-b">${proHot.price }<i class="far fa-star"></i> </span><br/>	 ${proHot.title }
								</h1>
								<p class="intro-subtitle intro-price">
								    <span class="price-a"><a href="${base }/anime-watching/${proHot.seo }">Xem Ngay</a></span>
								</p>
							    </div>
							</div>
						    </div>
						</div>
					    </div>
					</div>
				</div>
				</c:forEach>
			</c:forEach>
		</div>
	</div><!-- End Intro Section -->

	<main id="main">

		<!-- =======Section ======= -->
		<section class="section-news section-t8">
			<div class="container">
				<!---Trending--->
				<div class="trending" data-aos="fade-up">
					<div class="row">
					    <div class="col-md-12">
						<div class="title-wrap d-flex justify-content-between">
						    <div class="title-box mt-3">
							<h2 class="title-a"><i class="fab fa-hotjar"></i> PHIM NỔI BẬT</h2>
						    </div>
						    <div class="title-link">
							<a href="${base }/romatic">Xem tất cả
							    <span class="ion-ios-arrow-forward"></span>
							</a>
						    </div>
						</div>
					    </div>
					</div>
					<div id="new-carousel" class="owl-carousel owl-theme">
					    <c:forEach var="proHight" items="${productHight }">
					    	
					    	<div class="carousel-item-c">
								<div class="card-box-b card-shadow news-box">
									<div class="img-box-b">
										<img src="${base }/upload/${proHight.avatar }" alt="" class="img-b img-fluid">
									</div>
									<div class="card-overlay">
										<div class="card-header-b">
											<div class="card-category-b">
												<a href="${base }/anime-watching/${proHight.seo }" class="category-b">${proHight.ep }/??</a>
											</div>
											<div class="card-title-b">
												<h2 class="title-2">
													<a href="${base }/anime-watching/${proHight.seo }">${proHight.title }</a>
												</h2>
											</div>
											<div class="card-date">
												<span class="date-b">${proHight.price }<i class="far fa-star"></i></span>
											</div>
										</div>
									</div>
								</div>
						    </div>
					    	
					    </c:forEach>
					</div>
			    
				</div><!--ended Trend---->
				<!---popular show----->
				<div class="popular">
					<div class="row">
						<div class="col-md-8">
							<div class="row" data-aos="fade-up-right">
								<div class="col-md-12">
									<div class="title-wrap d-flex justify-content-between">
									    <div class="title-box mt-3">
											<h2 class="title-a"><i class="fas fa-desktop"></i> ANIME PHỔ BIẾN</h2>
									    </div>
									    <div class="title-link">
											<a href="${base }/romatic">Xem tất cả
												<span class="ion-ios-arrow-forward"></span>
											</a>
									    </div>
									</div>
								</div>
								<c:forEach var="proPopular" items="${productPopular }">
									<div class="col-md-6 mt-3">
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
							<!-----Recently add------>
							<div class="recently-add mt-5" data-aos="fade-down-right">
								<div class="row">
									<div class="col-md-12">
										<div class="title-wrap d-flex justify-content-between">
										    <div class="title-box mt-3">
												<h2 class="title-a"><i class="fas fa-signal"></i> ANIME MỚI</h2>
										    </div>
										    <div class="title-link">
											<a href="${base }/romatic">Xem tất cả
											    <span class="ion-ios-arrow-forward"></span>
											</a>
										    </div>
										</div>
									</div>
									<c:forEach var="proPopular" items="${productNew }">
									<div class="col-md-6 mt-3">
										<div class="card-box-b card-shadow news-box">
										    <div class="img-box-b">
												<img src="${base }/upload/${proPopular.avatar }" alt="" class="img-b img-fluid">
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
														<span class="date-b">8.3<i class="fas fa-star"></i></span>
													</div>
												</div>
										    </div>
										</div>
									</div>
								</c:forEach>
								</div>
							</div>
							<!-------Ended recently-add------>
							<!-----live-show------>
							<div class="live-show mt-5" data-aos="flip-left">
								<div class="row">
									<div class="col-md-12">
										<div class="title-wrap d-flex justify-content-between">
										    <div class="title-box mt-3">
											<h2 class="title-a"><i class="fas fa-video"></i> ANIME HAY NHẤT</h2>
										    </div>
										    <div class="title-link">
											<a href="${base }/romatic">Xem tất cả
											    <span class="ion-ios-arrow-forward"></span>
											</a>
										    </div>
										</div>
									</div>
									<c:forEach var="proPopular" items="${productBest }">
									<div class="col-md-6 mt-3">
										<div class="card-box-b card-shadow news-box">
										    <div class="img-box-b">
												<img src="${base }/upload/${proPopular.avatar }"" alt="" class="img-b img-fluid">
										    </div>
										    <div class="card-overlay">
												<div class="card-header-b">
													<div class="card-category-b">
														<a href="${base }/anime-watching/${proPopular.seo }" class="category-b">${proPopular.ep }/${proPopular.ep } </a>
													</div>
													<div class="card-title-b">
														<h2 class="title-2">
															<a href="${base }/anime-watching/${proPopular.seo }">${proPopular.title }</a>
														</h2>
													</div>
													<div class="card-date">
														<span class="date-b">8.3<i class="fas fa-star"></i></span>
													</div>
												</div>
										    </div>
										</div>
									</div>
								</c:forEach>
								</div>
							</div>
							<!-------Ended live-show------>
						</div>
						<div class="col-md-4">
							<!----top-view--------->
							<div class="top-view" data-aos="fade-up" data-aos-anchor-placement="top-center">
								<div class="row">
								    <div class="col-md-12 mt-3">
										<div class="title-wrap d-flex justify-content-between">
											<div class="title-box mt-2">
												<h2 class="title-a-2"><i class="fas fa-bullseye"></i> XEM NHIỀU NHẤT</h2>
											</div>
										</div>
								    </div>
								    <c:forEach var="proWatch" items="${productWatch }">
								    	<c:forEach var="proImg" items="${proWatch.productsImages }">
									    	<div class="card-box-b card-shadow news-box mt-2">
												<div class="img-box-b">
													<img src="${base }/upload/${proImg.path }" alt="" class="img-b img-fluid">
												</div>
												<div class="card-overlay">
													<div class="card-header-b">
														<div class="card-category-b">
															<a href="${base }/anime-watching/${proWatch.seo }" class="category-b">${proWatch.ep }/${proWatch.ep }</a>
														</div>
														<div class="card-title-b">
															<h2 class="title-2">
																<a href="${base }/anime-watching/${proWatch.seo }">${proWatch.title }</a>
															</h2>
														</div>
														<div class="card-date">
															<span class="date-b">${proWatch.watch }<i class="fas fa-eye"></i></span>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
								    </c:forEach>
								</div>
							</div>
							<!-----top comment---->
							<div class="top-comment mt-5" data-aos="flip-left" data-aos-easing="ease-out-cubic" data-aos-duration="2000">
								<div class="col-md-12">
									<div class="title-wrap d-flex justify-content-between">
									    <div class="title-box mt-3">
										<h2 class="title-a-2"><i class="fas fa-eye"></i> BÌNH LUẬN NHIỀU NHẤT</h2>
									    </div>
									</div>
								</div>
								<c:forEach var="proWatch" items="${productComment }">
							    	<div class="media mt-2">
									    <img src="${base }/upload/${proWatch.avatar }" class="align-self-start mr-3 size200 cop-img" alt="Flower">
									    <div class="media-body mt-3">
											Movie / Active
											<h5 class="title-2" class="body-head mt-4 mb-4"><a href="${base }/anime-watching/${proWatch.seo }">${proWatch.title }</a></h5>
											<i class="fas fa-comment-alt"></i>${proWatch.comment }
										</div>
									    
									</div>
							    </c:forEach>
							</div><!-----------end top comment----->
						</div>
						
					</div>
				</div>
			</div>
		</section><!-- Section -->

	</main><!-- End #main -->

    <!-- Footer -->
    <jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>

    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
    <div id="preloader"></div>

    <!-- Javascript -->
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
</body>

</html>