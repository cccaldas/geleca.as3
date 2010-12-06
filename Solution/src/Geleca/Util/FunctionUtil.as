package Geleca.Util 
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class FunctionUtil
	{
		
		public static function functionDelay(functionCaller:Function, delay:Number=1):void
		{
			if (functionCaller == null)
				return;
				
			var timer:Timer = new Timer(delay * 1000, 1);
			timer.addEventListener(TimerEvent.TIMER, timer_timer );
			
			function timer_timer(e:TimerEvent):void 
			{
				functionCaller();
				timer.stop();
				timer.removeEventListener(TimerEvent.TIMER, timer_timer );
			}
			
			timer.start();
		}
		
	}

}