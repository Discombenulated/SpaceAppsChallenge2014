package net.skysnapper.util;

public class Page {
	
	public static String title(String theTitle) {
		return "<title>" + theTitle + " | SkySnapper</title>";
	}
	
	public static String headStart() {
		return "<jsp:include page=\"" + JSPs.START + "\"></jsp:include>";
	}
	
	public static String headEnd() {
		return "<jsp:include page=\"" + JSPs.END + "\"></jsp:include>";
	}
	
	public static String footer() {
		return "<jsp:include page=\"" + JSPs.FOOTER + "\"></jsp:include>";
	}
	
	public static String contentStart() {
		return "<jsp:include page=\"" + JSPs.CONTENT_START + "\"></jsp:include>"; 
	}

}
