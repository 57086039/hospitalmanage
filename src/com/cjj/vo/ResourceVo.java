package com.cjj.vo;

import com.cjj.po.Resource;

public class ResourceVo extends Resource{
	/**
	 * 资源id的上级id
	 */
	private String resourcesuperior;

	public String getResourcesuperior() {
		return resourcesuperior;
	}

	@Override
	public String toString() {
		return "ResourceVo [resourcesuperior=" + resourcesuperior
				+ ", getId()=" + getId() + ", getResourcesuperiorid()="
				+ getResourcesuperiorid() + ", getResourcename()="
				+ getResourcename() + ", getResourceurl()=" + getResourceurl()
				+ ", getResourceicon()=" + getResourceicon() + ", getRank()="
				+ getRank() + ", getIsvalid()=" + getIsvalid()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}

	public void setResourcesuperior(String resourcesuperior) {
		this.resourcesuperior = resourcesuperior;
	}
}
