package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.DesignDtls;
import com.mysql.cj.exceptions.RSAException;

public class DesignDAOImpl implements DesignDAO{

	private Connection conn;

	public DesignDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addDesigns(DesignDtls d) {
		boolean f=false;
		try {
			String sql="insert into design_dtls(designname,designer,price,designCategory,status,photo,email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, d.getDesignName());
			ps.setString(2, d.getDesigner());
			ps.setString(3, d.getPrice());
			ps.setString(4, d.getDesignCategory());
			ps.setString(5, d.getStatus());
			ps.setString(6, d.getPhotoName());
			ps.setString(7, d.getEmail());
					
			int i=ps.executeUpdate();
			
			if(i==1)
			{
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return f;
	}

	
	public List<DesignDtls> getAllDesigns() {
		
		List<DesignDtls> list=new ArrayList<DesignDtls>();
		DesignDtls d=null;
		
		try {
			String sql="select * from design_dtls";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				d=new DesignDtls();
				d.setDesignId(rs.getInt(1));
				d.setDesignName(rs.getString(2));
				d.setDesigner(rs.getString(3));
				d.setPrice(rs.getString(4));
				d.setDesignCategory(rs.getString(5));
				d.setStatus(rs.getString(6));
				d.setPhotoName(rs.getString(7));
				d.setEmail(rs.getString(8));
				list.add(d);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	public DesignDtls getDesignById(int id) {
		
		DesignDtls d= null;
		try {
			String sql="select * from design_dtls where designId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				d=new DesignDtls();
				d.setDesignId(rs.getInt(1));
				d.setDesignName(rs.getString(2));
				d.setDesigner(rs.getString(3));
				d.setPrice(rs.getString(4));
				d.setDesignCategory(rs.getString(5));
				d.setStatus(rs.getString(6));
				d.setPhotoName(rs.getString(7));
				d.setEmail(rs.getString(8));
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return d;
	}

	@Override
	public boolean updateEditDesigns(DesignDtls d) {
		boolean f=false;
		try {
			String sql="update design_dtls set designname=?,designer=?,price=?,status=? where designId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, d.getDesignName());
			ps.setString(2, d.getDesigner());
			ps.setString(3, d.getPrice());
			ps.setString(4, d.getStatus());
			ps.setInt(5,d.getDesignId());
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean deleteDesigns(int id) {
		boolean f=false;
		try {
			String sql="delete from design_dtls where designid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<DesignDtls> getNewDesign() {
		List<DesignDtls> list=new ArrayList<DesignDtls>();
		DesignDtls d= null;
		
		try {
			String sql="select * from design_dtls where designCategory=? and status=? order by designId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				d=new DesignDtls();
				d.setDesignId(rs.getInt(1));
				d.setDesignName(rs.getString(2));
				d.setDesigner(rs.getString(3));
				d.setPrice(rs.getString(4));
				d.setDesignCategory(rs.getString(5));
				d.setStatus(rs.getString(6));
				d.setPhotoName(rs.getString(7));
				d.setEmail(rs.getString(8));
				list.add(d);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<DesignDtls> getRecentDesign() {
		List<DesignDtls> list=new ArrayList<DesignDtls>();
		DesignDtls d= null;
		
		try {
			String sql="select * from design_dtls where status=? order by designId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				d=new DesignDtls();
				d.setDesignId(rs.getInt(1));
				d.setDesignName(rs.getString(2));
				d.setDesigner(rs.getString(3));
				d.setPrice(rs.getString(4));
				d.setDesignCategory(rs.getString(5));
				d.setStatus(rs.getString(6));
				d.setPhotoName(rs.getString(7));
				d.setEmail(rs.getString(8));
				list.add(d);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<DesignDtls> getOldDesign() {
		List<DesignDtls> list=new ArrayList<DesignDtls>();
		DesignDtls d= null;
		
		try {
			String sql="select * from design_dtls where designCategory=? and status=? order by designId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				d=new DesignDtls();
				d.setDesignId(rs.getInt(1));
				d.setDesignName(rs.getString(2));
				d.setDesigner(rs.getString(3));
				d.setPrice(rs.getString(4));
				d.setDesignCategory(rs.getString(5));
				d.setStatus(rs.getString(6));
				d.setPhotoName(rs.getString(7));
				d.setEmail(rs.getString(8));
				list.add(d);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<DesignDtls> getAllRecentDesign() {
		List<DesignDtls> list=new ArrayList<DesignDtls>();
		DesignDtls d= null;
		
		try {
			String sql="select * from design_dtls where status=? order by designId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				d=new DesignDtls();
				d.setDesignId(rs.getInt(1));
				d.setDesignName(rs.getString(2));
				d.setDesigner(rs.getString(3));
				d.setPrice(rs.getString(4));
				d.setDesignCategory(rs.getString(5));
				d.setStatus(rs.getString(6));
				d.setPhotoName(rs.getString(7));
				d.setEmail(rs.getString(8));
				list.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<DesignDtls> getAllNewDesign() {
		List<DesignDtls> list=new ArrayList<DesignDtls>();
		DesignDtls d= null;
		
		try {
			String sql="select * from design_dtls where designCategory=? and status=? order by designId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				d=new DesignDtls();
				d.setDesignId(rs.getInt(1));
				d.setDesignName(rs.getString(2));
				d.setDesigner(rs.getString(3));
				d.setPrice(rs.getString(4));
				d.setDesignCategory(rs.getString(5));
				d.setStatus(rs.getString(6));
				d.setPhotoName(rs.getString(7));
				d.setEmail(rs.getString(8));
				list.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<DesignDtls> getAllOldDesign() {
		List<DesignDtls> list=new ArrayList<DesignDtls>();
		DesignDtls d= null;
		
		try {
			String sql="select * from design_dtls where designCategory=? and status=? order by designId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				d=new DesignDtls();
				d.setDesignId(rs.getInt(1));
				d.setDesignName(rs.getString(2));
				d.setDesigner(rs.getString(3));
				d.setPrice(rs.getString(4));
				d.setDesignCategory(rs.getString(5));
				d.setStatus(rs.getString(6));
				d.setPhotoName(rs.getString(7));
				d.setEmail(rs.getString(8));
				list.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
}
