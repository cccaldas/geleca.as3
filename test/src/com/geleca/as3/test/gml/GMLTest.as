package com.geleca.as3.test.gml 
{
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.display.HitArea;
	import com.geleca.as3.layout.Layout;
	import com.geleca.as3.loading.FileLoaderItem;
	import com.geleca.as3.mvc.core.MVCApp;
	import com.geleca.as3.mvc.core.View;
	import com.geleca.as3.ui.component.button.Button;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class GMLTest extends View 
	{
		public var btn_1				:Button;
		public var btn_2				:Button;
		public var btn_3				:Button;
		public var btn_4				:Button;
		
		public function GMLTest() 
		{
			stage.align 		= StageAlign.TOP_LEFT;
			stage.scaleMode 	= StageScaleMode.NO_SCALE;
			
			
			this.app = new MVCApp();
			this.app.layout = new Layout(stage);
			//this.app.layout.stage = this.stage;
			this.loader.addEventListener(Event.COMPLETE, _complete);
			this.load();
		}
		
		private function _complete(e:Event):void 
		{
			this.initializeView();
		}
		
		override public function load():void 
		{
			loader.addLoaderItem(new FileLoaderItem("gml", "../test/gml/main.gml"));
			
			super.load();
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			//trace(loader.getItem("gml"));
			
			btn_1 = addComponent(new Button(null));
			btn_1.hitArea = new HitArea(100, 50, .2);
			
			btn_2 = addComponent(new Button(null));
			btn_2.hitArea = new HitArea(100, 50, .2);
			
			btn_3 = addComponent(new Button(null));
			btn_3.hitArea = new HitArea(100, 50, .2);
			
			btn_4 = addComponent(new Button(null));
			btn_4.hitArea = new HitArea(100, 50, .2);
			
			new GMLApply(this, XML(loader.getItem("gml")));
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			GLog.log(btn_1.x, btn_1.y);
		}
		
	}

}