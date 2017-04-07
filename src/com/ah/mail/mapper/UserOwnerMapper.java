package com.ah.mail.mapper;

import java.util.List;
import java.util.Map;

import com.ah.mail.pojo.UserOwner;

public interface UserOwnerMapper {
	List<UserOwner> findAll(Map search);
	
	int save(UserOwner userOwner);
	
	UserOwner get(String id);

	void delete(String id);
	
	List<String> findByUser(String userId);

}
