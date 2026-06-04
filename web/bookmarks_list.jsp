<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Bookmarks</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f9f9f9;
      margin: 0;
      padding: 20px;
    }

    .container {
      max-width: 800px;
      margin: 0 auto;
      background: #fff;
      padding: 20px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
    }

    .table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    .table th, .table td {
      border: 1px solid #ddd;
      padding: 10px;
      text-align: left;
    }

    .table th {
      background-color: #007bff;
      color: white;
      text-transform: uppercase;
    }

    .table tbody tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    .table tbody tr:hover {
      background-color: #f1f1f1;
    }

    .text-center {
      text-align: center;
      color: #666;
    }

    .btn {
      display: inline-block;
      padding: 8px 12px;
      font-size: 0.9rem;
      color: white;
      background-color: #007bff;
      text-decoration: none;
      border-radius: 4px;
      transition: background-color 0.3s ease;
    }

    .btn:hover {
      background-color: #0056b3;
    }

    .delete-btn {
      background-color: #dc3545;
    }

    .delete-btn:hover {
      background-color: #b02a37;
    }

  </style>
</head>
<body>
<div class="container">
  <h2>Bookmarks List</h2>
  <table class="table">
    <thead>
    <tr>
      <th width="30%">Number</th>
      <th width="40%">Title</th>
      <th width="30%">Action</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${not empty bookmarks}">
      <c:forEach items="${bookmarks}" var="bookmark" varStatus="s">
        <tr>
          <td>${s.count}</td>
          <td>${bookmark.title}</td>
          <td>
            <a class="btn delete-btn"
               href="${pageContext.request.contextPath}/delete_bookmarks?id=${bookmark.id}">
              Delete Bookmark
            </a>
          </td>
        </tr>
      </c:forEach>
    </c:if>
    <c:if test="${empty bookmarks}">
      <tr>
        <td colspan="3" class="text-center">No bookmarks available</td>
      </tr>
    </c:if>
    </tbody>
  </table>
</div>
</body>
</html>
