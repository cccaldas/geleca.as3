package Geleca.Events
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class InputEvent extends Event 
	{
		public static const CHECK				:String = "CHECK";
		public static const UNCHECK				:String = "UNCHECK";
		
		public function InputEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new InputEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("InputEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}