//xử lý kịch bản cho user.html	
//---------------------------------------------------------------------------------

$(function(){
	//---------------------------------------------------------------------------------
	var stringPermis;
	function viewOption(element, index, array){
		stringPermis += "<option value=\""+ index +"\">"+ element +"</option>";
	}
	$(".permision").html(function(){
		var permis = new Array();
		permis[0] = "--chọn--";
		permis[1] = "Thành viên (Members)";
		permis[2] = "Tác giả (Authors)";
		permis[3] = "Quản lý (Managers)";
		permis[4] = "Quản trị (Administrators)";
		permis[5] = "Quản trị cấp cao (Super Administrators)";
		
		//in select 
		stringPermis = "<select class=\"form-control\" id=\"slcPermis\" >";
		
		//sử dụng lặp với foreach
		permis.forEach(viewOption);
		
		stringPermis += "</select>";
		return stringPermis;
	});
	//---------------------------------------------------------------------------------
	function viewRole(id, name){
		var role = "";
		role += "<div class=\"col-md-4\">";
		role += "<div class=\"form-check\">";
		role += "<input class=\"form-check-input\" disabled name=\"chks\" type=\"checkbox\" id=\"ck"+ id +"\">";
		role += "<label class=\"form-check-label\" for=\"ck"+ id +"\">";
		role += "Quản lý " + name;
		role += "</label>";
		role += "</div>";
		role += "</div>";
		
		return role;
	}
	//khai báo ds vai trò
	var roles = new Array(
			"người sử dụng",
			"Hệ sản phẩm",
			"Nhóm sản phẩm",
			"Loại sản phẩm",
			"sản phẩm",
			"Thể loại",
			"Chuyên mục",
			"Bài viết + Tin tức",
			"Hóa đơn",
			"Khách hàng"
		);
	$(".roles").html(function(){
		
		
		//Tạo cáu trúc
		var role = "";
		
		for(var i = 0; i < roles.length; i++ ){
			//mở dòng
			if(i%3 == 0){
				role += "<div class=\"row\">";
			}
			role += viewRole(i, roles[i]);
			//đóng dòng
			if(i%3 == 2 || i == (roles.length - 1)){
				role += "</div>";
			}
		}
		return role;
	});
	//---------------------------------------------------------------------------------
	function setCheckBox(dis, check){
		$('input[type = "checkbox"]').prop('disabled', dis);
		$('input[type = "checkbox"]').prop('checked', check);
	}
	$("#slcPermis").change(function(){
		var permis = parseInt($("#slcPermis").val());
		if((permis == 4) || (permis == 5)){
			setCheckBox(true, true);
		}else if(permis == 3){
			setCheckBox(false, true);
		}else if(permis == 2){
			setCheckBox(false, false);
		}else{
			setCheckBox(true, false);
		}
	});
	//---------------------------------------------------------------------------------
	function checkPermis(){
		var validPermis = true;
		var permis = parseInt($("#slcPermis").val());
		if(permis == 2 || permis == 3){
			for(var i = 0; i < roles.length; i++ ){
				if($("#ck" + i).prop('checked')){
					validPermis = true;
					break;
				}else
					validPermis = false;
			}
		}
		//xuất thông báo
		var error = $("#errPermis");
		if(!validPermis){
			error.html("Cần có ít nhất 1 lựa chọn cho quyển này");
			error.css({"color": "red", "fontWeight": "bold"});
		}else{
			error.html("");
		}
		return validPermis;
	}
	$('input[type = "checkbox"], #slcPermis').change(checkPermis);
	//---------------------------------------------------------------------------------
	function checkName(){
		//tham chiếu đối tượng lấy tên 
		var name = $("#txtName").val();
		$("#txtEmail").prop('disabled', false);
		//khai báo biến xác nhận lỗi
		var validName = true;
		
		var message = "";
		
		//kiểm tra
		name = name.trim();
		
		if(name == ""){
			validName = false;
			message = "Thiếu tên đăng nhập";
		}else {
			if(name.length < 5 || name.length > 50){
				validName = false;
				message = "Tên đăng nhập có độ dài (5->50) ký tự";
			}else{
				if(name.indexOf(" ") != -1){
					validName = false;
					message = "Tên đăng nhập không được có dấu cách";
				}else {
					if(name.indexOf("@") != -1){
						var partten = /\w+@\w+[.]\w/;
						if(!name.match(partten)){
							message = "không đúng cấu trúc hộp thư";
							validName = false;
							$("#txtEmail").prop('disabled', false);
						}else {
							$("#txtEmail").prop('disabled', true);
						}
					} 
				}
			}
		}
		
		//tham chiếu đối tương báo lổi
		var error = $("#errName");
		
		if(!validName){
			error.html(message);
			error.css({"color": "red", "fontWeight": "bold"});
		}else{
			error.html("<i class=\"fas fa-check\"></i>");
			error.css({"color": "green"});
		}
		return validName;
	}
	$("#txtName").keyup(checkName);
	$("#txtName").keyup(checkPass);
	//---------------------------------------------------------------------------------
	function checkPass(){
		//lấy giá trị của pas
		var pass = $("#txtPass").val();
		var pass2 = $("#txtPass2").val();
		var validPass = true;
		var validPass2 = true;
		
		var message = "";
		
		//kiểm tra tính đúng của pass
		pass = pass.trim();
		pass2 = pass2.trim();
		
		if(pass == ""){
			validPass = false;
			message = "Thiếu mật khẩu đăng nhập";
		}else{
			if(pass.length < 6 || pass.length > 100){
				validPass = false;
				message = "Mật khẩu đăng nhập phai từ (6->100) ký tự";
			}else{
				var name  = $("#txtName").val();
				if(pass.indexOf(name) != -1 && name != ""){
					validPass = false;
					message = "Mật khẩu không được chứa tên đăng nhập";
				}else{
					if(pass2 == ""){
						validPass2 = false;
						message = "Không có mật khẩu xác nhận lại";
					}else{
						if(pass != pass2){
							validPass2 = false;
							message = "Mật khảu xác nhận lại không đúng";
						}
					}
				}
			}
		}
		//tham chiếu báo lỗi
		var err1 = $("#errPass");
		var err2 = $("#errPass2");
		
		if(validPass && validPass2){
			err1.html("<i class=\"fas fa-check\"></i>");
			err1.css({ "color": "green" , "fontWeight": "bold"});
			err2.html("");
		}else{
			if(!validPass){
				err1.html(message);
				err1.css({ "color": "red" , "fontWeight": "bold"});
			}else if(!validPass2){
				err2.html(message);
				err2.css({ "color": "red", "fontWeight": "bold"});
				err1.html("");
			}
			
		}
		return validPass && validPass2;
	}
	$("#txtPass, #txtPass2").keyup(checkPass);
	//---------------------------------------------------------------------------------
	function checkEmail(){
		var email = $("#txtEmail").val();
		var validEmail = true;
		var message = "";

		if(email == ""){
			validEmail = false;
			message = "Thiếu email đăng nhập";
		}else {
			if(email.indexOf(" ") != -1){
				validEmail = false;
				message = "Email không được có dấu cách";
			}else {
				if(email.indexOf("@") != -1){
					var partten = /\w+@\w+[.]\w/;
					if(!email.match(partten)){
						message = "không đúng cấu trúc hộp thư";
						validEmail = false;
					}
				}else{
					message = "Không phải hộp thư";
					validEmail = false;
				}
			}
		}
		//tham chiếu đối tương báo lổi
		var error = $("#errEmail");

		if(!validEmail){
			error.html(message);
			error.css({"color": "red", "fontWeight": "bold"});
		}else{
			error.html("<i class=\"fas fa-check\"></i>");
			error.css({"color": "green"});
		}
		return validEmail;
	}
	$("#txtEmail").keyup(checkEmail);
	//---------------------------------------------------------------------------------
	$(".btnAdd").click(function(){
		var validName = checkName();
		var validPass = checkPass();
		var validEmail = checkEmail();
		var validPermis = checkPermis();
		//đắt con trỏ vào những vị trí mới theo thứ tự ưu tiên từ trên -> dưới, trái ->
	
		if(!validName){
			$("#txtName").focus();
			$("#txtName").select();
		}else if(!validPass){
			$("#txtPass").focus();
			$("#txtPass").select();
		}else if(!validEmail){
			$("#txtEmail").focus();
			$("#txtEmail").select();
		}else if(!validPermis){
			$("#slcPermis").focus();
		}
	})
	//---------------------------------------------------------------------------------
	//---------------------------------------------------------------------------------
	//---------------------------------------------------------------------------------
});
