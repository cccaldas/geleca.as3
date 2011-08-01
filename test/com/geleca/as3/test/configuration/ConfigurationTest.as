package com.geleca.as3.test.configuration 
{
	import com.geleca.as3.configuration.FlashConfig;
	import com.geleca.as3.debugger.GLog;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ConfigurationTest
	{
		public function run():void
		{
			GLog.log();
			
			var config:FlashConfig = new FlashConfig();
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, loader_complete);
			
			loader.load(new URLRequest("flash-config.xml"));
			
			function loader_complete(e:Event):void
			{
				config.parse(XML(loader.data));
				
				GLog.log(config.getAppKey("path-medias-thumb"));
			}
		}
		
	}
	
}