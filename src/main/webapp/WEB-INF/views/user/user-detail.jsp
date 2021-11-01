<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


	<div class="container">
		<div class="row">
			<div class="col-sm-5">
				<div style="height: 130px;"></div>
				<div class="row mt-1 title-box">
					<h3 class="title-a">
						<a data-aos="zoom-out" class="btn btn-primary update"
							data-toggle="collapse" href="#multiCollapseExample1"
							role="button" aria-expanded="false"
							aria-controls="multiCollapseExample1">CẬP NHẬT THÔNG TIN</a>
					</h3>
					<div class="col-md-12 mt-3 mb-3 d-flex justify-content-center "
						data-aos="fade-in">
						<div class="collapse multi-collapse" id="multiCollapseExample1">
							<div class="card card-body">
								<div class="row col-md-12">
									<sf:form method="POST" action="${base }/edit"
										modelAttribute="nUser" enctype="multipart/form-data"
										data-aos="zoom-out">
										<sf:hidden path="id" />
										<sf:hidden path="username"/>
										<sf:hidden path="email"/>
										<sf:hidden path="watched"/>
										<!-- form-group// -->
										<div class="form-group input-group">
											<div class="input-group-prepend">
												<span class="input-group-text"> <i class="fa fa-lock"></i>
												</span>
											</div>
											<sf:input required="required"  path="password" id="password"
												name="password" class="form-control password"
												placeholder="Tạo Mật Khẩu" type="password"
												onkeyup="checkPass()"></sf:input>

										</div>
										<!-- form-group// -->
										<p id="errPass"></p>
										<div class="form-group input-group">
											<div class="input-group-prepend">
												<span class="input-group-text"> <i class="fa fa-lock"></i>
												</span>
											</div>
											<input class="form-control rePassword" required="required" id="rePassword"
												name="rePassword" placeholder="Nhập Lại Mật Khẩu"
												onkeyup="checkPass()" type="password">

										</div>
										<!-- form-group// -->
										<p id="errPass2"></p>
										<div class="form-group">
											<div class="col-md-12">
												<img id="output" style="width: 475px;"
													src="${base }/upload/${nUser.avatar }" alt="login image"
													class="login-img"> <label for="avatarUpload"><a>Chọn
														avatar</a></label> <input style="display: none;" id="avatarUpload"
													class="form-control-file" type="file" name="avatarUpload"
													multiple="multiple" accept="image/*"
													onchange="loadFile(event)" />
											</div>
										</div>
										<script>
											var loadFile = function(event) {
												var reader = new FileReader();
												reader.onload = function() {
													var output = document
															.getElementById('output');
													output.src = reader.result;
												};
												reader
												.readAsDataURL(event.target.files[0]);
											};
										</script>

										<div class="form-group">
											<button data-toggle="modal"
												data-target=".bd-example-modal-lg" type="submit"
												class="btn btn-primary btn-block updateUser" onclick="checkPass()">Cập
												nhật</button>

										</div>
									</sf:form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="detail">
					<div class="row bg-light mt-1">
						<div class="col-md-4">User Name:</div>
						<div class="col-md-8 text-success">${nUser.username }</div>
					</div>
					<div class="row bg-light mt-1">
						<div class="col-md-4">User Email:</div>
						<div class="col-md-8 text-success">${nUser.email }</div>
					</div>
					<div class="row bg-light mt-1">
						<div class="col-md-4">User Avatar:</div>
					</div>
					<div class="row col-sm-12 px-0 d-none d-sm-block"
						data-aos="zoom-in">
						<c:choose>
							<c:when test="${nUser.avatar != null }">
								<img style="width: 475px;"
									src="${base }/upload/${nUser.avatar }" alt="login image"
									class="login-img">
							</c:when>
							<c:otherwise>
								<img style="width: 475px;"
									src="${base }/user/img/tensei-shitara-slime-datta-ken-2nd-season-thumbnail.jpg"
									alt="login image" class="login-img">

							</c:otherwise>
						</c:choose>
					</div>
				</div>

			</div>
			<div class="col-sm-6 ml-5">
				<div style="height: 130px;"></div>
				<div class="row">
					<h3 class="text-white">DANH SÁCH PHIM ĐÃ XEM</h3>
				</div>
				<div class="row">
					<c:forEach items="${listWatch }" var="list">

						<div class="col-sm-4 mt-2">
							<div class="">
								<img style="width: 120px;" alt="..."
									src="${base }/upload/${list.avatar }">
							</div>
							<div class="justify-content-between">
								<div class="row mt-3">
									<a href="${base }/anime-watching/${list.seo }">${list.title }</a>
								</div>
								<div class="row text-danger mt-1 mr-1">${list.price }<i
										class="far fa-star"></i>
								</div>
							</div>
						</div>

					</c:forEach>
				</div>
			</div>

		</div>


	</div>



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