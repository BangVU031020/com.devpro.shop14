/**
* Template Name: EstateAgency - v2.2.1
* Template URL: https://bootstrapmade.com/real-estate-agency-bootstrap-template/
* Author: BootstrapMade.com
* License: https://bootstrapmade.com/license/
*/
(function($) {
	"use strict";

	// Preloader
	$(window).on('load', function() {
		if ($('#preloader').length) {
			$('#preloader').delay(100).fadeOut('slow', function() {
				$(this).remove();
			});
		}
	});

	// Back to top button
	$(window).scroll(function() {
		if ($(this).scrollTop() > 100) {
			$('.back-to-top').fadeIn('slow');
		} else {
			$('.back-to-top').fadeOut('slow');
		}
	});
	$('.back-to-top').click(function() {
		$('html, body').animate({
			scrollTop: 0
		}, 1500, 'easeInOutExpo');
		return false;
	});

	var nav = $('nav');
	var navHeight = nav.outerHeight();

	/*--/ ScrollReveal /Easy scroll animations for web and mobile browsers /--*/
	window.sr = ScrollReveal();
	sr.reveal('.foo', {
		duration: 1000,
		delay: 15
	});

	/*--/ Carousel owl /--*/
	$('#carousel').owlCarousel({
		loop: true,
		margin: -1,
		items: 1,
		nav: true,
		navText: ['<i class="ion-ios-arrow-back" aria-hidden="true"></i>', '<i class="ion-ios-arrow-forward" aria-hidden="true"></i>'],
		autoplay: true,
		autoplayTimeout: 3000,
		autoplayHoverPause: true
	});

	/*--/ Animate Carousel /--*/
	$('.intro-carousel').on('translate.owl.carousel', function() {
		$('.intro-content .intro-title').removeClass('animate__zoomIn animate__animated').hide();
		$('.intro-content .intro-price').removeClass('animate__fadeInUp animate__animated').hide();
		$('.intro-content .intro-title-top, .intro-content .spacial').removeClass('animate__fadeIn animate__animated').hide();
	});

	$('.intro-carousel').on('translated.owl.carousel', function() {
		$('.intro-content .intro-title').addClass('animate__zoomIn animate__animated').show();
		$('.intro-content .intro-price').addClass('animate__fadeInUp animate__animated').show();
		$('.intro-content .intro-title-top, .intro-content .spacial').addClass('animate__fadeIn animate__animated').show();
	});

	/*--/ Navbar Collapse /--*/
	$('.navbar-toggle-box-collapse').on('click', function() {
		$('body').removeClass('box-collapse-closed').addClass('box-collapse-open');
	});
	$('.close-box-collapse, .click-closed').on('click', function() {
		$('body').removeClass('box-collapse-open').addClass('box-collapse-closed');
		$('.menu-list ul').slideUp(700);
	});

	/*--/ Navbar Menu Reduce /--*/
	$(window).trigger('scroll');
	$(window).bind('scroll', function() {
		var pixels = 50;
		var top = 1200;
		if ($(window).scrollTop() > pixels) {
			$('.navbar-default').addClass('navbar-reduce');
			$('.navbar-default').removeClass('navbar-trans');
		} else {
			$('.navbar-default').addClass('navbar-trans');
			$('.navbar-default').removeClass('navbar-reduce');
		}
		if ($(window).scrollTop() > top) {
			$('.scrolltop-mf').fadeIn(1000, "easeInOutExpo");
		} else {
			$('.scrolltop-mf').fadeOut(1000, "easeInOutExpo");
		}
	});

	/*--/ Property owl /--*/
	$('#property-carousel').owlCarousel({
		loop: true,
		margin: 30,
		responsive: {
			0: {
				items: 1,
			},
			769: {
				items: 2,
			},
			992: {
				items: 3,
			}
		}
	});

	/*--/ Property owl owl /--*/
	$('#property-single-carousel').owlCarousel({
		loop: true,
		margin: 0,
		nav: true,
		navText: ['<i class="ion-ios-arrow-back" aria-hidden="true"></i>', '<i class="ion-ios-arrow-forward" aria-hidden="true"></i>'],
		responsive: {
			0: {
				items: 1,
			}
		}
	});

	/*--/ News owl /--*/
	$('#new-carousel').owlCarousel({
		loop: true,
		margin: 30,
		responsive: {
			0: {
				items: 1,
			},
			769: {
				items: 2,
			},
			992: {
				items: 3,
			}
		}
	});

	/*--/ Testimonials owl /--*/
	$('#testimonial-carousel').owlCarousel({
		margin: 0,
		autoplay: true,
		nav: true,
		animateOut: 'fadeOut',
		animateIn: 'fadeInUp',
		navText: ['<i class="ion-ios-arrow-back" aria-hidden="true"></i>', '<i class="ion-ios-arrow-forward" aria-hidden="true"></i>'],
		autoplayTimeout: 4000,
		autoplayHoverPause: true,
		responsive: {
			0: {
				items: 1,
			}
		}
	});
	var url = window.location.pathname,
		urlRegExp = new RegExp(url.replace(/\/$/, '') + "$"); // create regexp to match current url pathname and remove trailing slash if present as it could collide with the link in navigation in case trailing slash wasn't present there
	// now grab every link from the navigation
	$('.menu a').each(function() {
		// and test its normalized href against the url pathname regexp
		if (urlRegExp.test(this.href.replace(/\/$/, ''))) {
			$(this).addClass('active');
		}
	});
	var star = '.star',
		selected = '.selected';

	$(star).on('click', function() {
		$(selected).each(function() {
			$(this).removeClass('selected');
		});
		$(this).addClass('selected');
	});

	

})(jQuery);

AOS.init({
	duration: 1000,
})

function checkName() {
	//Tham chiếu đối tượng lấy tên
	var name = document.getElementById("username").value;

	//Biến xác nhận lỗi
	var validName = true;

	//Biến ghi nhận thông báo
	var message = "";

	//Kiểm tra
	name = name.trim();
	if (name == "") {
		validName = false;
		message = "Thiếu tên đăng nhập cho tài khoản!";
	} else {
		if ((name.length < 5) || (name.length > 50)) {
			validName = false;
			message = "Tên đăng nhập có độ dài [5->50] ký tự!";
		} else {
			if (name.indexOf(" ") != -1) {
				validName = false;
				message = "Tên tài khoản không được có dấu cách!";
			} else if (name.indexOf("@") != -1) {
				var pattern = /\w+@\w+[.]\w/;
				//Tham chiếu tới hộp thư ở dưới
				var email = document.getElementById("email");

				if (!name.match(pattern)) {
					validName = false;
					message = "Không đúng cấu trúc hộp thư";
					email.disabled = false;
				} else {
					email.disabled = true;
				}
			}


		}

	}

	//Tham chiếu đối tượng báo lỗi
	var error = document.getElementById("errName");

	if (!validName) {
		error.innerHTML = message;
		error.style.color = "red";
		error.style.fontWeight = "bold";
	} else {
		error.innerHTML = "<i class=\"fas fa-check\"></i>";
		error.style.color = "green";
		error.style.fontWeight = "bold";
	}

	return validName;
}






//-----------------------------------------------------------------------------------------

function checkPass() {
	//Lấy giá trị của pass
	var pass = document.getElementById("password").value;
	var pass2 = document.getElementById("rePassword").value;

	var validPass = true;
	var validPass2 = true;

	var message = "";

	//Kiểm tra
	pass = pass.trim();
	if (pass == "") {
		validPass = false;
		message = "Mật khẩu không thể bỏ trống!";

	} else {
		if ((pass.length < 6) || (pass.length > 100)) {
			validPass = false;
			message = "Mật khẩu có độ dài [6->100] ký tự!";
		} else {
			var name = document.getElementById("username").value;
			if ((name.trim() != "") && (pass.indexOf(name) != -1)) {
				validPass = false;
				message = "Mật khẩu không chứa tên đăng nhập!";
			} else {
				if (pass2 == "") {
					validPass2 = false;
					message = "Không có mật khẩu xác nhận lại!";
				} else {
					if (pass != pass2) {
						validPass2 = false;
						message = "Mật khẩu xác nhận lại không đúng!";
					}
				}
			}
		}
	}

	//Tham chiếu báo lỗi
	var err1 = document.getElementById("errPass");
	var err2 = document.getElementById("errPass2");

	if (validPass && validPass2) {
		err1.innerHTML = "<i class=\"fas fa-check\"></i>";
		err1.style.color = "green";
		err1.style.fontWeight = "bold";
		err2.innerHTML = "";
	} else {
		if (!validPass) {
			err1.innerHTML = message;
			err1.style.color = "red";
			err1.style.fontWeight = "bold";
		} else if (!validPass2) {
			err2.innerHTML = message;
			err2.style.color = "red";
			err2.style.fontWeight = "bold";
			err1.innerHTML = "";
		}

	}

	return validPass && validPass2;



}
//-----------------------------------------------------------------------------------------
function checkEmail() {
	var email = document.getElementById("email").value;

	var validEmail = true;

	var message = "";

	email = email.trim();

	if (email == "") {
		validEmail = false;
		message = "Thiếu hộp thư cho tài khoản";
	} else {
		if (email.indexOf("@") != -1) {
			var pattern = /\w+@\w+[.]\w/;

			if (!email.match(pattern)) {
				validEmail = false;
				message = "Không đúng cấu trúc hộp thư";
			}
		} else {
			validEmail = false;
			message = "Không đúng cấu trúc hộp thư!";
		}
	}

	//THông báo

	var error = document.getElementById("errEmail");

	if (!validEmail) {
		error.innerHTML = message;
		error.style.color = "red";
		error.style.fontWeight = "bold";
	} else {
		error.innerHTML = "<i class=\"fas fa-check\"></i>";
		error.style.color = "green";
		error.style.fontWeight = "bold";
	}
	return validEmail;

}


function checkValidUser(check) {

	var validName = checkName();

	var validPass = checkPass();

	var validEmail = checkEmail();

	//Đặt con trỏ vào những vị trí lỗi theo thứ tự ưu tiên từ trên xuống, twf trái sang
	if (!validName) {
		document.getElementById("username").focus();
		document.getElementById("username").select();
	} else if (!validPass) {
		document.getElementById("password").focus();
		document.getElementById("password").select();
	} else if (!validEmail) {
		document.getElementById("email").focus();
		document.getElementById("email").select();
	} else if(check){
		document.getElementById("mes").innerHTML = "<div class=\"modal fade bd-example-modal-lg\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myLargeModalLabel\" aria-hidden=\"true\"><div class=\"modal-dialog modal-lg\"><div class=\"modal-content\"><h3 class=\"border-bottom text-success\">Đăng ký thành công!</h3><p>Cảm ơn bạn đã đăng ký sử dụng dich vụ của chúng tôi.</p></div></div></div>";
	} else {
		document.getElementById("mes").innerHTML = "<div class=\"modal fade bd-example-modal-lg\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myLargeModalLabel\" aria-hidden=\"true\"><div class=\"modal-dialog modal-lg\"><div class=\"modal-content\"><h3 class=\"border-bottom text-success\">Đăng ký không thành công!</h3><p>Email hoặc tên tài khoản đã tồn tại.</p></div></div></div>";
	}

	return validName && validPass && validEmail && check;

}


