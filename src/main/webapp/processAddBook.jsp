<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>

<%
request.setCharacterEncoding("UTF-8");

// 파일 업로드 설정
String realFolder = application.getRealPath("/resources/images");
int maxSize = 5 * 1024 * 1024; // 5MB 제한
String encType = "utf-8";

MultipartRequest multi = null;
String fileName = null;

try {
    multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
    fileName = multi.getFilesystemName("BookImage");

    // 폼 데이터 가져오기
    String bookId = multi.getParameter("bookId");
    String name = multi.getParameter("name");
    String unitPrice = multi.getParameter("unitPrice");
    String author = multi.getParameter("author");
    String publisher = multi.getParameter("publisher");
    String releaseDate = multi.getParameter("releaseDate");
    String description = multi.getParameter("description");
    String category = multi.getParameter("category");
    String unitsInStock = multi.getParameter("unitsInStock");
    String condition = multi.getParameter("condition");

    // 기본값 설정 및 데이터 변환
    int price = (unitPrice == null || unitPrice.isEmpty()) ? 0 : Integer.parseInt(unitPrice);
    long stock = (unitsInStock == null || unitsInStock.isEmpty()) ? 0 : Long.parseLong(unitsInStock);

    // 데이터베이스에 삽입
    String sql = "INSERT INTO book (b_id, b_name, b_unitPrice, b_author, b_publisher, b_releaseDate, " +
                 "b_description, b_category, b_unitsInStock, b_condition, b_fileName) " +
                 "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, bookId);
    pstmt.setString(2, name);
    pstmt.setInt(3, price);
    pstmt.setString(4, author);
    pstmt.setString(5, publisher);
    pstmt.setString(6, releaseDate);
    pstmt.setString(7, description);
    pstmt.setString(8, category);
    pstmt.setLong(9, stock);
    pstmt.setString(10, condition);
    pstmt.setString(11, fileName);

    int result = pstmt.executeUpdate();

    if (result > 0) {
        response.sendRedirect("books.jsp");
    } else {
        out.println("<script>alert('도서 등록에 실패했습니다.'); history.back();</script>");
    }

    pstmt.close();
} catch (Exception e) {
    e.printStackTrace();
    out.println("<script>alert('오류 발생: " + e.getMessage() + "'); history.back();</script>");
} finally {
    if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
}
%>
