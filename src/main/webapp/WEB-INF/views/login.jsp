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
	<link href="${base }/user/css/login.css" rel="stylesheet">
	
	
 
</head>

<body>

	<!-- Search -->
	<jsp:include page="/WEB-INF/views/user/layout/search.jsp"></jsp:include>

	<!-- Nav -->
	<jsp:include page="/WEB-INF/views/user/layout/nav.jsp"></jsp:include>
	
	
	<main id="main">
		<div class="row">
        <div class="col-sm-6 login-section-wrapper">
			<div class="login-wrapper my-auto">
				<h1 data-aos="fade-up" class="login-title mt-4">Đăng Nhập</h1>
				<form id="login" class="input-group" method="POST" action ="/perform_login">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
					<c:choose>
					<c:when test="${not empty param.login_error }">
						<div class="alert alert-danger" role="alert">Tên tài khoản hoặc mật khẩu không chính xác, hãy thử lại</div>
					</c:when>
					<c:otherwise>
						<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-lg">
					    <div class="modal-content">
					      <h3 class="border-bottom text-success">Đăng nhập thành công!</h3>
					      <p>Cảm ơn bạn đã sử dụng dich vụ của chúng tôi.</p>
					    </div>
					  </div>
					</div>
					</c:otherwise>
					
					</c:choose>
	         		
				  <div class="form-group">
					<label for="username">Tài khoản</label>
					<input type="text" name="username" id="username" class="form-control" placeholder="account@example.com">
				  </div>
				  <div class="form-group mb-4">
					<label for="password">Mật khẩu</label>
					<input type="password" name="password" id="password" class="form-control" placeholder="Nhập mật khẩu">
				  </div>
				  <input name="login" id="login" class="btn btn-block login-btn" data-toggle="modal" data-target=".bd-example-modal-lg" type="submit" value="Đăng nhập">
				 
				</form>
				<a data-aos="zoom-out" class="btn btn-primary" data-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">Quên mật khẩu?</a>
				<div class="col mt-3 mb-3" data-aos="fade-in">
					<div class="collapse multi-collapse" id="multiCollapseExample1">
					 <div class="card card-body">
						<div class="row">
							<div class="col-md-12">
								<div class="panel panel-default">
								 <div class="panel-body">
									<div class="text-center">
									 <h3><i class="fa fa-lock fa-2x"></i></h3>
									 <p>Bạn có thể nhận lại mật khẩu bằng Email</p>
									 <div class="panel-body">
						
										<form id="register-form" role="form" autocomplete="off" class="form" method="post">
											 <div class="form-group">
												<div class="input-group">
												 <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
												 <input id="email" name="email" placeholder="Địa chỉ Email của bạn" class="form-control" type="email">
												</div>
											 </div>
											 <div class="form-group">
												<input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Gửi Mật Khẩu" type="submit">
											 </div> 
											 <input type="hidden" class="hide" name="token" id="token" value=""> 
										</form>
									 </div>
									</div>
								 </div>
								</div>
							</div>
						</div>
					 </div>
					</div>
				</div>
				<p class="login-wrapper-footer-text">Bạn chưa có tài khoản: <a href="${base }/signup" class="text-reset">Đăng ký</a></p>
					<p class="login-wrapper-footer-text">
						Đăng nhập với:
						<h1 class="col-md-12">
							<a href="#">
								<i class="fab fa-facebook-f"></i>	
							</a>
							<a href="#">
								<i class="fab fa-google-plus-g"></i>	
							</a>
							<a href="#">
								<i class="fab fa-twitter"></i>	
							</a>
						</h1>
						
					</p>
			</div>
        </div>
        <div class="col-sm-6 px-0 d-none d-sm-block" data-aos="zoom-in">
          <img src="${base }/user/img/tensei-shitara-slime-datta-ken-2nd-season-thumbnail.jpg" alt="login image" class="login-img">
        </div>
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