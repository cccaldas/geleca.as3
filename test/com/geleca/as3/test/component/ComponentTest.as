package com.geleca.as3.test.component
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Stage;
	import com.geleca.as3.test.component.button.ButtonTestView;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ComponentTest
	{
		
		public function ComponentTest():void 
		{
			super();
		}
		
		public function run(stage:Stage):void
		{
			stage.addChild(new ButtonTestView());
		}
		
	}
	
}