package com.DAO;

import java.util.List;

import com.entity.Design_Request;

public interface DesignRequestDAO {

	
	public boolean saveRequest(List<Design_Request> d);
	
	public List<Design_Request> getDesign(String email);
	
	public List<Design_Request> getAllRequest();
}
