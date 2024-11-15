<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.sql.*" %>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel = "stylesheet" href ="./resources/css/bootstrap.min.css" />
<title>도서수정</title>
</head>
<body>
<div class="container py-4">
	<%@ include file = "menu.jsp" %>
	
	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">도서 수정</h1>
			<p class="col-md-8 fs-4">Book Updating</p>
		</div>
	</div>
	<%@ include file="dbconn.jsp" %>
	<%
	String bookId = request.getParameter("id");
	if (bookId == null || bookId.isEmpty()) {
	    out.println("책 ID가 제공되지 않았습니다.");
	    return;
	}
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "SELECT * FROM book WHERE b_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, bookId);
	rs = pstmt.executeQuery();
	if (rs.next()) {
	%>
	<div class="row align-items-md-stretch">
		<div class="col-md-4">
		<img src="./resources/images/<%=rs.getString("b_filename") %>" alt=image style = "width: 100%" />
		</div>
		<div class="col-md-7">
			<form name="newBook" action="./processUpdateBook.jsp" method="post" enctype="multipart/form-data">
			<div class="mb-3 row">
					<label class="col-sm-2">도서코드</label>
					<div class="col-sm-5">
						<input type="text" id="bookId" name="bookId" class="form-control" value='<%=rs.getString("b_id")%>'>
					</div>
				</div>

				<div class="mb-3 row">
					<label class="col-sm-2">도서명</label>
					<div class="col-sm-5">
						<input type="text" id="name" name="name" class="form-control" value='<%=rs.getString("b_name")%>'>
					</div>
				</div>

				<div class="mb-3 row">
					<label class="col-sm-2">가격</label>
					<div class="col-sm-5">
						<input type="text" id="unitPrice" name="unitPrice" class="form-control" value='<%=rs.getString("b_unitPrice")%>'>
					</div>
				</div>

				<div class="mb-3 row">
					<label class="col-sm-2">저자</label>
					<div class="col-sm-5">
						<input type="text" name="author" class="form-control" value='<%= rs.getString("b_author") %>'>
					</div>
				</div>

				<div class="mb-3 row">
					<label class="col-sm-2">출판사</label>
					<div class="col-sm-5">
						<input type="text" name="publisher" class="form-control" value='<%=rs.getString("b_publisher")%>'>
					</div>
				</div>

				<div class="mb-3 row">
					<label class="col-sm-2">출판일</label>
					<div class="col-sm-5">
						<input type="text" name="releaseDate" class="form-control" value='<%=rs.getString("b_releaseDate")%>'>
					</div>
				</div>

				<div class="mb-3 row">
					<label class="col-sm-2">상세정보</label>
					<div class="col-sm-5">
						<textarea id="description" name="description" cols="50" rows="2"
							class="form-control" placeholder="100자 이상 적어주세요"><%=rs.getString("b_description")%></textarea>
					</div>
				</div>

				<div class="mb-3 row">
					<label class="col-sm-2">분류</label>
					<div class="col-sm-5">
						<input type="text" name="category" class="form-control" value='<%=rs.getString("b_category")%>'>
					</div>
				</div>

				<div class="mb-3 row">
					<label class="col-sm-2">재고수</label>
					<div class="col-sm-5">
						<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" value='<%=rs.getString("b_unitsInStock")%>'>
					</div>
				</div>

				<div class="mb-3 row">
					<label class="col-sm-2">상태</label>
					<div class="col-sm-8">
						<input type="radio" name="condition" value="New">신규도서
						<input type="radio" name="condition" value="Old">중고도서
						<input type="radio" name="condition" value="EBook">E-Book
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2">이미지</label>
					<div class="col-sm-8">
						<input type="file" name="BookImage" class="form-control">
					</div>
				</div>
				<div class="mb-3 row">
					<div class="offset-sm-2 col-sm-10">
						<input type="submit" class="btn btn-primary" value="등록">
					</div>
				</div>
			</form>
		</div>
		<%
			}
			if (rs!=null)
				rs.close();
			if (pstmt!=null)
				pstmt.close();
			if (conn!=null)
				conn.close();
		%>
	</div>
	<%@ include file="footer.jsp" %>
</div>
</body>
</html>