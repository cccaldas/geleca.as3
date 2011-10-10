package com.geleca.as3.core 
{
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.events.ProcessEvent;
	import com.geleca.as3.events.SimpleEventDispatcher;
	
	import flash.events.Event;
	import flash.events.ProgressEvent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ProcessGroup extends SimpleEventDispatcher
	{
		private var _processes		:Array = [];
		private var _current		:uint = 0;
		
		public function ProcessGroup(processes:Array = null)
		{
			super();
			
			if (processes)
			{
				_processes = [];
				
				for each (var process:Process in processes) 
				{
					add(process);
				}
			}
		}
		
		public function add(process:Process):void 
		{
			var index:uint = _processes.push(process) - 1;
			if (process.id == null || process.id == "")
				process.id = index.toString();
				
			process.addEventListener(ProcessEvent.PROGRESS, process_progress);
			process.addEventListener(ProcessEvent.FINISH, 	process_finish);
		}
		
		private function process_progress(e:ProcessEvent):void 
		{
			dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS));
		}
		
		public function get(id:String):Process
		{
			var process:Process;
			for (var i:int = 0; i < length; i++) 
			{
				process = Process(_processes[i]);
				if (process.id == id)
					return process;
			}
			
			process = null;
			
			return process;
		}
		
		public function remove(id:String):void 
		{
			var process:Process;
			
			for (var i:int = 0; i < length; i++) 
			{
				process = Process(_processes[i]);
				if (process.id == id)
				{
					_processes.splice(i, 1);
					process.destroy();
					return;
				}
			}
			
			
		}
		
		private function process_finish(e:ProcessEvent):void 
		{
			var process:Process = Process(e.currentTarget);
			
			//GLog.log(process.id);
			
			process.removeEventListener(ProcessEvent.PROGRESS, 	process_progress);
			process.removeEventListener(ProcessEvent.FINISH, 	process_finish);
			
			dispatchEvent(new ProcessEvent(ProcessEvent.PROGRESS));
				
			if (_current == length -1)
			{
				dispatchEvent(new Event(Event.COMPLETE));
				return;
			}
				
			_current ++;
			
			run();
		}
		
		public function start():void 
		{
			if (length == 0)
			{
				dispatchEvent(new Event(Event.COMPLETE));
				return;
			}
			run();
		}
		
		private function run():void 
		{
			_processes[_current].start();
		}
		
		public function get length():uint { return _processes.length; }
		
		public function get current():uint { return _current; }
		
		public function get progress():Number
		{ 
			var progress:Number = 0;
			
			for each(var process:Process in _processes) 
			{
				progress += process.progress;
			}
			
			return progress / length; 
		}
		
		public function removeAll():void 
		{
			for each(var process:Process in _processes) 
			{
				process.destroy();
				
				_processes = [];
			}
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			removeAll();
			
			_processes = null;
		}
	}

}