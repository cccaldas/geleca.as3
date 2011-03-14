package com.geleca.as3.mvc.util 
{
	import com.asual.swfaddress.SWFAddress;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class NavigateUtil
	{
		
		public function NavigateUtil() 
		{
			
		}
		
		public static function navigateURL(url:String):void 
		{
			SWFAddress.setValue(url);
		}
	}

}