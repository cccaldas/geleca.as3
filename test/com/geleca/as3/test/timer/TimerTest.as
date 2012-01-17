package com.geleca.as3.test.timer
{
	import com.geleca.as3.util.SimpleTimer;
	import flash.events.TimerEvent;
	import com.geleca.as3.debugger.GLog;
	import flash.utils.getTimer;
	import com.geleca.as3.test.Assert;

	public class TimerTest extends Object
	{
	
		public function TimerTest()
		{
			super();
		}
		
		public function run():void
		{
			var timer:SimpleTimer = new SimpleTimer(1);
			timer.addEventListener(TimerEvent.TIMER, timer_timer);
			timer.start();
			
			var delay:Number = 2000;
			var time:Number = getTimer();			
			var next:Number = new Date().time + delay;
			
			function timer_timer(e:TimerEvent):void
			{
				var date:Date = new Date();
				if(date.time >= next)
				{
					trace("time", date.hours + ":" + date.minutes + ":" + date.seconds + "::" + date.milliseconds);
					
					next = new Date().time + delay;
					//Assert.assertEquals(average, timer.delay / 1000);
				}
				//var average:Number = (getTimer() - time) / 1000;
				
				//var date:Date = new Date();
				
				
				//trace("current time", date.hours + ":" + date.minutes + ":" + date.seconds + "::" + date.milliseconds);
				

				//date.time += timer.delay;
				//trace("next time", date.hours + ":" + date.minutes + ":" + date.seconds + "::" + date.milliseconds);
				
				//time = getTimer();
				
				
				for (var i:int = 0; i < 50000000; i++)
				{
					var t:Number = (i /0.340359) * 0.1298503;
				}
			}
		}
	
	}

}