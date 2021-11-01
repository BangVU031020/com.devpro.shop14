<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>HW22_7 Tiki</title>
<meta charset="utf-8">
<!-- Variable -->
<jsp:include page="/WEB-INF/views/common/variable.jsp"></jsp:include>
<link href="${base }/user/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body>
	<div class="container">
		<div class="row mt-3">
			<div class="col-md-12 pb-3 border-bottom">
				<img style="width: 70px; height: 50px;"
					src="${base }/user/homework/hw22_7/img/1.png">
			</div>
			<div class="col-md-12 mt-2">
				<h1 class="text-primary">Đội ngũ chăm sóc khách hàng TIKI</h1>
			</div>
			<div class="col-md-12 mt-3">Tiki luôn sẵn sàng lắng nghe câu
				hỏi và ý kiến đóng góp từ bạn. Chúng tôi sẽ phản hồi ngay trong 24h
				tiếp theo!</div>
		</div>
		<div class="row">
			<sf:form method="POST" action="${base }/hw22_7"
				modelAttribute="hw22_7" enctype="multipart/form-data">
				<div class="row text-warning">
					<div class="col-md-12">${thongbao }</div>
				</div>
				<div class="row">
					<div class="col-md-12 mt-4">
						<b>Hãy chọn vấn đề bên dưới nhé *</b>
					</div>
					<div class="col-md-12">
						<sf:select path="vanDeChinh" id="vanDeCHinh" name="vanDeCHinh"
							class="form-control">
							<option value="0">Vấn đề hỗ trợ tài chính 1</option>
							<option value="1">Vấn đề hỗ trợ tài chính 2</option>
							<option value="2">Vấn đề hỗ trợ tài chính 3</option>
							<option value="3">Vấn đề hỗ trợ tài chính 4</option>
							<option value="4">Vấn đề hỗ trợ tài chính 5</option>
							<option value="5">Vấn đề hỗ trợ tài chính 6</option>
							<option value="6">Vấn đề hỗ trợ tài chính 7</option>
						</sf:select>
						<sf:select path="vanDeChiTiet" id="vanDeChiTiet"
							name="vanDeChiTiet" class="form-control mt-4">
							<option value="0">Vấn đề chi tiết 1</option>
							<option value="1">Vấn đề chi tiết 2</option>
							<option value="2">Vấn đề chi tiết 3</option>
							<option value="3">Vấn đề chi tiết 4</option>
							<option value="4">Vấn đề chi tiết 5</option>
							<option value="5">Vấn đề chi tiết 6</option>
							<option value="6">Vấn đề chi tiết 7</option>
						</sf:select>

					</div>

				</div>
				<div class="row mt-3">

					<div class="col-md-12">Địa chỉ email của bạn *</div>
					<div class="col-md-12">
						<sf:input path="email" id="email" class="form-control"
							type="email" name="email" placeholder="nhập địa chỉ email"></sf:input>
					</div>
				</div>
				<div class="row mt-3">

					<div class="col-md-12">Số điện thoại *</div>
					<div class="col-md-12">
						<sf:input path="sdt" id="sdt" class="form-control" type="text"
							name="sdt" placeholder="nhập số điện thoại"></sf:input>
					</div>
				</div>
				<div class="row mt-3">

					<div class="col-md-12">Mã đơn hàng</div>
					<div class="col-md-12">
						<sf:input path="maDonHang" id="maDonHang" class="form-control"
							type="text" name="maDonHang"
							placeholder="nhập mã đơn hàng (nếu có)"></sf:input>
					</div>
				</div>
				<div class="row mt-3">

					<div class="col-md-12">Tiêu đề *</div>
					<div class="col-md-12">
						<sf:input path="tieuDe" id="tieuDe" class="form-control"
							type="text" name="tieuDe" placeholder="nhập tiêu đề"></sf:input>
					</div>
				</div>
				<div class="row mt-3">

					<div class="col-md-12">Nội dung *</div>
					<div class="col-md-12">

						<sf:textarea path="noiDung" id="noiDung" name="noiDung"
							class="form-control" rows="5"
							placeholder="nhập chi tiết nội dung vấn đề của bạn"></sf:textarea>
					</div>
				</div>

				<div class="row mt-3">

					<div class="col-md-12"><laber for="fileUpload">Upload Your file (Mutifile)</laber></div>
					<div class="col-md-12">
						<input id="file" class="form-control-file"
							type="file" name="fileUpload" multiple="multiple" />
					</div>
				</div>

				<div class="row mt-3">
					<div class="col-md-3">
						<input class="form-control bg-primary text-white" type="submit"
							value="Gửi" name="">
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-md-3">
						<button type="button" class="form-control bg-primary text-white"
							value="" onclick="saveEmail(), saveFile()" name="">Gửi-ajax</button>
					</div>
				</div>

			</sf:form>
		</div>

		<div class="row mt-5 pt-3 mb-5 border-top">Tiki care</div>

	</div>
	<script src="${base }/user/vendor/jquery/jquery.min.js"></script>
	<!-- custom javascipt -->
	<script type="text/javascript">
	saveFile = function() {
			var data = new FormData();
			data.append('vanDeChinh', $('#vanDeChinh').val());
			jQuery.each(jQuery("#file")[0].files, function(i, file){
				data.append('file-' + i, file);
			});
			$.ajax({
				url: "/hw22_7-ajax-file",
				type : "POST",
				cache: false,
				contentType : "application/json",
				data : JSON.stringify(data),
				success: function(jsonResult){
					if (jsonResult.Status = 200) {
						alert(jsonResult.SuccessList)
					}else{
						alert("error");
					}
				},
				error : function(jqXhr, textStatus, errorMessage) { // error callback 

				}
			});
		}
		function saveEmail() {
			// javascript object.
			// data la du lieu ma day len action cua controller
			let data = {
				email : $("#email").val(), // lay theo id
				noiDung : $("#noiDung").val(), // lay theo id
			};

			// $ === jQuery
			// json == javascript object
			$.ajax({
				url : "/hw22_7-ajax",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(data),

				dataType : "json", // kieu du lieu tra ve tu controller la json
				success : function(jsonResult) {
					alert("Cảm ơn " + jsonResult.message.email+ " đã đóng góp ý kiến");
				},
				error : function(jqXhr, textStatus, errorMessage) { // error callback 

				}
			});
		}
		
	</script>
</body>
</html>