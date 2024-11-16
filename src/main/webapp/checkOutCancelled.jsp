<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<html>
<head>
<title>주문 취소</title>
</head>
<body>

	<div class="container py-4">
		<%@ include file="menu.jsp"%>

		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5fw-bold">주문 취소</h1>
				<p class="com-md-8 fs-4">Order Cancellation</p>
			</div>
		</div>
		
		<div class="row align-items-md-stretch">
			<h2 class="alert alert-danger">주문이 취소되었습니다.</h2>
		</div>
		<div class="container">
			<p> <a href="./books.jsp" class="btn btn-secondary"> &laquo;도서 목록</a>
		</div>
		
		<%@ include file = "footer.jsp" %>
	</div>
</body>
</html>