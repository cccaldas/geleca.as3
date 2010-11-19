package Geleca.Events
{
	import flash.events.Event;
	
	public class ModuleEvent extends Event 
	{
		private static const NAME					:String = "ModuleEvent";
		public static const LOAD_PROGRESS			:String = NAME + "LOAD_PROGRESS";
		public static const LOAD_COMPLETE			:String = NAME + "LOAD_COMPLETE";
		public static const INITIALIZE				:String = NAME + "INITIALIZE";
		public static const INITIALIZE_COMPLETE		:String = NAME + "INITIALIZE_COMPLETE";
		public static const UNLOAD					:String = NAME + "UNLOAD";
		public static const UNLOAD_COMPLETE			:String = NAME + "UNLOAD_COMPLETE";
		public static const DISPOSE					:String = NAME + "DISPOSE";
		
		public function ModuleEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new ModuleEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("ModuleEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}