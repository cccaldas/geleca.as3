package com.geleca.as3.test.stage
{
	import flash.display.Stage;
	import flash.events.Event;
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.util.StatsMonitor;
	import flash.display.Sprite;

	public class ActivateTest extends Object
	{
	
		public function ActivateTest()
		{
			super();
		}
		
		public function run(stage:Stage):void
		{
			stage.addChild(new StatsMonitor());
			
			var originalFrameRate:uint = stage.frameRate; 
			var standbyFrameRate:uint = 0; 

			stage.addEventListener(Event.ACTIVATE, onActivate);
			stage.addEventListener(Event.DEACTIVATE, onDeactivate);
			stage.addEventListener(Event.ENTER_FRAME, stage_enterFrame);

			function onActivate (e:Event):void
			{ 
			    // restore original frame rate 
			    stage.frameRate = originalFrameRate;
			
				GLog.log();
			} 

			function onDeactivate ( e:Event ):void
			{ 
			    // set frame rate to 0 
			    stage.frameRate = standbyFrameRate;
			
				GLog.log();			
			}
			
			function stage_enterFrame(e:Event):void
			{
				for (var i:int = 0; i < 20; i++)
					stage.addChild(new Sprite());
			}
		}
	
	}

}