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
<html>
<head>
<jsp:include page="/WEB-INF/views/manager/layout/title.jsp"></jsp:include>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- css -->
<jsp:include page="/WEB-INF/views/manager/layout/css.jsp"></jsp:include>



</head>
<body>
	<div class="container-fluid">

		<!-- logo -->
		<jsp:include page="/WEB-INF/views/manager/layout/logo.jsp"></jsp:include>

		<div class="row mt-3">

			<!-- menu -->
			<jsp:include page="/WEB-INF/views/manager/layout/menu.jsp"></jsp:include>

			<div class="col-md-10">
				<div class="view bg-light text-dark">
					<div class="row">
						<div class="col-md-8">
							<div class="title">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a
											href="${base }/admin/product">Product</a></li>
										<li class="breadcrumb-item active" aria-current="page">${nameAction }</li>
									</ol>
								</nav>

							</div>
						</div>
						<div class="col-md-4">
							<form class="form-inline mt-1" action="${base }/adminr/product" method="get">
								<input name="keyword" class="form-control mr-sm-2" type="search"
									placeholder="Search" aria-label="Search">
								<button class="btn btn-outline-success my-2 my-sm-0"
									type="submit">Tìm kiếm</button>
							</form>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="content ml-3">
								<h1>${nameAction }</h1>
								<sf:form method="POST" action="${base }/admin/edit-sale-order"
									modelAttribute="saleOrder" enctype="multipart/form-data">

									<sf:hidden path="id" />

									<div class="form-group">
										<table class="tblview table table-striped">
											<tr>
												<th>Tên Danh mục</th>
												<th>Tên Sản phầm</th>
												<th>Giá</th>
												<th>Số lượng</th>
												<th>Avatar</th>
												<th>ID</th>
											</tr>
											<c:forEach var="saleProduct" items="${saleProducts }">
												<tr style="border-top: 1px solid #ddd !important; border-left: 1px solid #ddd !important; font-size: 13px;" >
													<td class="NAME" >${saleProduct.product.categories.name }</td>
													<td class="NAME" >${saleProduct.product.title }</td>
													<td class ="PRINCE" >${saleProduct.product.price }</td>
													<td class ="PRINCE" >${saleProduct.quality }</td>
													<td>
														<img alt="" src="${base }/upload/${saleProduct.product.avatar }" />
													</td>
													<td class ="ID" >${saleProduct.product.id }</td>
												</tr>
											</c:forEach>
										</table>
									</div>

									<div class="row mt-3">
										<div class="col-md-2">
											<a href="${base }/admin/sale-order?page=1"><button type="button"
												class="form-control bg-secondary text-white" value="">Back
												to list</button></a>
										</div>
										<div class="col-md-2">
											<button type="submit"
												class="form-control bg-primary text-white" value="">${nameAction }</button>
										</div>
									</div>

								</sf:form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- footer -->
		<jsp:include page="/WEB-INF/views/manager/layout/footer.jsp"></jsp:include>
	</div>
	<!-- Javascript -->
	<jsp:include page="/WEB-INF/views/manager/layout/js.jsp"></jsp:include>

</body>


</html>