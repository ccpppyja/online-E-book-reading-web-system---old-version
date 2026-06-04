<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Space</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        .navbar {
            background-color: #007bff;
            padding: 15px 0;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-size: 1.1rem;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .navbar a:hover {
            background-color: #0056b3;
        }

        .container {
            margin: 50px auto;
            max-width: 600px;
            padding: 20px;
            background: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            font-size: 2rem;
            color: #333;
        }

        @media (max-width: 600px) {
            .navbar {
                padding: 10px;
            }
            .container {
                margin: 20px;
                padding: 15px;
            }
        }

    </style>
</head>
<body>
<nav class="navbar">
    <a href="${pageContext.request.contextPath}/home.jsp">Home</a>
    <a href="${pageContext.request.contextPath}/list_bookmarks?userId=${user.id}">Bookmarks</a>
    <a href="${pageContext.request.contextPath}/reset_show?id=${user.id}">Reset</a>
    <a href="${pageContext.request.contextPath}/user_delete?id=${user.id}">Delete account</a>
</nav>
<div class="container">
    <h1>Welcome, ${user.username}!</h1>
    <p>Use the navigation bar above to manage.</p>
</div>
</body>
</html>
