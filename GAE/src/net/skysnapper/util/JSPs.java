package net.skysnapper.util;

public interface JSPs {
	
	public static final String START = "/jsp/fragments/head_start.jsp";
	
	public static final String END = "/jsp/fragments/head_end.jsp";
	
	public static final String FOOTER = "/jsp/fragments/footer.jsp";
	
	public static final String HOME = "/jsp/home.jsp";
	
	public static final String CONTENT_START = "/jsp/fragments/content_start.jsp";
	
	public static final String COLOURS = "/jsp/colours.jsp";
	
	public static final String UPLOAD_SUCCESS = "/jsp/upload_success.jsp";
	
	public static interface Admin {
		public static interface Fragments {
			public static final String NAVBAR = "/jsp/admin/fragments/navbar.jsp";
			
			public static final String LIST = "/jsp/admin/fragments/moderate_list.jsp";
		}
		
		public static final String HOME = "/jsp/admin/home.jsp";
		
		public static final String MODERATE = "/jsp/admin/moderate.jsp";
		
		public static final String LIST_ALL = "/jsp/admin/list.jsp";
	}

}
