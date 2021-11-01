<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!-- directive cua JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="row mt-3">
	<div class="col-md-4">
		<div class="logo text-center bg-primary text-white pb-3">Logo</div>
	</div>
	<div class="col-md-8">
		<div class="acc text-center bg-info text-white pb-1">
			<div class="row">
				<div class="col-md-3 mt-1">
					<i class="fas fa-user user"></i>
					<i class="fas fa-user"></i>
				</div>
				<div class="col-md-6 info">
					<h1>Quản trị viên</h1>
					
					<c:if test="${isLogined }">
						<a href="#" class=info" >
							Admin (${userLogined.username })
						</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					</c:if>
					
					<a href="#" class=info">Sửa thông tin</a> &nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="#" class=info">Đổi mật khẩu</a>
				</div>
				<div class="col-md-3">
					<a href="${base }/logout">
						<i class="fas fa-sign-out-alt out"></i></a>
				</div>
			</div>
		
		</div>
	</div>
</div>
			