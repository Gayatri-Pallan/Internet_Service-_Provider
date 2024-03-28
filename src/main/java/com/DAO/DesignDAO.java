package com.DAO;

import java.util.List;

import com.entity.DesignDtls;

public interface DesignDAO {

	public boolean addDesigns(DesignDtls d);
	
	public List<DesignDtls> getAllDesigns();
	
	public DesignDtls getDesignById(int id);
	
	public boolean updateEditDesigns(DesignDtls d);
	
	public boolean deleteDesigns(int id);
	
	public List<DesignDtls> getNewDesign();
	
	public List<DesignDtls> getRecentDesign();
	
	public List<DesignDtls> getOldDesign();
	
	public List<DesignDtls> getAllRecentDesign();
	
	public List<DesignDtls> getAllNewDesign();
	
	public List<DesignDtls> getAllOldDesign();
	
	
}
