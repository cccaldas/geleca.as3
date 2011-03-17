package com.geleca.as3.mvc.core
{
	import com.asual.swfaddress.SWFAddress;
	import com.asual.swfaddress.SWFAddressEvent;
	import com.geleca.as3.events.SimpleEventDispatcher;
	import flash.events.Event;

	public class Router extends SimpleEventDispatcher
	{
		private var _routes					:Vector.<Route> = new Vector.<Route>();
		
		private var _urls					:Array = [];
		
		public var app						:MVCApp;
		
		private var _init					:Boolean;
		
		public function Router()
		{
			
		}
		
		public function add(route:Route):void
		{
			_routes.push(route);
		}
		
		protected function setup():void
		{
			SWFAddress.addEventListener(SWFAddressEvent.CHANGE, SWFAddress_change);
		}
		
		protected function initialize():void
		{
			
		}
		
		public function initializeRouter():void
		{
			setup();
			initialize();
		}
		
		private function SWFAddress_change(e:SWFAddressEvent):void 
		{
			//trace(this, "SWFAddress_change", e.path);
			matchURL(e.path);
			_init = true;
			
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		protected function matchURL(url:String):void
		{
			for each (var item:Route in _routes) 
			{
				if (item.match(url))
				{
					app.executeAction(new RouteAction(item, url));
					return;
				}
			}
			
			if(!_init)
			{
				for each (var item:Route in _routes) 
				{
					if (item.isDefault)
					{
						app.navigateURL(item.url);
						return;
					}
				}
			}
		}
		
	}
}