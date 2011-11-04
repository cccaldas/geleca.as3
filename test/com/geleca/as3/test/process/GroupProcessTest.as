package com.geleca.as3.test.process 
{
	import com.geleca.as3.core.Process;
	import com.geleca.as3.core.ProcessGroup;
	import com.geleca.as3.core.ProcessManager;
	import com.geleca.as3.events.ProcessEvent;
	import com.geleca.as3.util.FunctionUtil;
	import flash.display.Sprite;
	import flash.events.ProgressEvent;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class GroupProcessTest extends Sprite
	{
		private var _group					:ProcessGroup;
		
		public function GroupProcessTest() 
		{
			super();			
		}
		
		public function run():void
		{
			trace("GroupProcessTest::run()");
			
			_group = new ProcessGroup();
			
			for (var i:int = 0; i < 10; i++)
			{
				_group.add(new ProcessTest());
			}
			
			_group.addEventListener(ProgressEvent.PROGRESS, 	group_progress);
			_group.addEventListener(Event.COMPLETE, 			group_complete);
			_group.start();
			
			function group_progress(e:ProgressEvent):void
			{
				trace("GroupProcessTest::group_progress()", Math.round(_group.progress * 100));
			}
			
			function group_complete(e:Event):void
			{
				trace("GroupProcessTest::group_complete()");
			}
			
		}
		
	}

}

import com.geleca.as3.core.Process;
import com.geleca.as3.util.*;
import flash.events.*;

internal class ProcessTest extends Process
{

	public function ProcessTest()
	{
		super();
		
		this.weight = (Math.round(Math.random() * 10) / 10) + .1;
		trace("GroupProcessTest::ProcessTest()", this.weight);
	}
	
	override protected function process_start():void 
	{
		var timer:SimpleTimer = new SimpleTimer(10);
		timer.addEventListener(TimerEvent.TIMER, timer_timer);
		timer.start();
		
		function timer_timer(e:TimerEvent):void
		{			
			if(timer.currentCount == 20)
			{
				timer.stop();
				timer.removeEventListener(TimerEvent.TIMER, timer_timer);
				finish();
			}
			else
				updateProgress(timer.currentCount / 20);
		}
	}

}