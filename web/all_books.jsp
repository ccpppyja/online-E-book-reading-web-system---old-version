<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Books</title>

  <style>

    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f9f9f9;
    }

    h2 {
      text-align: center;
      color: #333;
      margin: 20px 0;
    }

    .book-list {
      max-width: 1200px;
      margin: 0 auto;
      padding: 20px;
      background-color: #fff;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
    }

    .book {
      display: inline-block;
      width: 220px;
      margin: 15px;
      padding: 15px;
      background-color: #f1f1f1;
      border-radius: 8px;
      text-align: center;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      transition: transform 0.2s, box-shadow 0.2s;
    }

    .book:hover {
      transform: translateY(-5px);
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    }

    .book img {
      width: 100%;
      height: auto;
      border-radius: 5px;
      margin-bottom: 10px;
    }

    .book h3 {
      font-size: 18px;
      color: #444;
      margin: 10px 0;
    }

    .book p {
      font-size: 14px;
      color: #666;
      margin: 5px 0;
    }

    .book a {
      display: inline-block;
      margin-top: 10px;
      padding: 8px 12px;
      font-size: 14px;
      color: #fff;
      background-color: #007bff;
      text-decoration: none;
      border-radius: 5px;
      transition: background-color 0.2s;
    }

    .book a:hover {
      background-color: #0056b3;
    }

    @media (max-width: 768px) {
      .book {
        width: 100%;
        margin: 10px 0;
      }
    }

    .pagination-container {
      display: inline-block;
      text-align: center;
      margin: 0 auto;
      padding: 10px;
      background-color: #f9f9f9;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .pagination-container a {
      display: inline-block;
      margin: 5px;
      padding: 8px 12px;
      font-size: 14px;
      font-weight: bold;
      color: #fff;
      background-color: #007bff;
      text-decoration: none;
      border-radius: 5px;
      transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .pagination-container a:hover {
      background-color: #0056b3;
      transform: scale(1.05);
    }

    .pagination-container a[disabled],
    .pagination-container a.disabled {
      background-color: #ccc;
      color: #666;
      cursor: not-allowed;
      pointer-events: none;
    }

    .pagination-container input.form-control {
      display: inline-block;
      width: 50px;
      padding: 5px;
      margin-left: 5px;
      border: 1px solid #ddd;
      border-radius: 5px;
      text-align: center;
    }

    div[style="text-align: center;"] {
      text-align: center;
      margin-top: 20px;
    }


    .pagination {
      text-align: center;
      margin: 20px 0;
    }

    .pagination-container h3 {
      display: inline-block;
      margin: 0 10px;
      font-size: 16px;
      color: #333;
    }

    .pagination-container a.btn-info {
      display: inline-block;
      padding: 8px 12px;
      font-size: 14px;
      font-weight: bold;
      color: #fff;
      background-color: #28a745;
      border-radius: 5px;
      cursor: pointer;
      text-decoration: none;
    }

    .pagination-container a.btn-info:hover {
      background-color: #218838;
      transform: scale(1.05);
    }


  </style>

</head>
<body>
<div class="book-list">
  <h2>All Books</h2>

  <c:forEach var="book" items="${page.content}">
    <div class="book">
      <img src="${book.imageUrl}" alt="${book.title}">
      <h3>${book.title}</h3>
      <p>Type: ${book.genre}</p>
      <p>Author: ${book.author}</p>
      <a href="${pageContext.request.contextPath}/book_details?id=${book.id}">details</a>
    </div>
  </c:forEach>

</div>
<div style="text-align: center">
  <jsp:include page="page.jsp">
    <jsp:param name="url" value="${pageContext.request.contextPath}/all_books"/>
    <jsp:param name="param" value=""/>
  </jsp:include>
</div>

</body>
</html>
