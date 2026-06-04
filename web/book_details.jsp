<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book Details</title>
    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .book-list {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .book img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .book h2 {
            font-size: 28px;
            margin-bottom: 10px;
            color: #007bff;
        }

        .book p {
            font-size: 16px;
            margin: 10px 0;
            color: #555;
        }

        .book a {
            display: inline-block;
            margin: 10px 10px;
            padding: 10px 15px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            font-size: 14px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .book a:hover {
            background-color: #0056b3;
        }

        .message {
            margin-top: 20px;
            font-size: 16px;
            color: green;
        }

        .book-list p {
            font-size: 16px;
            color: #888;
        }


    </style>
</head>
<body>

<div class="book-list">
    <h1>Book Details</h1>

    <c:if test="${not empty book}">
        <div class="book">
            <img src="${book.imageUrl}" alt="${book.title}">
            <h2>${book.title}</h2>
            <p><strong>Genre: ${book.genre}</strong></p>
            <p><strong>Author: ${book.author}</strong></p>
            <p><strong>Publish Date: ${book.publishDate}</strong></p>
            <p><strong>Description: </strong>${book.description}</p>
            <a href="${pageContext.request.contextPath}/book_reading?bookId=${book.id}">Start Reading</a>
            <a href="${pageContext.request.contextPath}/add_bookmarks?bookId=${book.id}">Add Bookmark</a>
        </div>

        <c:if test="${not empty result}">
            <p class="message">${result}</p>
        </c:if>
    </c:if>

    <c:if test="${empty book}">
        <p>Book details are not available.</p>
    </c:if>

</div>

</body>
</html>
