// Xử lý định dạng cho login2 -login2.js
function checkValidUserName(){
	//Lấy thông tin về tài khoản
	var name = document.getElementById("txtName").value;
	
	//Lấy thông tin checkbox
	var check = document.getElementById("chkSave").checked;
	
	//Tham chiếu đối tượng viewError
	var viewError = document.getElementById("viewError-UserName");
	var valid = document.getElementById("valid");
	
	if(name==""){
		viewError.innerHTML="Thiếu thông tin đăng nhập";
		valid.innerHTML="<i class=\"fas fa-times-circle\"></i>";
		valid.style.color="red";
		viewError.style.fontSize="13";
		viewError.style.color="red";
	}else{
		if(name.indexOf(" ")!=-1){
			viewError.innerHTML="Tên đăng nhập không bao gồm khoảng trống";
			valid.innerHTML="<i class=\"fas fa-times-circle\"></i>";
			valid.style.color="red";
			viewError.style.fontSize="13";
			viewError.style.color="red";
		}else{
			if((name.length<5)||(name.length>50)){
				viewError.innerHTML="Độ dài tên đăng nhập không hợp lệ";
				valid.innerHTML="<i class=\"fas fa-times-circle\"></i>";
				valid.style.color="red";
				viewError.style.fontSize="13";
				viewError.style.color="red";
			}else{
				if(name.indexOf("@")!=-1){
					var parttern =/\w+@\w+[.]\w/;
					if(!name.match(parttern)){
						viewError.innerHTML="Định dạng tên đăng nhập không hợp lệ!";
						valid.innerHTML="<i class=\"fas fa-times-circle\"></i>";
						valid.style.color="red";
						viewError.style.fontSize="13";
						viewError.style.color="red";
					}
				}else{
					valid.innerHTML="<i class=\"fas fa-check-circle\"></i>";
					viewError.innerHTML="";
					valid.style.color="green";
				}
			}
		}
	}
}
function checkValidPassword(){
	var pass = document.getElementById("txtPass").value;
	
	//Tham chiếu đối tượng viewError
	var viewErrorPass = document.getElementById("viewError-Pass");
	var validpass = document.getElementById("valid-pass");
	if(pass==""){
		viewErrorPass.innerHTML="Bạn cần điền mật khẩu trước khi đăng nhập";
		validpass.innerHTML="<i class=\"fas fa-times-circle\"></i>";
		validpass.style.color="red";
		viewErrorPass.style.color="red";
		viewErrorPass.style.fontSize="13";
	}else{
		if(pass.indexOf(" ")!=-1){
			viewErrorPass.innerHTML="Mật khẩu không bao gồm khoảng trống";
			validpass.innerHTML="<i class=\"fas fa-times-circle\"></i>";
			validpass.style.color="red";
			viewErrorPass.style.color="red";
			viewErrorPass.style.fontSize="13";
		}else{
			if((pass.length<5)||(pass.length>50)){
				viewErrorPass.innerHTML="Độ dài mật khẩu không hợp lệ";
				validpass.innerHTML="<i class=\"fas fa-times-circle\"></i>";
				validpass.style.color="red";
				viewErrorPass.style.color="red";
			viewErrorPass.style.fontSize="13";
			}else{
				validpass.innerHTML="<i class=\"fas fa-check-circle\"></i>";
				validpass.style.color="green";
				viewErrorPass.innerHTML="";
			}
		}
	}
}
function checkSave(){
	var checked = document.getElementById("viewError-check");
	var check = document.getElementById("chkSave").checked;
	if(check){
		checked.innerHTML="Thông tin của bạn sẽ được lưu trên máy này!";
		checked.style.color="red";
		checked.style.fontSize="12";
	}else{
		
		checked.innerHTML="";
	}
		
}


