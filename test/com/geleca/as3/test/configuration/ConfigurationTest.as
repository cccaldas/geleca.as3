package com.geleca.as3.test.configuration 
{
	import com.geleca.as3.configuration.FlashConfig;
	import com.geleca.as3.debugger.GLog;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import dupin.parsers.yaml.YAML;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ConfigurationTest
	{
		public function run():void
		{			
			var config:Object;
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, loader_complete);
			
			loader.load(new URLRequest("configuration/flash.yaml"));
			
			function loader_complete(e:Event):void
			{
				config = YAML.decode(String(loader.data));
				
				GLog.log("url_app", config["url_app"]);
				GLog.log("path_skin", config["path_skin"]);
				GLog.log("path_upld", config["path_upld"]);
				GLog.log("debug", config["debug"]);
			}
		}
		
	}
	
}