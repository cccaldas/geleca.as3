package Geleca.Website.Controller.Router
{
	import Geleca.Events.SimpleEventDispatcher;
	import com.asual.swfaddress.SWFAddress;
	import com.asual.swfaddress.SWFAddressEvent;
	import flash.events.Event;
	
	public class URLRouter extends SimpleEventDispatcher
	{
		private var _pathNames							:Array = [];
		private var _checkInit							:Boolean;
		
		public function URLRouter(checkInit:Boolean=false) 
		{
			_checkInit = checkInit;
		}
		
		public final function initialize():void 
		{
			SWFAddress.addEventListener(SWFAddressEvent.CHANGE, swfAddress_change);
			router_initialize();
			if(_checkInit)
				checkRoute(SWFAddress.getPathNames());
		}
		
		private function swfAddress_change(e:SWFAddressEvent):void 
		{
			_pathNames = SWFAddress.getPathNames();
			checkRoute(pathNames);
		}
		
		protected final function route(name:String):void 
		{
			_pathNames 	= SWFAddress.getPathNames();
			dispatchEvent(new Event(name));
		}
		
		public override function destroy():void 
		{
			SWFAddress.removeEventListener(SWFAddressEvent.CHANGE, swfAddress_change);
			_pathNames = null;
			
			super.destroy();
		}
		
		public function get pathNames():Array { return _pathNames; }
		
		protected function checkRoute(pathNames:Array):void 
		{
			//trace(this, "checkRoute" ,SWFAddress.getPath(), pathNames);
		}
		
		protected function router_initialize():void 
		{
			
		}
		
	}

}