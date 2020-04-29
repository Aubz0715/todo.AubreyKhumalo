<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <title> Todo List </title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
         <link rel="stylesheet" type="text/css" href="/css/style.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/nav-bar.jsp"/>
<div class="container">
    <div class="row ">

            <h3><center>ToDo List</center></h3>

    </div>
    <table class="table table-striped">
        <thead>
        <tr>
<center>
            <th scope="col"><label>List</label></th>
            <th scope="col"><label>Completed</label></th>
            <th scope="col"><label>Action</label></th>
            <th scope="col"><label>Type</label></th>
            </center>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="todo" items="${todos}">
        <tr>
            <th scope="row">${todo.id}</th>
            <td>
                    ${todo.title}
            </td>
            <td>
                    ${todo.completed}
            </td>
            <td>
                <div class="btn-group" role="group" aria-label="Basic example">
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/todo/edit/${todo.id}">Edit</a>
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/todo/complete/${todo.id}">Complete</a>
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/todo/delete/${todo.id}">Delete</a>
                </div>
            </td>
        </tr>
        </c:forEach>
    </table>
    <script src="/js/bootstrap.bundle.min.js"></script>
    <script src="/js/jquery-3.4.1.min.js"></script>
</div>
</body>
</html>