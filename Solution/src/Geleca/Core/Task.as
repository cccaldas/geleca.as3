package Geleca.Core
{
	import flash.events.EventDispatcher;
	import Geleca.Events.SimpleEventDispatcher;
	import Geleca.Events.TaskEvent;
	
	public class Task extends SimpleEventDispatcher
	{
		private var _id								:String;
		private var _running						:Boolean = false;
		
		public function Task() 
		{
			
		}
		
		public final function start():void 
		{
			_running = true;
			dispatchEvent(new TaskEvent(TaskEvent.START));
		}
		
		public final function finish():void 
		{
			_running = false;
			dispatchEvent(new TaskEvent(TaskEvent.FINISH));
		}
		
		public final function cancel():void 
		{
			_running = false;
			dispatchEvent(new TaskEvent(TaskEvent.CANCEL));
		}
		
		public function get running()	:Boolean 	{ return _running; }
		
		public function get id():String { return _id; }
		
		public function set id(value:String):void 
		{
			_id = value;
		}
		
	}

}