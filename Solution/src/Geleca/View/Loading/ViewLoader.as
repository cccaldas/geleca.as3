package Geleca.View.Loading 
{
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.events.TimerEvent;
	import Geleca.Core.ProcessGroup;
	import Geleca.Events.SimpleEventDispatcher;
	import Geleca.Util.SimpleTimer;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ViewLoader extends SimpleEventDispatcher
	{
		private var _timer						:SimpleTimer 	= new SimpleTimer(1);
		private var _processGroup				:ProcessGroup 	= new ProcessGroup();
		
		public function ViewLoader() 
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
			
			//dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS));
			
			dispatchEvent(e);
		}
		
		public function load():void 
		{
			_timer.start();
			_processGroup.start();
			
			dispatchEvent(new Event(Event.INIT));
		}
		
		public function addLoaderItem(item:LoaderItem):void 
		{
			item.loader = this;
			_processGroup.add(item);
		}
		
		public function getItem(id:String):*
		{
			return LoaderItem(_processGroup.get(id)).content;
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