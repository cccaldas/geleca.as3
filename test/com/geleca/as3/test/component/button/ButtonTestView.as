package com.geleca.as3.test.component.button
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.geleca.as3.test.component.button.ButtonTestAsset;
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.events.ButtonEvent;
	import com.geleca.as3.component.button.Button;
	import com.geleca.as3.view.View;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ButtonTestView extends View
	{
		private var _asset				:ButtonTestAsset;
		
		public var btn_1				:Button;
		public var btn_2				:Button;
		public var btn_3				:Button;
		
		public function ButtonTestView() 
		{
			super();
			
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event=null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.initializeView();
		}
		
		override public function setup():void 
		{
			super.setup();
			
			_asset = new ButtonTestAsset();
			addChild(_asset);
			
			btn_1 = addComponent(new Button(_asset.btn_1));
			btn_2 = addComponent(new Button(_asset.btn_2));
			btn_3 = addComponent(new Button(_asset.btn_3));
			
			btn_1.addEventListener(MouseEvent.CLICK, btn_1_click);
			btn_1.addEventListener(ButtonEvent.RELEASE_OUT_SIDE, btn_1_releaseOutSide);
		}
		
		private function btn_1_releaseOutSide(e:ButtonEvent):void 
		{
			GLog.log("btn_1_releaseOutSide");
		}
		
		private function btn_1_click(e:MouseEvent):void 
		{
			GLog.log("btn_1_click");
		}
		
	}

}