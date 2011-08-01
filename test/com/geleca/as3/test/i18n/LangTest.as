package com.geleca.as3.test.i18n
{
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.i18n.Lang;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	public class LangTest
	{
		public function LangTest()
		{
			
		}
		
		public function run():void
		{
			var view:LangView = new LangView();
			view.loader.addEventListener(Event.COMPLETE, loader_complete);
			view.load();
			
			function loader_complete(e:Event):void
			{
				// TODO Auto-generated method stub
				view.initializeView();
				//GLog.log();	
			}
		}
	}
}