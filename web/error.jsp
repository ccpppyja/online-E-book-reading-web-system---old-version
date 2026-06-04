<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fdf2f2;
            margin: 0;
            padding: 0;
            text-align: center;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        body > div {
            background-color: #fff;
            padding: 30px 50px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border: 2px solid #f5c6cb;
        }

        h1 {
            color: #dc3545;
            font-size: 36px;
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            color: #555;
            line-height: 1.5;
        }

    </style>
</head>
<body>
<body>
<div>
    <h1>Error</h1>
    <p>${error}</p>
</div>
</body>
</body>
</html>
