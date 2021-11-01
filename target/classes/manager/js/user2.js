//xử lý kịch bản cho user.html

//---------------------------------------------------------------------------------
//Khởi tạo mảng chứa Permis

var permis = new Array();
	permis[0] = "--chọn--";
	permis[1] = "Thành viên (Members)";
	permis[2] = "Tác giả (Authors)";
	permis[3] = "Quản lý (Managers)";
	permis[4] = "Quản trị (Administrators)";
	permis[5] = "Quản trị cấp cao (Super Administrators)";

//Khởi tạo mảng chứa role
var roles = new Array(
		"Người sử dụng",
		"Hệ sản phẩm",
		"Nhóm sản phẩm",
		"Loại sản phẩm",
		"Sản phẩm",
		"Chuyên mục",
		"Thể loại",
		"Bài viết & Tin tức",
		"Hóa đơn",
		"Khách hàng"
	);
	
$(function(){
	$(".permis").html("<select class=\"form-control\" id=\"slcPermis\" \">");
	jQuery.each(permis, function(index, val){
		
		$("#slcPermis").append(new Option(val, index));
		
	});
	$(".permis").append("</select>");
});


//---------------------------------------------------------------------------------
$(function(){
	var count = 0;
	jQuery.each(roles, function(index, val){
		
		if(index%3 == 0){
			$(".roles").append("<div class=\"row row"+count+"\">");
			$(".row"+count).append("<div class=\"col-md-4 "+count+index%3+"\"> <div class=\"form-check form"+count+index%3+"\">");
			$(".form"+count+index%3).append("<input class=\"form-check-input\" disabled  name=\"chks\" type=\"checkbox\" id=\"chk"+index+"\">");
			$(".form"+count+index%3).append("<label class=\"form-check-label\" for=\"chk"+index+"\">Quản lý "+val+"</label>");
		}else{
			$(".row"+count).append("<div class=\"col-md-4 "+count+index%3+"\"> <div class=\"form-check form"+count+index%3+"\">");
			$(".form"+count+index%3).append("<input class=\"form-check-input\" disabled  name=\"chks\" type=\"checkbox\" id=\"chk"+index+"\" >");
			$(".form"+count+index%3).append("<label class=\"form-check-label\" for=\"chk"+index+"\">Quản lý "+val+"</label>");
		}
		if(index%3 == 2 || index == (roles.length - 1)){
			$(".form"+count+index%3).after("</div>");
			$(".row"+count).append("</div>");
			$(".roles").append("</div>");
			count=count+1;
		}else{
			$(".form"+count+index%3).after("</div>");
			$(".row"+count).append("</div>");
		}
	});
});



$(function(){
	function setCheckBox(dis, check){
		$('input[type = "checkbox"]').prop('disabled', dis);
		$('input[type = "checkbox"]').prop('checked', check);
	}
	$("#slcPermis").change(function(){
		var permis = $("#slcPermis").val();
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
		var permis = $("#slcPermis").val();
		if((permis == 2 )|| (permis == 3)){
			for(var i = 0; i < roles.length; i++ ){
				if($("#chk" + i).prop('checked')){
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


//-----------------------------------------------------------------------------------------

	//Kiểm tra
	function chkName(){
		var name= $('#txtName').val();
		var validname= true;
		if(name==""){
			$('#errName').text('Thiếu tên đăng nhập');
			validname= false;
		}else{
			if((name.length<5) || (name.length>50)){
			$('#errName').text('Tên đăng nhập có độ dài [5->50] ký tự!');
			$('#errName').css({"color": "red"});
			validname= false;
			}else{
				if(name.indexOf(" ")!=-1){
					$('#errName').text('Tên tài khoản không được có dấu cách!');
					$('#errName').css({"color": "red"});
					validname= false;
				}else {
					if(name.indexOf("@")!=-1){
						var pattern =/\w+@\w+[.]\w/;
						//Tham chiếu tới hộp thư ở dưới
						var email = $('#txtEmail').val();
						
						if(!name.match(pattern)){
							$('#errName').text('Không đúng cấu trúc hộp thư');
							$('#errName').css({"color": "red"});
							email.disabled=false;
							validname= false;
						}else{
							$('#errName').html('<i class=\"fas fa-check\"></i>');
							$('#errName').css({"color": "green"});
							email.disabled=true;
						}
					}else{
						$('#errName').html('<i class=\"fas fa-check\"></i>');
						$('#errName').css({"color": "green"});
					}
				}
			}
		}
		return validname;
	}
	$('#txtName').keyup(chkName);



//-----------------------------------------------------------------------------------------

	//Kiểm tra
	function chkPass(){
		var pass= $('#txtPass').val();
		var validPass=true;
		if(pass==""){
			$('#errPass').text('Thiếu mật khẩu');
			var validPass=false;
		}else{
			if((pass.length<5) || (pass.length>50)){
			$('#errPass').text('Mật khẩu có độ dài [5->50] ký tự!');
			var validPass=false;
			}else{
				if(pass.indexOf(" ")!=-1){
					$('#errPass').text('Mật khẩu không được có dấu cách!');
					var validPass=false;
				}else {
					$('#errPass').html('<i class=\"fas fa-check\"></i>');
					$('#errPass').css({"color": "green"});
				}
			}
		}
		return validPass;
	}
	$('#txtPass').keyup(chkPass);



	//Kiểm tra
	$('#txtPass2').keyup(function chkPass2(){
		var pass= $('#txtPass').val();
		var pass2= $('#txtPass2').val();
		
		if(pass!=pass2){
			$('#errPass2').text('Mật khẩu không khớp!');
		}else{
			$('#errPass2').html('<i class=\"fas fa-check\"></i>');
			$('#errPass2').css({"color": "green"});
		}
	});

	//Kiểm tra
	function chkEmail(){
		var pattern =/\w+@\w+[.]\w/;
		//Tham chiếu tới hộp thư ở dưới
		var email = $('#txtEmail').val();
		var validEmail=true;
		if(!email.match(pattern)){
			$('#errEmail').text('Không đúng cấu trúc hộp thư');
			$('#errEmail').css({"color": "red"});
			var validEmail=false;
		}else{
			$('#errEmail').html('<i class=\"fas fa-check\"></i>');
			$('#errEmail').css({"color": "green"});
		}
		return validEmail;
	}
	$('#txtEmail').keyup(chkEmail);
	
	$(".btnAdd").click(function(){
		var validName = chkName();
		var validPass = chkPass();
		var validEmail = chkEmail();
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
});



