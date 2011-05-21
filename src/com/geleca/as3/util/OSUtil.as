package com.geleca.as3.util 
{
	import flash.system.Capabilities;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class OSUtil
	{
		
		public function OSUtil() 
		{
			
		}
		
		public static function isMac():Boolean
		{
			return Capabilities.os.indexOf("Mac") != -1;
		}
		
		public static function isWin():Boolean
		{
			return Capabilities.os.indexOf("WIN") != -1 || Capabilities.os.indexOf("Win") != -1;
		}
		
		public static function isIOS():Boolean
		{
			return Capabilities.os.indexOf("iPhone OS") != -1;
		}
		
		public static function isAndroid():Boolean
		{
			return Capabilities.manufacturer.indexOf("Android Linux") != -1;
		}
		
	}

}