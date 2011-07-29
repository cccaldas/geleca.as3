package com.geleca.as3.test.util
{
	import com.geleca.as3.util.StatsMonitor;
	
	import flash.display.Stage;

	public class StatsMonitorTest
	{
		public function StatsMonitorTest()
		{
			
		}
		
		public function run(stage:Stage):void
		{
			stage.addChild(new StatsMonitor());	
		}
	}
}