<%@page import="com.entity.Design_Request"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.DesignRequestImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Requests</title>
<%@include file="allCss.jsp" %>
</head>
<body>
<c:if test="${empty userobj}">
<c:redirect url="../login.jsp"/>
</c:if>
<%@include file="navbar.jsp" %>
<h3 class="text-center mt-3 p-2">Hello Admin</h3>
<table class="table table-striped ">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col"> Request Id</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>
      <th scope="col">Phone No</th>
      <th scope="col">Plan Name</th>
      <th scope="col">Owner</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
    </tr>
  </thead>
  <tbody>
  <%
  DesignRequestImpl dao=new DesignRequestImpl(DBConnect.getConn());
  List<Design_Request> dlist=dao.getAllRequest();
  for(Design_Request d:dlist)
  { %>
	 <tr>
      <th scope="row"><%=d.getRequestId() %></th>
      <td><%=d.getUserName() %></td>
      <td><%=d.getEmail() %></td>
      <td><%=d.getFulladd() %></td>
      <td><%=d.getPhno() %></td>
      <td><%=d.getDesignName() %></td>
      <td><%=d.getDesigner() %></td>
      <td><%=d.getPrice() %></td>
      <td><%=d.getPaymentType() %></td>
    </tr>  
   <%}
  %>
   

   
  </tbody>
</table>
<div style="margin-top:188px;">

</div>
</body>
</html>