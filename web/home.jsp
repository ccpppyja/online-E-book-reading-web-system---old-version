<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Online E-Book Reader</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            line-height: 1.6;
        }

        .navbar {
            background-color: #34495e;
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .navbar h1 {
            margin: 0;
            font-size: 1.8rem;
            font-weight: bold;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
            padding: 8px 15px;
            border: 1px solid transparent;
            transition: background-color 0.3s ease, transform 0.2s ease;
            font-size: 1rem;
            border-radius: 5px;
        }

        .nav-links a:hover {
            background-color: #2c3e50;
            transform: scale(1.05);
        }

        .welcome-section {
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            text-align: center;
            padding: 50px 20px;
            margin-bottom: 20px;
            border-radius: 0 0 15px 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .welcome-section h2 {
            font-size: 2.5rem;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .welcome-section p {
            font-size: 1.2rem;
            margin: 0;
        }

        .welcome-section button {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 1rem;
            color: white;
            background-color: #1abc9c;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .welcome-section button:hover {
            background-color: #16a085;
        }

        .search-bar {
            text-align: center;
            margin: 20px auto;
        }

        .search-bar input {
            padding: 12px 20px;
            width: 40%;
            max-width: 400px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            margin-right: 10px;
        }

        .search-bar button {
            padding: 12px 20px;
            font-size: 1rem;
            color: white;
            background-color: #2980b9;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .search-bar button:hover {
            background-color: #1e6f9f;
        }

        .all-books {
            text-align: center;
            margin: 30px auto;
        }

        .all-books a {
            display: inline-block;
            font-size: 1.2rem;
            color: white;
            text-decoration: none;
            background-color: #3498db;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .all-books a:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
<div class="navbar">
    <h1>Online E-Book Reader</h1>
    <div class="nav-links">
        <a href="my_space.jsp">My Space</a>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
    </div>
</div>

<div class="welcome-section">
    <h2>Welcome to the Online E-Book Reader</h2>
    <p>Your gateway to exploring thousands of books. Start your reading journey now!</p>
    <button onclick="location.href='register.jsp';">Join Now</button>
</div>

<div class="search-bar">
    <form action="${pageContext.request.contextPath}/BookSearchServlet" method="GET">
        <input type="text" name="keyword" placeholder="Search by title or author">
        <button type="submit">Search</button>
    </form>
</div>

<div class="all-books">
    <a href="${pageContext.request.contextPath}/all_books">Browse All Books</a>
</div>
</body>
</html>
