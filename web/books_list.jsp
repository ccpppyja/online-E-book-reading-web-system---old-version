<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Books</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
        }

        .book-list {
            max-width: 800px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .book-list h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .books-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .book-item {
            background: #f4f4f4;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .book-item h3 {
            font-size: 1.2rem;
            margin-bottom: 10px;
            color: #333;
        }

        .book-item p {
            margin: 5px 0;
            color: #666;
        }

        .actions {
            margin-top: 10px;
        }

        .btn {
            display: inline-block;
            padding: 10px 15px;
            font-size: 0.9rem;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin: 5px;
            transition: background-color 0.3s ease;
        }

        .delete-btn {
            background-color: #dc3545;
        }

        .delete-btn:hover {
            background-color: #b02a37;
        }

        .edit-btn {
            background-color: #007bff;
        }

        .edit-btn:hover {
            background-color: #0056b3;
        }

        .no-books {
            text-align: center;
            color: #666;
            font-size: 1.2rem;
            margin-top: 20px;
        }

    </style>
</head>
<body>

<div class="book-list">
    <h2>Manage Books</h2>
    <c:if test="${not empty books}">
        <section class="books-container">
            <c:forEach var="book" items="${books}">
                <article class="book-item">
                    <h3>${book.title}</h3>
                    <p>Genre: ${book.genre}</p>
                    <p>Author: ${book.author}</p>
                    <div class="actions">
                        <a class="btn delete-btn"
                           href="${pageContext.request.contextPath}/books_delete?id=${book.id}">
                            Delete Book
                        </a>
                        <a class="btn edit-btn"
                           href="${pageContext.request.contextPath}/book_edit_show?id=${book.id}">
                            Edit Book
                        </a>
                    </div>
                </article>
            </c:forEach>
        </section>
    </c:if>
    <c:if test="${empty books}">
        <p class="no-books">No books available</p>
    </c:if>
</div>

</body>
</html>
