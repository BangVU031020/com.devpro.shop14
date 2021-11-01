<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!-- ======= Property Search Section ======= -->
	<div class="click-closed"></div>
	<!--/ Form Search Star /-->
	<div class="box-collapse">
		<div class="title-box-d">
			<h3 class="title-d">Tìm kiếm</h3>
		</div>
		<span class="close-box-collapse right-boxed ion-ios-close"></span>
		<div class="box-collapse-wrap form">
			<form class="form-a" method="get" action="${base }/search">
				<div class="row">
					<div class="col-md-12 mb-2">
						<div class="form-group">
							<label for="Type">Từ khóa</label>
							<input name="keyword" class="form-control form-control-lg form-control-a" placeholder="Từ khóa">
						</div>
					</div>
					<div class="col-md-6 mb-2">
						<div class="form-group">
							<label for="Type">LOẠI</label>
							<select name="title" class="form-control form-control-lg form-control-a" id="Type">
								<option></option>
								<c:forEach var="cate" items="${category }">
									<option>${cate.name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="col-md-6 mb-2">
						<div class="form-group">
							<label for="nam">Năm phát hành</label>
							<select name="year" class="form-control form-control-lg form-control-a" id="nam">
								<option></option>
								<option>2021</option>
								<option>2020</option>
								<option>2019</option>
							</select>
						</div>
					</div>
				    <div class="col-md-12">
						<button type="submit" class="btn btn-b">Tìm kiếm</button>
				    </div>
				</div>
			</form>
		</div>
	</div><!-- End Property Search Section -->