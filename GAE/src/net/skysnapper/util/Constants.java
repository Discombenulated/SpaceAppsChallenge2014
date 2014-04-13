package net.skysnapper.util;

public interface Constants {

	public interface RelativeURLs {
		public static final String PHOTO_UPLOAD_CALLBACK = "/photouploadcallback";
		
		public static final String MOBILE_UPLOAD_CALLBACK = "/mobileuploadcallback";
		
		public static final String REST_API = "/restapi";
		
		public static final String HTML5SIV = "/javascript/html5shiv-min.js";
		
		public static final String RESPOND_JS = "/javascript/respond-min.js";
		
		public static final String PHOTO_DATA_URL = "/photodata";
		
		public static final String PHOTO_UPLOAD_QUEUE = "/queue/photoupload";
	}
	
	public interface ParamNames {
		public static final String PHOTO_KEY = "photoid";
	}

	public static final String GCS_BUCKET = "sky-snapper.appspot.com";
	
	
}
