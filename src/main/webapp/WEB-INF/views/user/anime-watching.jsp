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
	<link href="${base }/user/css/anime-watching.css" rel="stylesheet">
	
	
 
</head>

<body>

	<!-- Search -->
	<jsp:include page="/WEB-INF/views/user/layout/search.jsp"></jsp:include>

	<!-- Nav -->
	<jsp:include page="/WEB-INF/views/user/layout/nav.jsp"></jsp:include>
	
	
	<main id="main" class="container">
		<div class="container-md" data-aos="flip-left">
			<div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<c:forEach var="pro" items="${products.productsImages }">
							<img src="${base }/upload/${pro.path }" class="d-block w-100" alt="...">
						</c:forEach>
					</div>
			    </div>
			</div>
		</div>
		
		<div class="film">
			<!-- ======= Intro Single ======= -->
			<section class="intro-single">
				<div class="container">
					<div class="row">
							<div class="col-md-12 col-lg-8">
						<div class="title-single-box" data-aos="flip-right">
								<h1 class="title-single">${products.title }</h1>
								<span class="color-text-a numep">Tâp 1</span>
						</div>
							</div>
							<div class="col-md-12 col-lg-4">
								<nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
									<ol class="breadcrumb">
										<li class="breadcrumb-item" data-aos="flip-down">
												<a href="${base }/index">Trang chủ</a>
										</li>
										<li class="breadcrumb-item" data-aos="zoom-in">
												<a href="${base }/romatic">${products.categories.name }</a>
										</li>
										<li class="breadcrumb-item active" aria-current="page" data-aos="zoom-in-up">
												${products.title }
										</li>
									</ol>
								</nav>
							</div>
							
					</div>
					<div class="row video">
						<div class="col-md-12">
							<div class="embed-responsive embed-responsive-16by9 mb-5" data-aos="flip-up">			                
								<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/RzClCJFpSoM?modesbranding=1&autoplay=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12" data-aos="flip-down">
							<div class="title-single-box">
								<h1 class="title-single">Tổng Hợp	</h1>
								<span class="color-text-a">Tập Anime</span>
							</div>
						</div>
						<div class="col-md-12 mt-3" data-aos="zoom-in-up">
							<c:forEach var = "i" begin = "1" end = "${products.ep }">
					         	<a class="col-md-3 m-3 border border-success ep${i }" href="#" onclick="getEP(${i })">${i }</a>
					      	</c:forEach>
						</div>
						
					</div>
					
					<div class="row mt-5">
						<div class="col-md-4 mb-2">
							<div class="title-single-box" data-aos="zoom-in-up">
								<h1 class="title-single">Nội dung</h1>
								<span class="color-text-a">${products.shortDescription }</span>
							</div>
							<div class="title-single-box mt-3" data-aos="zoom-ôut-up">
								<h1 class="title-single">Thể loại</h1>
								<span class="color-text-a">${products.categories.name }</span>
							</div>
						</div>
						<div class="col-md-8">
							<div class="title-single-box" data-aos="zoom-in-down">
									<h1 class="title-single">Thảo luận </h1>
									<span class="color-text-a">${products.comment } bình luận</span>
							</div>
							
							<c:forEach var="comment" items="${products.comments }">
								<div class="col-md-12 mt-5 title-single-box" data-aos="zoom-in-left">
									<div class="media">
										<c:choose>
											<c:when test="${comment.user.avatar != null }">
												<img src="${base }/upload/${comment.user.avatar }" class="rounded-circle card-img" alt="Cinque Terre">
											</c:when>
											<c:otherwise>
												<img src="${base }/user/img/dau-pha-thuong-khung-phan-4-thumbnail-1616904419.jpg" class="rounded-circle card-img" alt="Cinque Terre">
											</c:otherwise>
										</c:choose>
										
										<div class="media-body ml-3">
											<h5 class="body-head">${comment.name }</h5>
												${comment.message }
											<h5 class="body-head mt-2">
												<a class="fas fa-thumbs-up" href="${base }/like/${comment.id }?seo=${products.seo }"> ${comment.numberLike } Thích |</a>
												<a class="fas fa-thumbs-down" href="${base }/dislike/${comment.id }?seo=${products.seo }"> ${comment.numberDislike } Không Thích </a>
												<c:if test="${isLogined }">
													<c:if test="${comment.user.id == getUserLogined.id}">
														<a class="fas fa-trash" href="javascript:confirmDel('${base }/del/${comment.id }?seo=${products.seo }'); void(0);"> Xóa</a>
													</c:if>
												</c:if> 
												</h5>
										</div>
										
									</div>
								</div>
							</c:forEach>
						</div>
						
						
						
						
						<div class="offset-md-4 col-md-8" data-aos="zoom-in-right">
							<sf:form>
									<div class="row">
										<div class="title-single-box">
											<h1 class="title-single">	Thảo luận của bạn:	</h1>
										</div>
									</div>
									<div class="row">
									<div class="col-md-6 mb-3">
										<div class="form-group">
											<c:choose>
												<c:when test="${isLogined }">
													<input required="required" type="text" id="name" name="name" class="form-control form-control-lg form-control-a" value="${userLogined.username }" />
												</c:when>
												<c:otherwise>
													<input placeholder="Tên hiển thị" required="required" type="text" id="name" name="name" class="form-control form-control-lg form-control-a" ></input>
												</c:otherwise>
											</c:choose>
											<div class="validate"></div>
										</div>
									</div>
									
									<div class="col-md-12">
										<div class="form-group">
											<textarea required="required" id="message" name="message" class="form-control" placeholder="Bình luận" cols="45" rows="8" data-rule="required" data-msg="Hãy viết gì đó?"></textarea>
											<div class="validate"></div>
										</div>
									</div>
									<script language="javascript">
										var editor = CKEDITOR.replace('message');
									</script>
									<div class="col-md-12 ">
										<div class="row">
											<div class="title-single-box">
												<h1 class="title-single">	Đánh giá sao:	</h1>
											</div>
										</div>
										<ul class="ratings" name="ratings">
										
										  <li value="10" class="star"></li>
										  <li value="9" class="star"></li>
										  <li value="8" class="star"></li>
										  <li value="7" class="star" ></li>
										  <li value="6" class="star"></li>
										  <li value="4" class="star"></li>
										  <li value="3" class="star"></li>
										  <li value="2" class="star"></li>
										  <li value="1" class="star"></li>
										</ul>
									</div>
									<div class="col-md-12 text-center btn">
										<button type="button" onclick="saveComment()" class="btn btn-a" >Gửi bình luận</button>
									</div>
									</div>
							</sf:form>
						</div>
					</div>
					
				
				</div>
			</section><!-- End Intro Single-->
		</div>
	</main>
	
	<!-- Footer -->
    <jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>

    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
    <div id="preloader"></div>

    <!-- Javascript -->
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
	<!-- custom javascipt -->
        <script type="text/javascript">
        	$(function(){
        		$(".star").click(function(){
        			$("li").removeClass("select");
        			$(this).addClass("select");
        		});
        	});
        	
        	
        	function getEP(numep) {
        		$(".numep").html("Tập " + numep);
        		$(".ep" + numep).addClass("bg-light");
        	}
        	
        	function saveComment() {
        		// javascript object.
        		// data la du lieu ma day len action cua controller
        		
				let comment = {
					name: $("#name").val(), // lay theo id
					message: CKEDITOR.instances['message'].getData(), // lay theo id
					star: $(".select").val(),
					pId: ${products.id },
        		};
				// $ === jQuery
				// json == javascript object
				$.ajax({
					url : "/comment-ajax",
					type : "post",
					contentType : "application/json",
					data : JSON.stringify(comment),
		
					dataType : "json", // kieu du lieu tra ve tu controller la json
					success : function(jsonResult) {
						alert(jsonResult.message);
					},
					error : function(jqXhr, textStatus, errorMessage) { // error callback 
						
					}
				});
        	}
    		function confirmDel(url) {
    			var message = "Bạn có thực sự muốn xóa Sản phẩm này?";
    			if (window.confirm(message)) {
    				window.location.href = url;
    			} else {
    				return false;
    			}
    		}
        </script>
</body>

</html>