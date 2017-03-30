package com.ah.manager.common.miniui;

/**
 * @author xuguobing
 * @comment form表单ajax提交返回
 */
public class AjaxResult {
	private Boolean ok;
	private String message;
	private Object value;

	public AjaxResult() {
		super();
	}

	public AjaxResult(Boolean ok, String message) {
		super();
		this.ok = ok;
		this.message = message;
	}

	public AjaxResult(Boolean ok, String message, Object value) {
		super();
		this.ok = ok;
		this.message = message;
		this.value = value;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}


	public Boolean getOk() {
		return ok;
	}


	public void setOk(Boolean ok) {
		this.ok = ok;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}
}
