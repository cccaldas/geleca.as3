package Geleca.Events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class PageEvent extends Event 
	{
		public static const LOAD			:String = "LOAD";
		public static const LOAD_COMPLETE	:String = "LOAD_COMPLETE";
		public static const LOAD_PROGRESS	:String = "LOAD_PROGRESS";
		public static const UNLOAD			:String = "UNLOAD";
		public static const UNLOAD_COMPLETE	:String = "UNLOAD_COMPLETE";
		
		public function PageEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new PageEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("PageEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}