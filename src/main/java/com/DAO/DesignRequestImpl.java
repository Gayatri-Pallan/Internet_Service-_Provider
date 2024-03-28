package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Design_Request;

public class DesignRequestImpl implements DesignRequestDAO{

	private Connection conn;

	public DesignRequestImpl(Connection conn) {
		super();
		this.conn = conn;
	}


	@Override
	public boolean saveRequest(List<Design_Request> dlist) {
		boolean f=false;
		try {
			String sql="insert into design_request(request_id,user_name,email,address,phno,design_name,designer,price,payment) values(?,?,?,?,?,?,?,?,?)";
			
			conn.setAutoCommit(false);
			PreparedStatement ps=conn.prepareStatement(sql);
			
			for(Design_Request d:dlist)
			{
				ps.setString(1,d.getRequestId());
				ps.setString(2, d.getUserName());
				ps.setString(3, d.getEmail());
				ps.setString(4, d.getFulladd());
				ps.setString(5, d.getPhno());
				ps.setString(6, d.getDesignName());
				ps.setString(7, d.getDesigner());
				ps.setString(8, d.getPrice());
				ps.setString(9, d.getPaymentType());
				ps.addBatch();	
			}
			int [] count=ps.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}


	@Override
	public List<Design_Request> getDesign(String email) {
		List<Design_Request> list=new ArrayList<Design_Request>();
		
		Design_Request r=null;
		

		try {
			
			String sql="select * from design_request where email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) 
			{
				r=new Design_Request();
				r.setId(rs.getInt(1));
				r.setRequestId(rs.getString(2));
				r.setUserName(rs.getString(3));
				r.setEmail(rs.getString(4));
				r.setFulladd(rs.getString(5));
				r.setPhno(rs.getString(6));
				r.setDesignName(rs.getString(7));
				r.setDesigner(rs.getString(8));
				r.setPrice(rs.getString(9));
				r.setPaymentType(rs.getString(10));
				list.add(r);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public List<Design_Request> getAllRequest() {
List<Design_Request> list=new ArrayList<Design_Request>();
		
		Design_Request r=null;
		

		try {
			
			String sql="select * from design_request";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) 
			{
				r=new Design_Request();
				r.setId(rs.getInt(1));
				r.setRequestId(rs.getString(2));
				r.setUserName(rs.getString(3));
				r.setEmail(rs.getString(4));
				r.setFulladd(rs.getString(5));
				r.setPhno(rs.getString(6));
				r.setDesignName(rs.getString(7));
				r.setDesigner(rs.getString(8));
				r.setPrice(rs.getString(9));
				r.setPaymentType(rs.getString(10));
				list.add(r);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	
	
}
