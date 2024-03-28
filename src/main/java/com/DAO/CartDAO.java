package com.DAO;

import java.util.List;

import com.entity.Cart;
import com.entity.DesignDtls;

public interface CartDAO {

	public boolean addCart(Cart c);
	
	public List<Cart> getDesigByUser(int userId);
	
	public boolean deleteDesign(int designId, int id, int cid);
	
	
	
}
