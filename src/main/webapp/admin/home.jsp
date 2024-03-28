<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Home</title>
<%@include file="allCss.jsp" %>
<style type="text/css"> 
a{
text-decoration: none;
color: black;
}
a:hover{
text-decoration: none;
color: black;
}


</style>
</head>
<body>
<%@include file="navbar.jsp" %>

<c:if test="${empty userobj}">
<c:redirect url="../login.jsp"/>
</c:if>
 
<div class="container">
<div class="row p-6">
<div class="col-md-4">
<a href="add_designs.jsp">
<div class="card">
<div class="card-body text-center">
<i class="fa-solid fa-user-plus fa-3x text-primary"></i><br>
<h4>Add Plan</h4>

</div>
</div>
</a>
</div>


<div class="col-md-4">
<a href="all_designs.jsp">
<div class="card">
<div class="card-body text-center">
<i class="fa-solid fa-wifi fa-3x text-primary"></i><br>
<h4>All Plan</h4>
</div>
</div>
</a>
</div>

<div class="col-md-4">
<a href="requests.jsp">
<div class="card">
<div class="card-body text-center">
<i class="fa-solid fa-list fa-3x text-warning"></i><br>
<h4>Requests</h4>
</div>
</div>
</a>
</div>

</a>
</div>
</div>
</div>
<!-- Modal -->


<!-- end logout modal -->

<div style="margin-top:211px;">

</div>
</body>
</html>