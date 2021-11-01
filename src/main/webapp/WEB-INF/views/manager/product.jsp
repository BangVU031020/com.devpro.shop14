<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- directive cua JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">

<html>
	<head>
		<jsp:include page="/WEB-INF/views/manager/layout/title.jsp"></jsp:include>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
											<li class="breadcrumb-item"><a href="${base }/admin/product?page=1">Product</a></li>
											<li class="breadcrumb-item active" aria-current="page">List Product</li>
										</ol>
									</nav>
								
								</div>
							</div>
							<div class="col-md-4">
								<form class="form-inline mt-1" action="${base }/admin/product" method="get">
									<input name="keyword" class="form-control mr-sm-2" type="search"
										placeholder="Search" aria-label="Search" value="${keyword }">
									<input name="page" class="form-control mr-sm-2 d-none" type="search"
										placeholder="Search" aria-label="Search" value="1">
									<button class="btn btn-outline-success my-2 my-sm-0"
										type="submit">Tìm kiếm</button>
								</form>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12"><h3><a href="${base }/admin/add-product">Add New Product</a></h3></div>
							<div class="col-md-12">
								<div class="content">
									<div>
										<table class="tblview table table-striped">
											<tr>
												<th>Tên Danh mục</th>
												<th>Tên Sản phầm</th>
												<th>Miêu tả</th>
												<th>Đánh giá sao </th>
												<th>Nổi bật</th>
												<th>Ngày ra mắt</th>
												<th>Avatar</th>
												<th colspan=2 >Thực hiện</th>
												<th>ID</th>
											</tr>
											<c:forEach var="product" items="${products }">
												<tr style="border-top: 1px solid #ddd !important; border-left: 1px solid #ddd !important; font-size: 13px;" >
													<td class="NAME" >${product.categories.name }</td>
													<td class="NAME" >${product.title }</td>
													<td class ="DSC" >${product.shortDescription }</td>
													<td class ="PRINCE" >${product.price }</td>
													<td class ="STATUS" >${product.isHot }</td>
													<td class ="STATUS" >${product.releaseDate }</td>
													<td>
														<img alt="" src="${base }/upload/${product.avatar }" />
													</td>
													<td class="ED" ><a href="${base }/admin/edit-product/${product.id }"><i class="fas fa-edit"></i></a></td>
													<td class="ED" ><a href="javascript:confirmDel('${base }/admin/del-product/${product.id }'); void(0);" ><i class="fas fa-trash"></i></a></td>
													<td class ="ID" >${product.id }</td>
												</tr>
											</c:forEach>
										</table>
									</div>
									<div class="nav mt-3 d-flex justify-content-center" id="nav">
										<nav aria-label="Page navigation example d-flex justify-content-center">
											<ul class="pagination">
												<li class="page-item"><a class="page-link previous" href="${base }/admin/product?page=${pagePrevious }&keyword=${keyword }">Previous</a></li>
												<li class="page-item"><a class="page-link next" href="${base }/admin/product?page=${pageNext }&keyword=${keyword }">Next</a></li>
											</ul>
										</nav>
									</div>
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
	<script type="text/javascript">
		function confirmDel(url) {
			var message = "Bạn có thực sự muốn xóa Sản phẩm này?";
			if (window.confirm(message)) {
				window.location.href = url;
			} else {
				return false;
			}
		}
	</script>
	</body>


</html>