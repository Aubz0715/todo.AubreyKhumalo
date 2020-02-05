<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Todo List</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
     <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
<div class="jumbotron text-center">
  <h1>Todo Items</h1>
</div>
<button type="button"><a href="${pageContext.request.contextPath}/todo/create">New</a></button>
<table class="table">
    <thead>
    <tr>
        <td><label>Title</label></td>
        <td><label>Completed</label></td>
        <td><label>Action</label></td>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="todo" items="${todos}">
    <tr>
        <td>
            ${todo.title}
        </td>
        <td>
            ${todo.completed}
        </td>
        <td>
            <a href="${pageContext.request.contextPath}/todo/edit/${todo.id}">Edit</a>
            &nbsp;
            <a href="${pageContext.request.contextPath}/todo/complete/${todo.id}">Complete</a>
            &nbsp;
            <a href="${pageContext.request.contextPath}/todo/delete/${todo.id}">Delete</a>
        </td>
    </tr>
    </c:forEach>
</table>
<script src="/js/bootstrap.bundle.min.js"></script>
<script src="/js/jquery-3.4.1.min.js"></script>
</body>
</html>
