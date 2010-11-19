package Geleca.Events
{
	import flash.events.Event;
	
	public class NotificationEvent extends Event 
	{
		public static const NOTIFICATION			:String = "NOTIFICATION";
		private var _name							:String;
		private var _body							:Object;
		
		public function NotificationEvent(name:String, body:Object=null, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			_name = name;
			_body = body;
			
			super(NOTIFICATION, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new NotificationEvent(NOTIFICATION, getBody(), bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("NotificationEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public function getName():String
		{
			return _name;
		}
		
		public function getBody():Object
		{
			return _body;
		}
	}
	
}