package com.geleca.as3.util 
{
	import flash.system.Capabilities;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class PlayerUtil
	{
		
		public function PlayerUtil() 
		{
			
		}
		
		/**Adobe AIR runtime (except for SWF content loaded by an HTML page, which has Capabilities.playerType set to “PlugIn”)*/
		public static function isDesktop():Boolean 
		{
			return Capabilities.playerType == "Desktop";
		}
		
		/**stand-alone Flash Player*/
		public static function isStandAlone():Boolean 
		{
			return Capabilities.playerType == "StandAlone";
		}
		
		/**Flash Player ActiveX control used by Microsoft Internet Explorer*/
		public static function isActiveX():Boolean 
		{
			return Capabilities.playerType == "ActiveX";
		}
		
		/**Flash Player browser plug-in (and for SWF content loaded by an HTML page in an AIR application)*/
		public static function isPlugin():Boolean 
		{
			return Capabilities.playerType == "PlugIn";
		}
		
		/**external Flash Player or in test mode*/
		public static function isExternal():Boolean 
		{
			return Capabilities.playerType == "External";
		}
		
		public static function isBrowser():Boolean
		{
			return (isActiveX() && isPlugin());
		}
		
		public static function isDebugger():Boolean
		{
			return Capabilities.isDebugger;
		}
	}

}