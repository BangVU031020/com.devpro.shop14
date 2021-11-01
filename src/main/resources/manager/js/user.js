//Xử lý kịch bản cho user.html - user.js
function generatePermis(){
	//Khai báo mảng các quyền thực thi
	
	//Cách 1:
	var permis= new Array();
	permis[0]="---Chọn---";
	permis[1]="Thành viên (members)";
	permis[2]="Tác giả (authors)";
	permis[3]="Quản lý (managers)";
	permis[4]="Quản trị (administrators)";
	permis[5]="Quản trị cấp cao (supers)";
	
	//Cách 2:
	var permis2= new Array("------Chọn------", "------Thành viên(members)------", permis[2], "", "", "");
	
	//Cách 3:
	var permis3= ["------Chọn------", "------Thành viên(members)------", permis[2], "", "", ""];
	
	//Duyệt mảng để tạo cấu trúc option
	var opt = "<select class=\"form-control\" id=\"slcPermis\">";
	for(var i=0; i<permis.length; i++){
		opt += "<option value=\""+i+"\"> ";
		opt += permis[i];
		opt += "</option>";
	}
	
	opt+= "</select>";
	
	//Xuất cấu trúc ra màn hình 
	document.write(opt);
	
}


//-----------------------------------------------------------------------------------------
function viewOption(element, index, array){
	document.write("<option value=\""+index+"\">"+element+"</option>")
}

function generatePermis2(){
	//Khai báo mảng các quyền thực thi
	
	//Cách 1:
	var permis= new Array();
	permis[0]="---Chọn---";
	permis[1]="Thành viên (members)";
	permis[2]="Tác giả (authors)";
	permis[3]="Quản lý (managers)";
	permis[4]="Quản trị (administrators)";
	permis[5]="Quản trị cấp cao (supers)";
	
	//in select
	document.write("<select class=\"form-control\" id=\"slcPermis\" onChange=\"refreshPermis(this.form)\">");
	
	
	//Sử dụng lặp với forEach
	permis.forEach(viewOption);
	
	document.write("</select>");
}

//-----------------------------------------------------------------------------------------

function generateRoles(){
	//Danh sách vai trò
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
	
	//Tạo cấu trúc
	var role = "";
	for(var i=0; i<roles.length; i++){
		//Mở dòng 
		if(i%3==0){
			role += "<div class=\"row\">";
		}
		
		role += viewRole(i, roles[i]);
		
		//Đóng dòng
		if(i%3==2 || i==roles.length-1){
			role += "</div>";
		}
	}
	//xuất cấu trúc
	document.write(role);
}

function viewRole(id, name){
	var role = "";
	
	role += "<div class=\"col-md-4\">";
	role += "<div class=\"form-check \">";
	role += "<input class=\"form-check-input\" disabled name=\"chks\" type=\"checkbox\" id=\"chk"+id+"\" onClick=\"checkPermis()\">";
	role += "<label class=\"form-check-label\" for=\"chk"+id+"\">";
	role += "Quản lý "+name;
	role += "</label>";
	role += "</div>";
	role += "</div>";
	
	return role;
}


//-----------------------------------------------------------------------------------------

function setCheckBox(fn, dis, check){
	//Duyệt các phần tử của form, và tìm vào những ô check cần làm việc
	for(var i=0; i<fn.elements.length; i++){
		if( fn.elements[i].type == "checkbox"&& fn.elements[i].name=="chks"){
			fn.elements[i].disabled = dis;
			fn.elements[i].checked = check;
		}
	}	
}

function refreshPermis(fn){
	//Lấy quyền thực thi
	var permis = parseInt(document.getElementById("slcPermis").value);
	
	if(permis == 4 || permis  == 5){
		this.setCheckBox(fn, true, true);
	}else if(permis == 3){
		this.setCheckBox(fn, false, true);
	}else if(permis == 2){
		this.setCheckBox(fn, false, false);
	}else {
		this.setCheckBox(fn, true, false);
	}
	this.checkPermis();
}





//-----------------------------------------------------------------------------------------
function checkName(){
	//Tham chiếu đối tượng lấy tên
	var name= document.getElementById("txtName").value;
	
	//Biến xác nhận lỗi
	var validName = true;
	
	//Biến ghi nhận thông báo
	var message = "";
	
	//Kiểm tra
	name = name.trim();
	if(name==""){
		validName=false;
		message="Thiếu tên đăng nhập cho tài khoản!";
	}else{
		if((name.length<5) || (name.length>50)){
			validName=false;
			message="Tên đăng nhập có độ dài [5->50] ký tự!";
		}else{
			if(name.indexOf(" ")!=-1){
				validName=false;
				message="Tên tài khoản không được có dấu cách!";
			}else if(name.indexOf("@")!=-1){
				var pattern =/\w+@\w+[.]\w/;
				//Tham chiếu tới hộp thư ở dưới
				var email = document.getElementById("txtEmail");
				
				if(!name.match(pattern)){
					validName=false;
					message="Không đúng cấu trúc hộp thư";
					email.disabled=false;
				}else{
					email.disabled=true;
				}
			}
				
			
		}
		
	}
	
	//Tham chiếu đối tượng báo lỗi
	var error=document.getElementById("errName");
	
	if(!validName){
		error.innerHTML=message;
		error.style.color="red";
		error.style.fontWeight = "bold";
	}else{
		error.innerHTML = "<i class=\"fas fa-check\"></i>";
		error.style.color="green";
		error.style.fontWeight = "bold";
	}
	
	return validName;
}






//-----------------------------------------------------------------------------------------

function checkPass(){
	//Lấy giá trị của pass
	var pass = document.getElementById("txtPass").value;
	var pass2 = document.getElementById("txtPass2").value;
	
	var validPass=true;
	var validPass2=true;
	
	var message="";
	
	//Kiểm tra
	pass= pass.trim();
	if(pass==""){
		validPass=false;
		message="Mật khẩu không thể bỏ trống!";
		
	}else{
		if((pass.length<6) || (pass.length>100)){
			validPass=false;
			message="Mật khẩu có độ dài [6->100] ký tự!";
		}else {
			var name= document.getElementById("txtName").value;
			if((name.trim()!="")&&(pass.indexOf(name)!=-1)){
				validPass=false;
				message="Mật khẩu không chứa tên đăng nhập!";
			}else{
				if(pass2==""){
					validPass2=false;
					message="Không có mật khẩu xác nhận lại!";
				}else{
					if(pass!=pass2){
						validPass2=false;
						message="Mật khẩu xác nhận lại không đúng!";
					}
				}
			}
		}
	}
	
	//Tham chiếu báo lỗi
	var err1 = document.getElementById("errPass");
	var err2 = document.getElementById("errPass2");
	
	if(validPass && validPass2){
		err1.innerHTML = "<i class=\"fas fa-check\"></i>";
		err1.style.color="green";
		err1.style.fontWeight = "bold";
		err2.innerHTML = "";
	}else{
		if(!validPass){
			err1.innerHTML = message;
			err1.style.color="red";
			err1.style.fontWeight = "bold";
		}else if(!validPass2){
			err2.innerHTML = message;
			err2.style.color="red";
			err2.style.fontWeight = "bold";
			err1.innerHTML = "";
		}
		
	}
	
	return validPass && validPass2;
	
	
	
}


//-----------------------------------------------------------------------------------------
function checkEmail(){
	var email = document.getElementById("txtEmail").value;
	
	var validEmail = true;
	
	var message = "";
	
	email = email.trim();
	
	if(email==""){
		validEmail=false;
		message="Thiếu hộp thư cho tài khoản";
	}else{
		if(email.indexOf("@")!=-1){
			var pattern =/\w+@\w+[.]\w/;
			
			if(!email.match(pattern)){
				validEmail=false;
				message="Không đúng cấu trúc hộp thư";
			}
		}else{
			validEmail=false;
			message="Không đúng cấu trúc hộp thư!";
		}
	}
	
	//THông báo
	
	var error = document.getElementById("errEmail");
	
	if(!validEmail){
		error.innerHTML = message;
		error.style.color="red";
		error.style.fontWeight = "bold";
	}else{
		error.innerHTML = "<i class=\"fas fa-check\"></i>";
		error.style.color="green";
		error.style.fontWeight = "bold";
	}
	 return validEmail;
	
}




//-----------------------------------------------------------------------------------------
function checkPermis(){
	//Tham chiếu lấy quyền thực thi
	var permis = parseInt(document.getElementById("slcPermis").value);
	
	var validPermis = true;
	
	var message = "";
	
	if((permis==2)||(permis==3)){
		
		var fn = document.getElementById("frmUser");
		
		
		for (var i=0; i< fn.elements.length;i++){
			if((fn.elements[i].type=="checkbox")&&(fn.elements[i].name=="chks")){
				if(fn.elements[i].checked){
					validPermis=true;
					break;
				}else{
					validPermis=false;
				}
			}
		}
		
		
	}
	//Xuất thông báo
	
	var error = document.getElementById("errPermis");
	
	if(!validPermis){
		error.innerHTML = "Cần có ít nhất một quyền cho đối tượng này!";
		error.style.color="red";
		error.style.fontWeight="bold";
		
	}else{
		error.innerHTML = "";
	}
	
	return validPermis;
	
	
}



//-----------------------------------------------------------------------------------------

function checkValidUser(){
	
	var validName=checkName();
	
	var validPass=checkPass();
	
	var validEmail=checkEmail();
	
	var validPermis=checkPermis();
	
	//Đặt con trỏ vào những vị trí lỗi theo thứ tự ưu tiên từ trên xuống, twf trái sang
	if(!validName){
		document.getElementById("txtName").focus();
		document.getElementById("txtName").select();
	}else if(!validPass){
		document.getElementById("txtPass").focus();
		document.getElementById("txtPass").select();
	}else if(!validEmail){
		document.getElementById("txtEmail").focus();
		document.getElementById("txtEmail").select();
	}else if(!validPermis){
		document.getElementById("slcPermis").focus();
	}
	
	return validName && validPass && validEmail && validPermis;
	
}
















//-----------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------