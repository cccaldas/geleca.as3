package Simbionte.Events
{
	import flash.events.Event;
	
	public class FormEvent extends Event 
	{
		private static const NAME			:String = "FormEvent";
		public static const SUBMIT			:String = NAME + "SUBMIT";
		public static const RESET			:String = NAME + "RESET";
		
		public function FormEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) 
		{ 
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new FormEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("FormEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}