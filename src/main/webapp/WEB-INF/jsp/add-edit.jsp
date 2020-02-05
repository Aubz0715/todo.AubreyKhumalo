<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equip="X-UA-Compatible" content="ie=edge">
    <title>${modeTitle} Todo</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
<h2>${modeTitle} Todo</h2>
<form:form action="${pageContext.request.contextPath}/todo/${mode}" method="post" modelAttribute="todo">
    <form:hidden path="id"/>
    <table>
        <tr>
            <td>
                <form:label path="title">Title</form:label>
            </td>
            <td>
                <form:input path="title" required="true"></form:input>
            </td>
            <td>
                <form:errors path="title"></form:errors>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="description">Description</form:label>
            </td>
            <td>
                <form:textarea path="description" cols="40" required="true
                " rows="25"></form:textarea>
            </td>
            <td>
                <form:errors path="description"></form:errors>
            </td>
        </tr>
        <tr>
            <td>
                <label>Actions</label>
            </td>
            <td>
                <form:button name="cancel">Cancel</form:button>
                &nbsp;
                <input type="submit" name="submit" value="Submit">
            </td>
        </tr>
    </table>
</form:form>
<script src="/js/bootstrap.bundle.min.js"></script>
<script src="/js/jquery-3.4.1.min.js"></script>
</body>
</html>
