<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Search Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .book-list {
            max-width: 900px;
            margin: 50px auto;
            background: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .book-list h1 {
            font-size: 2rem;
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

        .book-list p {
            font-size: 1rem;
            color: #666;
            text-align: center;
            margin: 10px 0;
        }

        .book {
            display: flex;
            align-items: center;
            margin: 15px 0;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background: #f9f9f9;
            transition: box-shadow 0.3s ease;
        }

        .book:hover {
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .book img {
            max-width: 120px;
            margin-right: 20px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .book h3 {
            font-size: 1.5rem;
            margin: 0 0 5px 0;
            color: #333;
        }

        .book p {
            font-size: 1rem;
            color: #555;
            margin: 5px 0;
        }

        .book a {
            display: inline-block;
            margin-top: 10px;
            padding: 8px 15px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            font-size: 0.9rem;
        }

        .book a:hover {
            background-color: #0056b3;
        }

        @media (max-width: 768px) {
            .book {
                flex-direction: column;
                align-items: flex-start;
            }

            .book img {
                margin-bottom: 10px;
            }

            .book-list {
                padding: 15px;
            }
        }

    </style>
</head>
<body>

<div class="book-list">
    <h1>Search Results</h1>

    <c:if test="${not empty msg}">
        <p>${msg}</p>
    </c:if>

    <c:if test="${not empty resultList}">
        <c:forEach var="book" items="${resultList}">
            <div class="book">
                <img src="${book.imageUrl}" alt="${book.title}" style="max-width: 150px;">
                <h3>${book.title}</h3>
                <p>Type: ${book.genre}</p>
                <p>Author: ${book.author}</p>
                <a href="${pageContext.request.contextPath}/book_details?id=${book.id}">Details</a>
            </div>
        </c:forEach>
    </c:if>

    <c:if test="${empty resultList}">
        <p>No books found.</p>
    </c:if>
</div>

</body>
</html>
