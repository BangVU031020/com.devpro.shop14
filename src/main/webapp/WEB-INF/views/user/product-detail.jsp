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

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Product</title>
    <meta content="" name="description">
    <meta content="" name="keywords">


   	<!-- font -->
   	<jsp:include page="/WEB-INF/views/user/layout/font.jsp"></jsp:include>
	<!-- Variable -->
	<jsp:include page="/WEB-INF/views/common/variable.jsp"></jsp:include>
    <!-- CSS -->
	<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>
 
</head>

<body>

	<div class="top bg-primary" style="height: 10vh;"></div>

	<div class="container" >
		<div class="row bg-light">
			
			<div class="col-md-5">
				<img alt="" src="${base }/upload/${product.avatar }" style="width: 300px; height: 400px;">
			</div>
			<div class="col-md-7">
				<h2 class="Title" style="font-weight: bold;">${product.title }</h2>
				<h3 class="Title" style="color: red">${product.priceSale }</h3>
				<p class="shortDescription">${product.shortDescription }</p>
				<a href="#" class="btn btn-primary">Add to cart</a>
			</div>
			<div class="col-md-12 detail border-top-1">
				<h4>${product.details }</h4>
				
			</div>
			
		</div>
		
		
	
	</div>
	
	
    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
    <div id="preloader"></div>

    <!-- Javascript -->
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
</body>

</html>