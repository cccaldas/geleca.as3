package com.geleca.as3.test.util
{
	import com.geleca.as3.display.RectangularSprite;
	import com.geleca.as3.util.DrawUtil;
	import com.geleca.as3.util.SimpleTimer;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.TimerEvent;

	public class DrawUtilTest
	{
		public function DrawUtilTest()
		{
			
		}
		
		public function run(stage:Stage):void
		{
			var sprite:Sprite = new Sprite();
			stage.addChild(sprite);
			
			var rec:RectangularSprite = new RectangularSprite(61.20, 61.20, .3);
			sprite.addChild(rec);
			sprite.x = sprite.y = 200;
			
			sprite.rotation = -90;
			
			var radius:Number = rec.width * .5;
			
			var timer:SimpleTimer = new SimpleTimer(30);
			timer.addEventListener(TimerEvent.TIMER, timer_timer);
			
			timer.start();
			
			var draw:DrawUtil = new DrawUtil(sprite.graphics);
			
			function timer_timer(e:TimerEvent):void
			{
				draw.lineStyle(4, 0x939393);
				draw.drawArc(radius, radius, radius, timer.currentCount);					 
			}
		}
	}
}