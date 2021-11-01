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

	<div class="top bg-primary" style="height: 10vh;">
		<div class="row">
			<div class="offset-md-2 col-md-2">
				<a href="${base }/cart/view">
					<i class="fas fa-cart-plus"><div class="bg-light text-dark d-inline" id="total"> ${totalItems }</div></i>
					
				</a>
				
			</div>
		</div>
	</div>
	
	
	

	<div class="container" >
		<div class="row bg-warning message"></div>
		<sf:form method="post" action="${base }/cart/finish">
			<c:choose>
   				<c:when test="${isLogined }">
   					<div class="form-group">
						<label for="customerName">Customer Name</label>
						<input type="text" class="form-control" name="customerName" id="customerName"
							placeholder="${cart.user.username }" readonly="readonly" required="required"></input>
					</div>
					
					<div class="form-group">
						<label for="customerAddress">Customer Address</label>
						<input type="text" class="form-control" name="customerAddress" id="customerAddress"
							placeholder="Customer Address" required="required"></input>
					</div>
					<div class="form-group">
						<label for="customerEmail">Customer Email</label>
						<input type="email" class="form-control" name="customerEmail" id="customerEmail"
							placeholder="${cart.user.email }" readonly="readonly" required="required"></input>
					</div>
   				</c:when>
   				<c:otherwise>
   					<div class="form-group">
						<label for="customerName">Customer Name</label>
						<input type="text" class="form-control" name="customerName" id="customerName"
							placeholder="Customer Name" required="required"></input>
					</div>
					
					<div class="form-group">
						<label for="customerAddress">Customer Address</label>
						<input type="text" class="form-control" name="customerAddress" id="customerAddress"
							placeholder="Customer Address" required="required"></input>
					</div>
					<div class="form-group">
						<label for="customerEmail">Customer Email</label>
						<input type="email" class="form-control" name="customerEmail" id="customerEmail"
							placeholder="Customer Email" required="required"></input>
					</div>
   				
   				</c:otherwise>
   			</c:choose>
			
			<div class="form-group">
				<label for="customerEmail">Customer Email</label>
				<input type="email" class="form-control" name="customerEmail" id="customerEmail"
					placeholder="Customer Email" required="required"></input>
			</div>
			<div class="col-md-2">
				<button type="submit"
					class="form-control bg-primary text-white buy" value="">Mua hàng</button>
			</div>
		
		</sf:form>
		<table class="table table-striped text-white">
		  <thead>
		    <tr>
		      <th scope="col">Product Name</th>
		      <th scope="col">Quanlity</th>
		      <th scope="col">Prince</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach var="cartItems" items="${cart.cartItems }">
			    <tr class="">
			      <td>${cartItems.productName }</td>
			      <td>${cartItems.quanlity }</td>
			      <td>${cartItems.priceUnit }</td>
			    </tr>
		    </c:forEach>
		  </tbody>
		</table>
	</div>
		
	
	
    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
    <div id="preloader"></div>

    <!-- Javascript -->
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
	<script type="text/javascript">
	$(function(){
		$('.buy').onclick(function(){
			alert(${message });
		});
	})
	addToCart = function(productId, quanlity){
			// javascript object.
			// data la du lieu ma day len action cua controller
			let data = {
				productId : productId, // lay theo id
				quanlity : quanlity
			};

			// $ === jQuery
			// json == javascript object
			$.ajax({
				url : "/cart/add",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(data),

				dataType : "json", // kieu du lieu tra ve tu controller la json
				success : function(jsonResult) {
					total = jsonResult.totalItems;
					$("#total").html(total);
				},
				error : function(jqXhr, textStatus, errorMessage) { // error callback 

				}
			});
			
		}	
	
	</script>
	
</body>

</html>