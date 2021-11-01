<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
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
											<li class="breadcrumb-item"><a href="#">Contact</a></li>
											<li class="breadcrumb-item active" aria-current="page">List Contacts</li>
										</ol>
									</nav>
								
								</div>
							</div>
							<div class="col-md-4">
								<form class="form-inline mt-1" action="${base }/admin/search" method="get">
									<input name="keyword" class="form-control mr-sm-2" type="search"
										placeholder="Search" aria-label="Search">
									<button class="btn btn-outline-success my-2 my-sm-0"
										type="submit">Tìm kiếm</button>
								</form>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="content">
									<c:forEach var="contact" items="${contacts }">
										<p>${contact.email }</p>
									</c:forEach>
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