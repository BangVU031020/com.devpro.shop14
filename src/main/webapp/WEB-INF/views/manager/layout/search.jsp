<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!-- directive cua JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="col-md-4">
	<form class="form-inline mt-1" action="${base }/manager/search" method="get">
		<input name="keyword" class="form-control mr-sm-2" type="search"
			placeholder="Search" aria-label="Search">
		<button class="btn btn-outline-success my-2 my-sm-0"
			type="submit">Tìm kiếm</button>
	</form>
</div>