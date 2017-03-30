package com.ah.manager.common.page.model;

public class YearRQ {


	private String yearlist;
	
	private String hospitalId;
	
	private String stat_type;
	
	private String regionId;

	/**
	 * 每页显示条数
	 */
	private int pageSize;


	/**
	 * 当前页数
	 */
	private int nowPage;


	public String getYearlist() {
		return yearlist;
	}


	public void setYearlist(String yearlist) {
		this.yearlist = yearlist;
	}


	public String getHospitalId() {
		return hospitalId;
	}


	public void setHospitalId(String hospitalId) {
		this.hospitalId = hospitalId;
	}


	public String getStat_type() {
		return stat_type;
	}


	public void setStat_type(String stat_type) {
		this.stat_type = stat_type;
	}


	public String getRegionId() {
		return regionId;
	}


	public void setRegionId(String regionId) {
		this.regionId = regionId;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public int getNowPage() {
		return nowPage;
	}


	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	
}

