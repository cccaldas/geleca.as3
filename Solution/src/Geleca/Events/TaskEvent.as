package Geleca.Events
{
	import flash.events.Event;
	import Geleca.Core.Task;
	
	public class TaskEvent extends Event 
	{
		public static const START				:String = "START";
		public static const FINISH				:String = "FINISH";
		public static const CANCEL				:String = "CANCEL";
		
		//private var _task						:Task;
		
		public function TaskEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new TaskEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("TaskEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		//public function get task():Task { return _task; }
		
	}
	
}