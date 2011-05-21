package com.geleca.as3.loading 
{
	import com.geleca.as3.debugger.GLog;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.events.TimerEvent;
	import com.geleca.as3.core.ProcessGroup;
	import com.geleca.as3.events.SimpleEventDispatcher;
	import com.geleca.as3.util.SimpleTimer;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class GLoader extends SimpleEventDispatcher
	{
		private var _timer						:SimpleTimer 	= new SimpleTimer(1);
		private var _processGroup				:ProcessGroup 	= new ProcessGroup();
		
		public function GLoader() 
		{
			setup();
		}
		
		protected function setup():void 
		{
			_timer.addEventListener(TimerEvent.TIMER, 				timer_timer);
			_processGroup.addEventListener(Event.COMPLETE, 			processGroup_complete);
		}
		
		private function processGroup_complete(e:Event):void 
		{
			_timer.stop();
			
			dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS));
			
			dispatchEvent(e);
		}
		
		public function load():void 
		{
			_timer.start();
			_processGroup.start();
			
			dispatchEvent(new Event(Event.INIT));
		}
		
		public function addLoaderItem(item:LoaderItem):LoaderItem 
		{
			item.loader = this;
			_processGroup.add(item);
			
			return item;
		}
		
		public function getItem(id:String):*
		{
			var item:LoaderItem = LoaderItem(_processGroup.get(id));
			
			return item != null ? item.content : null;
		}
		
		public function removeItem(id:String):void 
		{
			_processGroup.remove(id);
		}
		
		public function removeAll():void 
		{
			_processGroup.removeAll();
		}
		
		private function timer_timer(e:TimerEvent):void 
		{
			dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS));
		}
		
		public function get progress():Number { return _processGroup.progress; }
		public function get length():uint { return _processGroup.length; }
		
		override public function destroy():void 
		{
			super.destroy();
			
			_processGroup.destroy();
			_timer.destroy();
			
			_processGroup = null;
			_timer = null;
		}
		
	}

}