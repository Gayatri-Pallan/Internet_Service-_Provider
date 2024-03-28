package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAO;
import com.DAO.CartDAOImpl;
import com.DAO.DesignRequestImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.DesignDtls;
import com.entity.Design_Request;

@WebServlet("/request")
public class RequestServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			HttpSession session=req.getSession();
			
			int id=Integer.parseInt(req.getParameter("id"));
	
			String name=req.getParameter("username");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String address=req.getParameter("address");
			String landmark=req.getParameter("landmark");
			String city=req.getParameter("city");
			String state=req.getParameter("state");
			String pincode=req.getParameter("pincode");
			String paymentType=req.getParameter("payment");
			
			
			String fullAdd=address+","+landmark+","+city+","+state+","+pincode;
			
			/*System.out.println(name+" "+email+" "+phno+" "+fullAdd+" "+paymentType);*/	
			
			CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());		
		
			
			
			List<Cart> dlist=dao.getDesigByUser(id);

		if(dlist.isEmpty())
		{
			resp.sendRedirect("checkout.jsp");
			session.setAttribute("failedMsg", "Please Add Item");
			
		}else {
			DesignRequestImpl dao2=new DesignRequestImpl(DBConnect.getConn());
			
			Design_Request r=null;
			
			
			ArrayList<Design_Request> requestList=new ArrayList<Design_Request>();
			Random r1=new Random();
			for(Cart c: dlist)
			{    r=new Design_Request();
			r.setRequestId("Design-REQ-00"+ r1.nextInt(1000));
			r.setUserName(name);
				r.setEmail(email);
				r.setPhno(phno);
				r.setFulladd(fullAdd);
				r.setDesignName(c.getDesignname());
				r.setDesigner(c.getDesigner());
				r.setPrice(c.getPrice()+"");
				r.setPaymentType(paymentType);
				requestList.add(r);
				
			}

				if ("noselect".equals(paymentType)) 
				{
					session.setAttribute("failedMsg", "Please Choose Payment Method");
					resp.sendRedirect("checkout.jsp");
				}else {

			 boolean f=dao2.saveRequest(requestList);
				 if(f)
			 {  resp.sendRedirect("request_success.jsp");
				 
				 }else {
					 resp.sendRedirect("request_success.jsp");
			 }
				}
				
		}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
