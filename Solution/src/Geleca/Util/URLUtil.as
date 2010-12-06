package Geleca.Util
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
		
	}
	
}