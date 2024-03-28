<%@page import="com.entity.DesignDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.DesignDAOImpl"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Designs</title>
<%@include file="allCss.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>

<c:if test="${empty userobj}">
<c:redirect url="../login.jsp"/>
</c:if>


<h3 class="text-center mt-3 p-2">Hello Admin</h3>
<c:if test="${not empty succMsg}">
<h5 class="text-center text-success">${succMsg}</h5>
<c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty failedMsg}">
<h5 class="text-center text-danger">${failedMsg}</h5>
<c:remove var="failedMsg" scope="session"/>
</c:if>

<table class="table table-striped ">
  <thead class="bg-primary text-white">
    <tr>
    <th scope="col">ID</th>
      <th scope="col">Image</th>
      <th scope="col">Plan Name</th>
      <th scope="col">Owner</th>
      <th scope="col">Price</th>
      <th scope="col">Categories</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
 <% 
 DesignDAOImpl dao=new DesignDAOImpl(DBConnect.getConn());
 List<DesignDtls> list=dao.getAllDesigns();
 int x =1;
 for(DesignDtls d:list){
 %>
  <tr>
      <td><%=x%></td>
      <td><img src="../Designs/<%=d.getPhotoName() %>" style="width:50px; height:50px;"></td>
      <td><%=d.getDesignName()%></td>
      <td><%=d.getDesigner()%></td>
      <td><%=d.getPrice()%></td>
      <td><%=d.getDesignCategory()%></td>
      <td><%=d.getStatus()%></td>

      <td>
      <a href="edit_designs.jsp?id=<%=d.getDesignId()%>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square pr-1"></i>Edit</a>
      <a href="../delete?id=<%=d.getDesignId() %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-can pr-1"></i>Delete</a>
      </td>
    </tr>
  <% x++;
  }
 %>
   
  </tbody>
</table>
<div style="margin-top:185px;">

</div>
</body>
</html>