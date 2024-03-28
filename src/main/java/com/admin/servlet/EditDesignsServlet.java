package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.DesignDAOImpl;
import com.DB.DBConnect;
import com.entity.DesignDtls;

@WebServlet("/editdesigns")
public class EditDesignsServlet extends HttpServlet{

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
try {
	int id=Integer.parseInt(req.getParameter("id"));
	String designName=req.getParameter("dname");
	String designer=req.getParameter("designer");
	String price=req.getParameter("price");
	String status=req.getParameter("status");

	DesignDtls d=new DesignDtls();
	d.setDesignId(id);
	d.setDesignName(designName);
	d.setDesigner(designer);
	d.setPrice(price);
	d.setStatus(status);
	
	DesignDAOImpl dao=new DesignDAOImpl(DBConnect.getConn());
	boolean f=dao.updateEditDesigns(d);
	
	
	HttpSession session=req.getSession();
	
	if(f)
	{
		session.setAttribute("succMsg", "Plan Update Successfully..");
		resp.sendRedirect("admin/all_designs.jsp");
	}else {
		session.setAttribute("failedMsg", "Something wrong on server");
		resp.sendRedirect("admin/all_designs.jsp");
	}
} catch (Exception e) {
	e.printStackTrace();
}

	}

}
