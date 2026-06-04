<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Book</title>

  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f9f9f9;
      margin: 0;
      padding: 0;
    }

    .container {
      max-width: 600px;
      margin: 50px auto;
      background-color: #fff;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      padding: 20px 30px;
      border-radius: 8px;
    }

    h3 {
      text-align: center;
      margin-bottom: 20px;
      color: #333;
      font-size: 1.5rem;
    }

    .input {
      margin-bottom: 15px;
    }

    .input span {
      font-weight: bold;
      display: block;
      margin-bottom: 5px;
      color: #333;
    }

    .input input {
      width: 100%;
      padding: 10px;
      font-size: 1rem;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
    }

    .input input:focus {
      outline: none;
      border-color: #007bff;
      box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
    }

    .register-but input[type="submit"] {
      width: 100%;
      padding: 12px;
      font-size: 1.2rem;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .register-but input[type="submit"]:hover {
      background-color: #0056b3;
    }

    .alert {
      margin-top: 15px;
      padding: 10px;
      border-radius: 4px;
      font-size: 1rem;
    }

    .alert-danger {
      background-color: #f8d7da;
      color: #721c24;
      border: 1px solid #f5c6cb;
    }

    .alert-success {
      background-color: #d4edda;
      color: #155724;
      border: 1px solid #c3e6cb;
    }

    @media (max-width: 768px) {
      .container {
        padding: 15px;
      }

      h3 {
        font-size: 1.2rem;
      }
    }

  </style>

</head>
<body>
<div class="book">
  <div class="container">
    <div class="add-book">
      <form action="${pageContext.request.contextPath}/add_book" method="post">
        <div class="add-book-top-grid">
          <h3>Add book</h3>
          <div class="input">
            <span>title <label style="color: red;">*</label> </span>
            <input type="text" name="title" placeholder="input the book title" required="required">
          </div>
          <div class="input">
            <span>author </span>
            <input type="text" name="author" placeholder="input the book author">
          </div>
          <div class="input">
            <span>genre </span>
            <input type="text" name="genre" placeholder="input the book genre">
          </div>
          <div class="input">
            <span>publish date </span>
            <input type="text" name="publishDate" placeholder="input the book publish date">
          </div>
          <div class="input">
            <span>description </span>
            <input type="text" name="description" placeholder="input the book description">
          </div>
          <div class="input">
            <span>fileUrl <label style="color: red;">*</label> </span>
            <input type="text" name="fileUrl" placeholder="input the book file url" required="required">
          </div>
          <div class="input">
            <span>imageUrl </span>
            <input type="text" name="imageUrl" placeholder="input the book image url">
          </div>

        </div>
        <div class="register-but text-center">
          <input name="add book" type="submit" value="add book">
        </div>

        <c:if test="${failMsg}">
          <div class="alert alert-danger"><p>${failMsg}</p></div>
        </c:if>

        <c:if test="${successMsg}">
          <div class="alert alert-success">Registration successful! Redirecting...</div>
        </c:if>
      </form>
    </div>
  </div>
</div>
</body>
</html>
