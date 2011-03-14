package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import Geleca.Configuration.FlashConfig;
	import Geleca.Util.StatsMonitor;
	import Geleca.View.Loading.FileLoaderItem;
	import Geleca.View.Loading.FlashConfigLoaderItem;
	import Geleca.View.View;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class Main extends View 
	{
		
		public function Main():void 
		{
			this.initializeView();
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			addLoaderItem(new FlashConfigLoaderItem());
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			var config:FlashConfig = this.loader.getItem("config");
			
			if (config.getAppKey("debug") == "true")
				addChild(new StatsMonitor());
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
		}
		
	}
	
}