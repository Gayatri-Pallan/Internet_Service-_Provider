package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.DesignDAOImpl;
import com.DB.DBConnect;
import com.entity.DesignDtls;

@WebServlet("/add_designs")
@MultipartConfig 
public class DesignsAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String designName=req.getParameter("dname");
			String designer=req.getParameter("designer");
			String price=req.getParameter("price");
			String categories=req.getParameter("categories");
			String status=req.getParameter("status");
			Part part=req.getPart("dimg");
			String fileName=part.getSubmittedFileName();
			
			DesignDtls d=new DesignDtls(designName,designer,price,categories,status,fileName,"admin");
			
			DesignDAOImpl dao=new DesignDAOImpl(DBConnect.getConn());
			
			
		    boolean f=dao.addDesigns(d);
			
			HttpSession session=req.getSession();
			
			if(f)
			{
				String path=getServletContext().getRealPath("")+"Designs";
				
				File file=new File(path);
				part.write(path+File.separator+fileName);
				
				session.setAttribute("succMsg", "Plan Added Sucessfully");
				resp.sendRedirect("admin/add_designs.jsp");
			}else {
				session.setAttribute("failedMsg", "Something wrong on server");
				resp.sendRedirect("admin/add_designs.jsp");
			} 
			
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
	}
	
	

}
