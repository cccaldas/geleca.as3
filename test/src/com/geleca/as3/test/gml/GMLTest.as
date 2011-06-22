package com.geleca.as3.test.gml
{
	import com.geleca.as3.layout.Layout;
	import com.geleca.as3.mvc.core.AbstractAppView;
	import com.geleca.as3.mvc.core.AbstractPreloaderView;
	import com.geleca.as3.mvc.core.GMLView;
	import com.geleca.as3.mvc.core.MVCApp;
	import com.geleca.as3.mvc.core.Router;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;

	public class GMLTest
	{
		public function GMLTest()
		{
			SpriteSkin;
			Sprite;
		}
		
		public function run(stage:Stage):void
		{
			var view:GMLView = new GMLView("gml/main.gml");
			view.app = new MVCApp();
			view.app.layout = new Layout(stage);
			stage.addChild(view);
			view.loader.addEventListener(Event.COMPLETE, _complete);
			view.load();
			
			function _complete(e:Event):void 
			{
				view.initializeView();
			}
		}
	}
}