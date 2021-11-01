<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!-- directive cua JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<link href="${base }/user/css/signup.css" rel="stylesheet">
		
	
 
</head>

<body>

	<!-- Search -->
	<jsp:include page="/WEB-INF/views/user/layout/search.jsp"></jsp:include>

	<!-- Nav -->
	<jsp:include page="/WEB-INF/views/user/layout/nav.jsp"></jsp:include>
	
	
	<div class="container">
			<div class="mes" id="mes"></div>
			<div class="card bg-light" style="width: 100%">
				<img data-aos="fade-up" class="card-img-top" src="${base }/user/img/one-piece-cover.jpg" alt="Card image">
				<div class="card-body text-center"data-aos="zoom-out">
					<h4>TẠO TÀI KHOẢN</h4>
					<p>Bắt đầu với tài khoản miễn phí của bạn.</p>
					
				</div>
			</div>
			<div class="card bg-light">
				<article class="card-body mx-auto" style="max-width: 400px;">
					<p data-aos="zoom-in">
						<a href="" class="btn btn-block btn-twitter"> <i class="fab fa-twitter"></i>   Truy cập với Twiter</a>
						<a href="" class="btn btn-block btn-facebook"> <i class="fab fa-facebook-f"></i>   Truy cập với facebook</a>
					</p>
					<p class="divider-text">
						<span class="bg-light">Hoặc</span>
					</p>
					<sf:form method="POST" action="${base }/signup" modelAttribute="nUser" enctype="multipart/form-data" data-aos="zoom-out">
						<sf:hidden path="id"/>
						<div class="form-group input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i class="fa fa-user"></i> </span>
							 </div>
							<sf:input required="required" path="username" id="username" class="form-control" placeholder="Tên Đăng nhập" type="text" onkeyup="checkName()"></sf:input>
							
						</div> <!-- form-group// -->
						<p id="errName"></p>
						<div class="form-group input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
							 </div>
							<sf:input onkeyup="checkEmail()" required="required" path="email" id="email" name="email" class="form-control" placeholder="Địa chỉ Email" type="email"></sf:input>
						
						</div> <!-- form-group// -->
						<p id="errEmail"></p>
						<div class="form-group input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i class="fa fa-lock"></i> </span>
							</div>
							<sf:input required="required" path="password" id="password" name="password" class="form-control password" placeholder="Tạo Mật Khẩu" type="password" onkeyup="checkPass()"></sf:input>
							
						</div> <!-- form-group// -->
						<p id="errPass"></p>
						<div class="form-group input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i class="fa fa-lock"></i> </span>
							</div>
							<input class="form-control rePassword" id="rePassword" name="rePassword" placeholder="Nhập Lại Mật Khẩu" onkeyup="checkPass()" type="password">
							
						</div> <!-- form-group// -->    
						<p id="errPass2"></p>
						<div class="form-group">
							<div class="col-md-12">
								<img style="width: 100px; height: 100px;" id="output"/>
								<label for="avatarUpload"><a>Chọn avatar</a></label>
								<input style="display: none;" id="avatarUpload" class="form-control-file"
									type="file" name="avatarUpload" multiple="multiple" accept="image/*" onchange="loadFile(event)"  />
							</div> 
						</div>
						<script>
						  var loadFile = function(event) {
						    var reader = new FileReader();
						    reader.onload = function(){
						      var output = document.getElementById('output');
						      output.src = reader.result;
						    };
						    reader.readAsDataURL(event.target.files[0]);
						  };
						</script>
						                                  
						<div class="form-group">
							<button data-toggle="modal" data-target=".bd-example-modal-lg" type="submit" class="btn btn-primary btn-block sign" onclick="checkValidUser(${check })"> Tạo Tài Khoản  </button>
							
						</div> <!-- form-group// -->      
						<p class="text-center">Đã có Tài Khoản? <a href="${base }/login">Đăng nhập</a> </p>                                                                 
					</sf:form>
				</article>
			</div> <!-- card.// -->

		</div> <!--container end.//-->
	
	<!-- Footer -->
    <jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>

    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
    <div id="preloader"></div>

    <!-- Javascript -->
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
	<script type="text/javascript">
	//-----------------------------------------------------------------------------------------
	$(document).ready(function(){
	  
	});



	</script>
</body>

</html>