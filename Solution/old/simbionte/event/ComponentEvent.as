package Simbionte.Events
{
	import flash.events.Event;
	
	public class ComponentEvent extends Event 
	{
		public static const INITIALIZED              :String = "initialized";
		
		public static const SHOW                     :String = "show";
		public static const SHOW_COMPLETE            :String = "showComplete";
		
		public static const HIDE                     :String = "hide";
		public static const HIDE_COMPLETE            :String = "hideComplete";
		
		public function ComponentEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new ComponentEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("ComponentEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}