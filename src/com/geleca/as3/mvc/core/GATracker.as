package com.geleca.as3.mvc.core 
{
	import flash.external.ExternalInterface;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class GATracker implements ITracker
	{
		
		public function GATracker() 
		{
			
		}
		
		/* INTERFACE com.geleca.as3.mvc.core.ITracker */
		
		public function trackURL(url:String):void
		{
			if (ExternalInterface.available)
				ExternalInterface.call("function() { _gaq.push (['_trackPageview', '" + url + "']); } "); 
		}
		
	}

}