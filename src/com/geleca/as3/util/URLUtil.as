package com.geleca.as3.util
{
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class URLUtil 
	{
		
		public static function getURL(url:String, target:String = "_blank"):void 
		{
			navigateToURL(new URLRequest(url), target);
		}
		
		public static function mailto(email:String):void 
		{
			getURL("mailto:" + email);
		}
		
	}
	
}