<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
							<form class="form-inline mt-1" action="${base }/admin/product" method="get">
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
								<sf:form method="POST" action="${base }/admin/add-product"
									modelAttribute="poduct" enctype="multipart/form-data">

									<sf:hidden path="id" />

									<div class="form-group">
										<label for="category">Category (Required)</label>
										<sf:select path="categories.id" class="form-control"
											id="category">
											<sf:options items="${categories }" itemValue="id"
												itemLabel="name" />
										</sf:select>
									</div>

									<div class="form-group">
										<label for="title">Title (Required)</label>
										<sf:input path="title" class="form-control" id="title"
											placeholder="Title" required="required"></sf:input>
									</div>
									
									<div class="form-group">
										<label for="price">Price (Required)</label>
										<sf:input path="price" class="form-control" id="price"
											placeholder="Price" required="required"></sf:input>
									</div>
									<div class="form-group">
										<label for="releaseDate">releaseDate (Required)</label>
										<sf:input type="text"  path="releaseDate" class="form-control" id="releaseDate" ></sf:input>
									</div>

									<div class="form-group">
										<label for="short-description">Short Description
											(Required)</label>
										<sf:textarea rows="4" path="shortDescription"
											class="form-control" id="short-description"
											placeholder="Short Description" required="required"></sf:textarea>
									</div>
									
									<script language="javascript">
										var editor = CKEDITOR.replace('short-description');
									</script>

									<div class="form-group">
										<label for="details">Details (Required)</label>
										<sf:textarea rows="4" path="details" class="form-control"
											id="details" required="required"></sf:textarea>
									</div>
										<script language="javascript">
											var editor = CKEDITOR.replace('details');
										</script>
									<div class="form-group">
										<label for="isHot">isHot</label>
										<sf:checkbox path="isHot" id="isHot"></sf:checkbox>
									</div>
									
									<div class="form-group">
										<label for="ep">Number of Ep</label>
										<sf:input type="text" path="ep" id="ep"></sf:input>
									</div>
									
									<div class="form-group">
										<label for="comment">Number of Comment</label>
										<sf:input type="text" path="comment" id="comment"></sf:input>
									</div>
									
									<div class="form-group">
										<label for="watch">Number of watch</label>
										<sf:input type="text" path="watch" id="watch"></sf:input>
									</div>

									<div class="form-group">
										<div class="col-md-12">
											<laber for="avatarUpload">Avatar</laber>
											<input id="avatarUpload" class="form-control-file"
												type="file" name="avatarUpload" multiple="multiple" />
										</div>
									</div>

									<div class="form-group">
										<div class="col-md-12">
											<laber for="pictureUpload">Picture(Mutiple)</laber>
											<input id="pictureUpload" class="form-control-file"
												type="file" name="pictureUpload" multiple="multiple" />
										</div>
									</div>

									<div class="row mt-3">
										<div class="col-md-2">
											<a href="${base }/admin/product"><button type="button"
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
	<script type="text/javascript">
	$( function() {
		    $( '#releaseDate' ).datepicker({ dateFormat: 'dd/mm/yy' });
	});
	</script>
	
</body>


</html>