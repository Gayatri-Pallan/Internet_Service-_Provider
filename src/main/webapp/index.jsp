<%@page import="com.entity.User"%>
<%@page import="com.entity.DesignDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.DesignDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Internet Service Provider</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">

</style>
</head>
<body>

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>
	


	<!-- Start Recent Designs -->
	
	
	<div class="container">
		<h3 class="text-center"
			style="padding-top: 10vh; color: #1a2882; margin-bottom: revert;">
			Internet Plans</h3>
		<div class="row">
			<%
			DesignDAOImpl dao2 = new DesignDAOImpl(DBConnect.getConn());
			List<DesignDtls> list2 = dao2.getRecentDesign();
			for (DesignDtls d : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Images/<%=d.getPhotoName()%>"
							style="width: 210px; height: 200px" class="-thumblin">
						<p><%=d.getDesignName()%></p>
						<p>
							Owner:
							<%=d.getDesigner()%></p>
						<p>
							<%
							if (d.getDesignCategory().equals("Old")) {
							%>Type:
							<%=d.getDesignCategory()%></p>
						<div class="row ">
							<a href="view_designs.jsp?designid=<%=d.getDesignId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign pr-1"></i><%=d.getPrice()%></a>
						</div>
						<%
						} else {
						%>
						Type:
						<%=d.getDesignCategory()%></p>
						<div class="row ml-4">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Buy Plan</a>
							<%
							} else {
							%>
							
							<a href="all_new_plans.jsp"
								class="btn btn-danger btn-sm  "><i class="fa-solid fa-cart-shopping"></i>Buy Plan</a>

							<%
							}
							%>
						
						
						 <a href="" class="btn btn-success btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i><%=d.getPrice()%></a>
						</div>
						<%
						}
						%>

					</div>
				</div>
			</div>
			<%
			}
			%>



		</div>

	</div>
	
	
	</div>
	</div>

	</div>

	</div>




</body>
</html>