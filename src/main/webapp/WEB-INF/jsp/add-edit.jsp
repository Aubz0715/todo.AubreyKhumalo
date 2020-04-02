<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
           <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
           <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
           <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
           <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <title>${modeTitle} Todo</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="/css/style.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<style type="text/css">
body {
    background-image:url("/images/2881367.jpg");
    background-repeat:no-repeat;
    background-size: cover;
    text-align: center;
    font-size:100&#37;;
    margin:0;
    padding:0;
}
.navbar
{
background-color: purple !important;
navbar:center;
font-family:  Brush Script MT, Brush Script Std, cursive;
font-size: 100%;
}
.topnav-centered  {
  float: none;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
</style>

<jsp:include page="/WEB-INF/jsp/nav-bar.jsp"/>
<div class="container col-9">
    <form:form action="${pageContext.request.contextPath}/todo/${mode}" method="post" modelAttribute="todo">
        <form:hidden path="id"/>

            <div class="container ">
                <h4>${modeTitle} New Schedule</h4>

        </div>
        <div class="form-group offset-1 col-10">
            <form:label path="title">Schedule Title:</form:label>
            <div class="row justify-content-start">
                <form:input class="form-control" path="title"></form:input>
            </div>
            <div class="row justify-content-end">
                <form:errors class="alert alert-danger " role="alert" path="title"></form:errors>
            </div>
        </div>
        <div class="form-group offset-1 col-10">
            <form:label path="description">Description </form:label>
            <div class="row justify-content-start">
                <form:textarea class="form-control" path="description" cols="60" rows="10"></form:textarea>
            </div>
            <div class="row justify-content-end">
                <form:errors class="alert alert-danger" role="alert" path="description"></form:errors>
            </div>
        </div>
        <div class="row offset-1 col-10">
            <input class="btn btn-primary" type="submit" name="submit" value="Submit">
            <form:button class="btn btn-secondary" name="cancel">Cancel</form:button>
        </div>
    </form:form>
</div>
</body>
</html>
