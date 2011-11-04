package com.geleca.as3.test.yaml 
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
	public class YAMLTest1
	{
		public function run():void
		{			
			var config:Object;
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, loader_complete);
			
			loader.load(new URLRequest("test-1.yaml"));
			
			function loader_complete(e:Event):void
			{
				config = YAML.decode(loader.data);
				
				GLog.log("var_1", config["var_1"]);
				GLog.log("var_2", config["var_2"]);				
				GLog.log("path_asset", config["path_asset"]);				
				GLog.log("path_bitmap", config["path_bitmap"]);				
				GLog.log("path_bitmap_background", config["path_bitmap_background"]);				
			}
		}
		
	}
	
}