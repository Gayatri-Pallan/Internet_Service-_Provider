package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;


@WebServlet("/remove_design")
public class RemoveDesignCart extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int designId=Integer.parseInt(req.getParameter("designId"));
		int id=Integer.parseInt(req.getParameter("id"));
		int cid=Integer.parseInt(req.getParameter("cid"));
		CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
		boolean f=dao.deleteDesign(designId,id,cid);
		HttpSession session=req.getSession();
		
		
		if(f)
		{
			session.setAttribute("succMsg", "Plan Removed from Cart");
			resp.sendRedirect("checkout.jsp");
		}else {
			session.setAttribute("failedMsg", "Something wrong on server");
			resp.sendRedirect("checkout.jsp");
		}
		
		
		
	}

	
	
	
}
