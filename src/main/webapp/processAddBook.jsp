<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>

<%
request.setCharacterEncoding("UTF-8");

String filename="";
String realFolder = "C:\\Users\\bluez\\eclipse-workspace\\BookMarket\\src\\main\\webapp\\resources\\images";
int maxSize = 5 * 1024 * 1024;
String encType = "utf-8";

MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

String bookId=multi.getParameter("bookId");
String name=multi.getParameter("name");
String unitPrice=multi.getParameter("unitPrice");
String author=multi.getParameter("author");
String publisher=multi.getParameter("publisher");
String releaseDate=multi.getParameter("releaseDate");
String description=multi.getParameter("description");
String category=multi.getParameter("category");
String unitsInStock=multi.getParameter("unitsInStock");
String condition=multi.getParameter("condition");

Enumeration files = multi.getFileNames();
String fname = (String) files.nextElement();
String fileName = multi.getFilesystemName(fname);

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
newBook.setFilename(fileName);

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