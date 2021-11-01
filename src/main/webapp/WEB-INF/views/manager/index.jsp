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
											<li class="breadcrumb-item"><a href="#">Home</a></li>
											<li class="breadcrumb-item active" aria-current="page">General</li>
										</ol>
									</nav>
								
								</div>
							</div>
							<jsp:include page="/WEB-INF/views/manager/layout/search.jsp"></jsp:include>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="content">
									General
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