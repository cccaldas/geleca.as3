package com.geleca.as3.core
{
	import flash.system.System;
	import flash.utils.Dictionary;
	import com.geleca.as3.events.SimpleEventDispatcher;
	import com.geleca.as3.events.ProcessEvent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ProcessManager extends SimpleEventDispatcher
	{
		private var _processes				:Dictionary 		= new Dictionary();
		private var _processMap				:Vector.<String> 	= new Vector.<String>();
		private var _length					:uint = 0;
		private var _removeOnFinish			:Boolean;
		
		public function ProcessManager() 
		{
			super();
		}
		
		public function add(process:Process):void 
		{
			process.addEventListener(ProcessEvent.START, 		dispatchEvent);
			//process.addEventListener(ProcessEvent.CANCEL, task_cancel);
			process.addEventListener(ProcessEvent.FINISH, 		process_finish);
			process.addEventListener(ProcessEvent.PROGRESS, 	dispatchEvent);
			
			if(process.id == "" || process.id == null)
				process.id = getUniqueID();
				
			_processes[process.id] = process;
			_processMap.push(process.id);
			
			if (_length == 0)
				run();
			
			_length ++;
		}
		
		public function create(id:String="", onStart:Function=null):Process
		{
			var process:Process = new Process();
			process.id = id;
			process.onStart = onStart;
			
			add(process);
			
			return process;
		}
		
		public function get(id:String):Process
		{
			return Process(_processes[id]);
		}
		
		private function process_cancel(e:ProcessEvent):void 
		{
			/*var task	:Task = Task(e.currentTarget);
			var length	:uint = _tasks.length;
			
			for (var i:int = 0; i < length; i++) 
			{
				if (_tasks[i] == task) _tasks.splice(i, 1);
			}
			
			e.task.destroy();
			
			System.gc();
			
			run();*/
		}
		
		public function remove(id:String):Process
		{
			_length --;
			
			var process:Process = get(id);
			
			if (process.running)
				process.cancel();
			
			_processes[process.id] = null;
			delete _processes[process.id];
			
			if (_processMap[0] == process.id)
				_processMap.shift();
			else removeProcessFromMap(process.id);
			
			process.destroy();
			
			process.removeEventListener(ProcessEvent.START, 	dispatchEvent);
			//process.removeEventListener(ProcessEvent.CANCEL, 	task_cancel);
			process.removeEventListener(ProcessEvent.FINISH, 	process_finish);
			process.removeEventListener(ProcessEvent.PROGRESS, 	dispatchEvent);
			
			System.gc();
			
			return process;
		}
		
		private function process_finish(e:ProcessEvent):void 
		{
			remove(Process(e.currentTarget).id);
				
			dispatchEvent(e);
			
			run();
		}
		
		//Remove o ID da task no Map
		private function removeProcessFromMap(id:String):void 
		{
			var index:int = _processMap.indexOf(id);
			if (index != -1)
				_processMap.splice(index, 1);
		}
		
		private function run():void 
		{
			var topProcess	:Process = getTopProcess();
			if (_processes.length != 0 && topProcess)
			{
				if (!topProcess.running)
					topProcess.start();
			}
		}
		
		public function get length():uint { return _length; }
		
		private function getTopProcess():Process
		{
			/*for (var name:String in _tasks) 
			{
				return get(name);
			}*/
			if (_processMap.length != 0)
				return get(_processMap[0]);
			else
				return null;
		}
		
		public function getUniqueID():String
		{
			var ID:String = getUniqueID_randomize();
			
			while (get(ID) != null) 
			{
				ID = getUniqueID_randomize();
			}
			
			return ID;
		}
		
		private function getUniqueID_randomize():String
		{
			return "task-id" + String(Math.round(Math.random() * new Date().getTime()));
		}
		
		public function get progress():Number
		{ 
			var progress:Number = 0;
			
			for each(var id:String in _processMap) 
			{
				progress += get(id).progress;
			}
			//trace(this, "progress", progress);
			return progress / length; 
		}
		
	}

}