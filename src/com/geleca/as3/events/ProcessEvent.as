package com.geleca.as3.events
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ProcessEvent extends Event 
	{
		public static const START				:String = "START";
		public static const FINISH				:String = "FINISH";
		public static const CANCEL				:String = "CANCEL";
		public static const PROGRESS			:String = "PROGRESS";
		
		public function ProcessEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new ProcessEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("ProcessEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}