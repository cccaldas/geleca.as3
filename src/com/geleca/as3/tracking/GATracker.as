package com.geleca.as3.tracking 
{
	import flash.external.ExternalInterface;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class GATracker
	{
		
		public function GATracker() 
		{
			
		}
		
		public function trackPageview(url:String):void 
		{
			if (ExternalInterface.available)
				ExternalInterface.call("function() { _gaq.push (['_trackPageview', '" + url + "']); } "); 
		}
		
	}

}