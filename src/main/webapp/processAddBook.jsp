<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>

<%
request.setCharacterEncoding("UTF-8");

String bookId=request.getParameter("bookId");
String name=request.getParameter("name");
String unitPrice=request.getParameter("unitPrice");
String author=request.getParameter("author");
String publisher=request.getParameter("publisher");
String releaseDate=request.getParameter("releaseDate");
String description=request.getParameter("description");
String category=request.getParameter("category");
String unitsInStock=request.getParameter("unitsInStock");
String condition=request.getParameter("condition");

Integer price;
if(unitPrice == null || unitPrice.isEmpty())
	price=0;
else
	price=Integer.valueOf(unitPrice);

long stock;
if(unitsInStock == null || unitsInStock.isEmpty())
	stock=0;
else
	stock=Long.valueOf(unitsInStock);

BookRepository dao = BookRepository.getInstance();

Book newBook = new Book();
newBook.setBookId(bookId);
newBook.setName(name);
newBook.setUnitPrice(price);
newBook.setAuthor(author);
newBook.setPublisher(publisher);
newBook.setReleaseDate(releaseDate);
newBook.setDescription(description);
newBook.setCategory(category);
newBook.setUnitInStock(stock);
newBook.setCondition(condition);

dao.addBook(newBook);

System.out.println("새로운 도서가 추가되었습니다: " + newBook);

response.sendRedirect("books.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>