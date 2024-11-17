<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
    <title>도서 정보</title>
    <script type="text/javascript">
        function addToCart(){
            if (confirm("도서를 장바구니에 추가하시겠습니까?")) {
                document.addForm.submit();
            } else {
                document.addForm.reset();
            }
        }
    </script>
</head>
<%
String id = request.getParameter("id");
%>
<body>
<div class="container py-4">
    <%@ include file="menu.jsp"%>

    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">도서정보</h1>
            <p class="col-md-8 fs-4">Book Information</p>
        </div>
    </div>

    <%@ include file="dbconn.jsp" %>
    <% 
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "SELECT * FROM book WHERE b_id = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    rs = pstmt.executeQuery();

    while (rs.next()) {
    %>
    <div class="row align-items-md-stretch">
        <div class="col-md-5">
            <img src="./resources/images/<%=rs.getString("b_filename") %>" style="width: 70%">
        </div>
        <div class="col-md-12">
            <h3><b><%=rs.getString("b_name") %></b></h3>
            <p><%=rs.getString("b_description") %></p>
            <p><b>도서코드 : </b><span class="badge text-bg-danger"><%=rs.getString("b_id") %></span></p>
            <p><b>저자</b> : <%=rs.getString("b_author") %></p>
            <p><b>출판사</b> : <%=rs.getString("b_publisher") %></p>
            <p><b>출판일</b> : <%=rs.getString("b_releaseDate") %></p>
            <p><b>분류</b> : <%=rs.getString("b_category") %></p>
            <p><b>재고수</b> : <%=rs.getInt("b_unitsInStock") %></p>
            <h4><%=rs.getString("b_unitPrice") %>원</h4>
            <form name="addForm" action="./addCart.jsp?id=<%=rs.getString("b_id") %>" method="post">
                <a href="#" class="btn btn-info" onclick="addToCart()">도서주문 &raquo;</a>
                <a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
                <a href="./books.jsp" class="btn btn-secondary">도서 목록 &raquo;</a>
            </form>
        </div>
    </div>
    <% 
    }
    if (rs!=null)
		rs.close();
	if (pstmt!=null)
		pstmt.close();
    %>

    <%@ include file="footer.jsp" %>
</div>
</body>
</html>
