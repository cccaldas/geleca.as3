package com.geleca.as3.view.loading 
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import com.geleca.as3.events.ProcessEvent;
	import com.geleca.as3.util.SimpleTimer;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class TimerLoaderItem extends LoaderItem
	{
		private var _timer						:SimpleTimer;
		
		public function TimerLoaderItem(id:String="timer", time:int=4)
		{
			super(id);
			
			_timer = new SimpleTimer(250, time * 4);
			_timer.addEventListener(TimerEvent.TIMER, 			timer_timer);
			_timer.addEventListener(TimerEvent.TIMER_COMPLETE, 	timer_complete);
		}
		
		override protected function process_start():void 
		{
			super.process_start();
			
			_timer.start();
		}
		
		private function timer_timer(e:TimerEvent):void 
		{
			updateProgress(_timer.currentCount / _timer.repeatCount);
		}		
		
		private function timer_complete(e:TimerEvent):void 
		{
			this.finish();
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			_timer.destroy();
		}
		
	}

}