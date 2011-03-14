package com.geleca.as3.mvc.util 
{
	import com.asual.swfaddress.SWFAddress;
	import com.asual.swfaddress.SWFAddressEvent;
	import com.geleca.as3.asset.mvc.util.MVCAppBrowserAsset;
	import com.geleca.as3.display.SimpleSprite;
	import com.geleca.as3.util.DepthUtil;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class MVCAppBrowser extends SimpleSprite
	{
		private var _asset						:MVCAppBrowserAsset;
		
		public function MVCAppBrowser() 
		{
			_asset = new MVCAppBrowserAsset();
			addChild(_asset);
			
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		private function addedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			
			stage.addEventListener(Event.ADDED, stage_added);
		}
		
		private function stage_added(e:Event):void 
		{
			DepthUtil.toFront(this);
		}
		
		public function initialize():void 
		{
			SWFAddress.addEventListener(SWFAddressEvent.CHANGE, SWFAddressEvent_change);
			
			SWFAddressEvent_change(null);
			
			_asset.btn_go.addEventListener(MouseEvent.CLICK, btn_go_click);
		}
		
		private function SWFAddressEvent_change(e:SWFAddressEvent):void 
		{
			_asset.txt_status.text = SWFAddress.getValue();
		}
		
		private function btn_go_click(e:MouseEvent):void 
		{
			SWFAddress.setValue(_asset.txt_status.text);
		}
		
		override public function destroy():void 
		{
			
			
			super.destroy();
		}
		
	}

}