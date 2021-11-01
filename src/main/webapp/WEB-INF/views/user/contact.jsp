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
	<link href="${base }/user/css/contact.css" rel="stylesheet">
	
	
 
</head>

<body>

	<!-- Search -->
	<jsp:include page="/WEB-INF/views/user/layout/search.jsp"></jsp:include>

	<!-- Nav -->
	<jsp:include page="/WEB-INF/views/user/layout/nav.jsp"></jsp:include>
	
	
	<main id="main">

        <!-- ======= Intro Single ======= -->
        <section class="intro-single">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-lg-8" data-aos="zoom-out-right">
                        <div class="title-single-box">
                            <h1 class="title-single">Về chúng tôi</h1>
                            <span class="color-text-a">Bắt đầu từ một nhóm fansub nhỏ hoạt động trên các diễn đàn nhằm mang tới cho cộng đồng những tác phẩm mà nhóm hoàn thành. Với mục đích tạo nơi giao lưu gặp gỡ, bàn luận và đánh giá về những    bộ anime hấp dẫn.</span>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-4" data-aos="zoom-out-down">
                        <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="${base }/index">Trang chủ</a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Liên hệ
                                </li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </section><!-- End Intro Single-->

        <!-- ======= Contact Single ======= -->
        <section class="contact">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12" data-aos="zoom-out-up">
                        <div class="contact-map box">
                            <div id="map" class="contact-map">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d953718.7081295741!2d105.09215784260898!3d20.974041527113535!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135008e13800a29%3A0x2987e416210b90d!2zSMOgIE7hu5lpLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1617267302759!5m2!1svi!2s" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 section-t8">
                        <div class="row">
                            <div class="col-md-7" data-aos="zoom-out">
                                <form action="forms/contact.php" method="post" role="form" class="php-email-form">
									<div class="row">
									<div class="col-md-6 mb-3">
										<div class="form-group">
											<input type="text" name="name" class="form-control form-control-lg form-control-a" placeholder="Tên hiển thị" data-rule="minlen:4" data-msg="Hãy nhập tối thiểu 4 ký tự">
											<div class="validate"></div>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<textarea name="message" class="form-control" name="Bình luận" cols="45" rows="8" data-rule="required" data-msg="Hãy viết gì đó?" placeholder="Message"></textarea>
											<div class="validate"></div>
										</div>
									</div>

									<div class="col-md-12 text-center">
										<button type="submit" class="btn btn-a">Gửi bình luận</button>
									</div>
									</div>
								</form>
                            </div>
                            <div class="col-md-5 section-md-t3">
                                <div class="icon-box section-b2" data-aos="zoom-in-right">
                                    <div class="icon-box-icon">
                                        <span class="ion-ios-paper-plane"></span>
                                    </div>
                                    <div class="icon-box-content table-cell">
                                        <div class="icon-box-title">
                                            <h4 class="icon-title">Xin chào</h4>
                                        </div>
                                        <div class="icon-box-content">
                                            <p class="mb-1">Email.
                                                <span class="color-a">bangvu667@example.com</span>
                                            </p>
                                            <p class="mb-1">Điện thoại.
                                                <span class="color-a">+84325 679 569</span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="icon-box section-b2" data-aos="zoom-out-down">
                                    <div class="icon-box-icon">
                                        <span class="ion-ios-pin"></span>
                                    </div>
                                    <div class="icon-box-content table-cell">
                                        <div class="icon-box-title">
                                            <h4 class="icon-title">Tìm chúng tôi tại</h4>
                                        </div>
                                        <div class="icon-box-content">
                                            <p class="mb-1">
                                                Hà Nội, Việt Nam
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="icon-box" data-aos="fade-up" data-aos-duration="3000">
                                    <div class="icon-box-icon">
                                        <span class="ion-ios-redo"></span>
                                    </div>
                                    <div class="icon-box-content table-cell">
                                        <div class="icon-box-title">
                                            <h4 class="icon-title">Mạng xã hội</h4>
                                        </div>
                                        <div class="icon-box-content">
                                            <div class="socials-footer">
                                                <ul class="list-inline">
                                                    <li class="list-inline-item">
                                                        <a href="https://www.facebook.com/vu.bang.5283/" class="link-one">
                                                            <i class="fab fa-facebook" aria-hidden="true"></i>
                                                        </a>
                                                    </li>
                                                    <li class="list-inline-item">
                                                        <a href="#" class="link-one">
                                                            <i class="fab fa-twitter" aria-hidden="true"></i>
                                                        </a>
                                                    </li>
                                                    <li class="list-inline-item">
                                                        <a href="#" class="link-one">
                                                            <i class="fab fa-instagram" aria-hidden="true"></i>
                                                        </a>
                                                    </li>
                                                    <li class="list-inline-item">
                                                        <a href="#" class="link-one">
                                                            <i class="fab fa-pinterest-p" aria-hidden="true"></i>
                                                        </a>
                                                    </li>
                                                    <li class="list-inline-item">
                                                        <a href="#" class="link-one">
                                                            <i class="fab fa-dribbble" aria-hidden="true"></i>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section><!-- End Contact Single-->

    </main><!-- End #main -->
	<!-- Footer -->
    <jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>

    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
    <div id="preloader"></div>

    <!-- Javascript -->
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
</body>

</html>