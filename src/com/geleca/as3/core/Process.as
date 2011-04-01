package com.geleca.as3.core
{
	import com.geleca.as3.events.SimpleEventDispatcher;
	import com.geleca.as3.events.ProcessEvent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class Process extends SimpleEventDispatcher
	{
		private var _id								:String;
		private var _running						:Boolean = false;
		private var _progress						:Number = 0;
		
		public var result							:Object;
		
		public function Process() 
		{
			
		}
		
		public final function start():void 
		{
			_progress 	= 0;
			_running 	= true;
			dispatchEvent(new ProcessEvent(ProcessEvent.START));
			process_start();
		}
		
		protected function process_start():void 
		{
			
		}
		
		public final function finish():void 
		{
			_progress 	= 1;
			_running 	= false;
			process_finish();
			dispatchEvent(new ProcessEvent(ProcessEvent.FINISH));
			process_finish();
		}
		
		protected function process_finish():void 
		{
			
		}
		
		public final function cancel():void 
		{
			_running = false;
			dispatchEvent(new ProcessEvent(ProcessEvent.CANCEL));
			process_cancel();
		}
		
		protected function process_cancel():void 
		{
			
		}
		
		public function get running()	:Boolean 	{ return _running; }
		
		public function get id():String { return _id; }
		
		public function set id(value:String):void 
		{
			_id = value;
		}
		
		public function get progress():Number { return _progress; }
		
		protected final function updateProgress(progress:Number):void 
		{
			_progress = progress;
			
			dispatchEvent(new ProcessEvent(ProcessEvent.PROGRESS));
			process_progress(progress);
		}
		
		protected function process_progress(progress:Number):void 
		{
			
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			result = null;
		}
		
	}

}