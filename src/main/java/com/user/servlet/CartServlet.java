package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.DesignDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.DesignDtls;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			
			int designId=Integer.parseInt(req.getParameter("designId"));
			int id=Integer.parseInt(req.getParameter("id"));
			
			DesignDAOImpl dao=new DesignDAOImpl(DBConnect.getConn());
			DesignDtls d=dao.getDesignById(designId);
			
			
			Cart c=new Cart();
			c.setDesignId(designId);
			c.setUserId(id);
			c.setDesignname(d.getDesignName());
			c.setDesigner(d.getDesigner());
			c.setPrice(Double.parseDouble(d.getPrice()));
			c.setTotalPrice(Double.parseDouble(d.getPrice()));
			
			CartDAOImpl dao2=new CartDAOImpl(DBConnect.getConn());
			boolean f=dao2.addCart(c);
			
			HttpSession session=req.getSession();
			
			
			
			if(f)
			{
				session.setAttribute("addcart", "Plan Added to Cart");
				resp.sendRedirect("all_new_plans.jsp");
				
				
			}else {
				session.setAttribute("failed", "Something Wrong on server");
				resp.sendRedirect("all_new_plans.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}

	
	
}
