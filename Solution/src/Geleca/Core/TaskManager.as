package Geleca.Core
{
	import flash.system.System;
	import flash.utils.Dictionary;
	import Geleca.Events.SimpleEventDispatcher;
	import Geleca.Events.TaskEvent;
	
	public class TaskManager extends SimpleEventDispatcher
	{
		private var _tasks					:Dictionary 		= new Dictionary();
		private var _taskMap				:Vector.<String> 	= new Vector.<String>();
		private var _length					:uint = 0;
		//private var _tasks					:Vector.<Task> = new Vector.<Task>();
		
		//private var _destroyed				:Boolean = false;
		
		public function TaskManager() 
		{
			
		}
		
		public function add(task:Task):void 
		{
			task.addEventListener(TaskEvent.START, 	task_start);
			task.addEventListener(TaskEvent.CANCEL, task_cancel);
			task.addEventListener(TaskEvent.FINISH, task_finish);
			
			task.id = getUniqueID();
			_tasks[task.id] = task;
			_taskMap.push(task.id);
			
			if (_length == 0) run();
			
			_length ++;
		}
		
		public function get(id:String):Task
		{
			return Task(_tasks[id]);
		}
		
		private function task_start(e:TaskEvent):void 
		{
			dispatchEvent(e);
		}
		
		private function task_cancel(e:TaskEvent):void 
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
		
		private function task_finish(e:TaskEvent):void 
		{
			_length --;
			
			var task:Task = Task(e.currentTarget);
			
			_tasks[task.id] = null;
			delete _tasks[task.id];
			
			if (_taskMap[0] == task.id)
				_taskMap.shift();
			else removeTaskFromMap(task.id);
			
			task.destroy();
			
			task.removeEventListener(TaskEvent.START, 	task_start);
			task.removeEventListener(TaskEvent.CANCEL, 	task_cancel);
			task.removeEventListener(TaskEvent.FINISH, 	task_finish);
			
			task = null;
			
			dispatchEvent(e);
			
			System.gc();
			
			run();
		}
		
		//Remove o ID da task no Map
		private function removeTaskFromMap(id:String):void 
		{
			var length	:uint = _taskMap.length;
			
			for (var i:int = 0; i < length; i++) 
			{
				if (_taskMap[i] == id)
					_taskMap.splice(i, 1);
			}
		}
		
		private function run():void 
		{
			var topTask	:Task = getTopTask();
			if (_tasks.length != 0 && topTask)
			{
				if(!topTask.running) topTask.start();
			}
		}
		
		public function get length():uint { return _length; }
		
		private function getTopTask():Task
		{
			/*for (var name:String in _tasks) 
			{
				return get(name);
			}*/
			if (_taskMap.length != 0)
				return get(_taskMap[0]);
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
		
	}

}