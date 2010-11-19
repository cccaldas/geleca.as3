package Geleca.Events 
{
	import flash.events.Event;
	
	public class BusyManagerEvent extends Event 
	{
		public static const BUSY					:String = "BUSY";
		public static const AVAILABLE				:String = "AVAILABLE";
		
		public function BusyManagerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new BusyManagerEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("BusyManagerEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}