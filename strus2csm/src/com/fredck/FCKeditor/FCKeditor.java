package com.fredck.FCKeditor;

import javax.servlet.http.HttpServletRequest;

public class FCKeditor {
	private FCKeditorConfigurations oConfig;
	private String instanceName;
	private String value = "";
	private String basePath;
	private String toolbarSet = "Default";
	private String width = "100%";
	private String height = "200";
	HttpServletRequest request;

	public String getInstanceName() {
		return this.instanceName;
	}

	public void setInstanceName(String value) {
		this.instanceName = value;
	}

	public String getValue() {
		return this.value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getBasePath() {
		return this.basePath;
	}

	public void setBasePath(String value) {
		this.basePath = value;
	}

	public String getToolbarSet() {
		return this.toolbarSet;
	}

	public void setToolbarSet(String value) {
		this.toolbarSet = value;
	}

	public String getWidth() {
		return this.width;
	}

	public void setWidth(String value) {
		this.width = value;
	}

	public String getHeight() {
		return this.height;
	}

	public void setHeight(String value) {
		this.height = value;
	}

	public FCKeditorConfigurations getConfig() {
		return this.oConfig;
	}

	public void setConfig(FCKeditorConfigurations value) {
		this.oConfig = value;
	}

	public FCKeditor(HttpServletRequest req) {
		this.request = req;
		this.basePath = this.request.getContextPath() + "/FCKeditor/";
		this.oConfig = new FCKeditorConfigurations();
	}

	public FCKeditor(HttpServletRequest req, String parInstanceName) {
		this.request = req;
		this.basePath = this.request.getContextPath() + "/FCKeditor/";
		this.instanceName = parInstanceName;
		this.oConfig = new FCKeditorConfigurations();
	}

	public FCKeditor(HttpServletRequest req, String parInstanceName,
			String parWidth, String parHeight, String parToolbarSet,
			String parValue) {
		this.request = req;
		this.basePath = this.request.getContextPath() + "/FCKeditor/";
		this.instanceName = parInstanceName;
		this.width = parWidth;
		this.height = parHeight;
		this.toolbarSet = parToolbarSet;
		this.value = parValue;
		this.oConfig = new FCKeditorConfigurations();
	}

	private boolean isCompatible() {
		String userAgent = request.getHeader("user-agent");
		if (userAgent == null)
			return false;
		userAgent = userAgent.toLowerCase();
		if ((userAgent.indexOf("msie") != -1)
				&& (userAgent.indexOf("mac") == -1)
				&& (userAgent.indexOf("opera") == -1)) {
			if (retrieveBrowserVersion(userAgent) >= 5.5)
				return true;
		} else if (userAgent.indexOf("applewebkit") != -1) {
			return true;
		} else if (userAgent.indexOf("gecko") != -1) {
			if (retrieveBrowserVersion(userAgent) >= 20030210)
				return true;
		}
		return false;
	}

	private double retrieveBrowserVersion(String userAgent) {
		String str;
		if (userAgent.indexOf("msie") > -1) {
			str = userAgent.substring(userAgent.indexOf("msie") + 5);
			return Double.parseDouble(str.substring(0, str.indexOf(";")));
		}

		str = userAgent.substring(userAgent.indexOf("gecko") + 6);
		return Double.parseDouble(str.substring(0, 8));
	}

	private String HTMLEncode(String txt) {
		txt = txt.replaceAll("&", "&amp;");
		txt = txt.replaceAll("<", "&lt;");
		txt = txt.replaceAll(">", "&gt;");
		txt = txt.replaceAll("\"", "&quot;");
		txt = txt.replaceAll("'", "&#146;");
		return txt;
	}

	public String create() {
		StringBuffer strEditor = new StringBuffer();

		strEditor.append("<div>");
		String encodedValue = HTMLEncode(this.value);

		if (isCompatible()) {
			strEditor.append("<input type=\"hidden\" id=\"" + this.instanceName
					+ "\" name=\"" + this.instanceName + "\" value=\""
					+ encodedValue + "\">");

			strEditor.append(createConfigHTML());
			strEditor.append(createIFrameHTML());
		} else {
			strEditor.append("<TEXTAREA name=\"" + this.instanceName
					+ "\" rows=\"4\" cols=\"40\" style=\"WIDTH: " + this.width
					+ "; HEIGHT: " + this.height + "\" wrap=\"virtual\">"
					+ encodedValue + "</TEXTAREA>");
		}
		strEditor.append("</div>");
		return strEditor.toString();
	}

	private String createConfigHTML() {
		String configStr = this.oConfig.getUrlParams();

		if (!(configStr.equals("")))
			configStr = configStr.substring(1);

		return "<input type=\"hidden\" id=\"" + this.instanceName
				+ "___Config\" value=\"" + configStr + "\">";
	}

	private String createIFrameHTML() {
		String sLink = this.basePath + "editor/fckeditor.html?InstanceName="
				+ this.instanceName;

		if (!(this.toolbarSet.equals("")))
			sLink = sLink + "&Toolbar=" + this.toolbarSet;

		return "<iframe id=\"" + this.instanceName + "___Frame\" src=\""
				+ sLink + "\" width=\"" + this.width + "\" height=\""
				+ this.height
				+ "\" frameborder=\"no\" scrolling=\"no\"></iframe>";
	}
}