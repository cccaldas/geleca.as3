package com.geleca.as3.mvc.core
{
	import com.asual.swfaddress.SWFAddress;
	import com.asual.swfaddress.SWFAddressEvent;
	import com.geleca.as3.events.SimpleEventDispatcher;
	import flash.events.Event;

	public class Router extends SimpleEventDispatcher
	{
		private var _urls					:Array = [];
		
		public var app						:MVCApp;
		
		private var _init					:Boolean;
		
		public function Router()
		{
			
		}
		
		public function add(url:String, controller:Class, action:String = "index", isDefault:Boolean=false):void
		{
			_urls.push({url:url, controller:controller, action:action, isDefault:isDefault});
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
			for each (var item:Object in _urls) 
			{
				if (matchURL_check(url, item.url))
				{
					app.executeAction(item, url);
					return;
				}
			}
			
			if(!_init)
			{
				for each (var action:Object in _urls) 
				{
					if (action.isDefault)
					{
						app.navigateURL(action.url);
						return;
					}
				}
			}
		}
		
		private function matchURL_check(url:String, match:String):Boolean
		{
			var url_path 	:Array = url.split("/");
			//TODO: mudar a classe URLParameters para tipo URLHeader para que possa minerar a url e chegar parametros e limpar as '/'
			url_path.shift();
			url_path.pop();
			
			var match_path 	:Array = match.split("/");
			match_path.shift();
			match_path.pop();
			
			//trace(this, "url_path", url_path, url_path.length);
			
			//Tamanhos
			if (url_path.length != match_path.length)
				return false;
				
			//Parametros
			for (var i:int = 0; i < url_path.length; i++) 
			{
				if (!matchURL_isParameter(match_path[i]))
					if (url_path[i] != match_path[i])
						return false;
			}
			
			return true;
		}
		
		private function matchURL_isParameter(value:String):Boolean
		{
			//trace(this, "matchURL_isParameter", value, (value.indexOf("{") != -1 && value.indexOf("}") != -1));
			
			return value.indexOf("{") != -1 && value.indexOf("}") != -1;
		}
		
	}
}