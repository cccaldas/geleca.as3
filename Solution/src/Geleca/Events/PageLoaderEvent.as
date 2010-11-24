package Geleca.Events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class PageLoaderEvent extends Event 
	{
		public static const LOAD				:String = "LOAD";
		public static const PROGRESS			:String = "PROGRESS";
		public static const COMPLETE			:String = "COMPLETE";
		
		public function PageLoaderEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new PageLoaderEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("PageLoaderEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}