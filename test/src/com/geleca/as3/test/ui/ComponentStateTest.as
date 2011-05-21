package com.geleca.as3.test.ui 
{
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.display.HitArea;
	import com.geleca.as3.events.StateEvent;
	import com.geleca.as3.ui.component.button.Button;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	[SWF(backgroundColor="#000000")]
	public class ComponentStateTest extends Sprite 
	{
		public var btn_1						:Button;
		
		public function ComponentStateTest() 
		{
			init();
		}
		
		private function init():void 
		{
			btn_1 = new Button();
			addChild(btn_1);
			btn_1.initializeComponent();
			btn_1.hitArea = new HitArea(200, 50, .3);
			
			btn_1.addEventListener(StateEvent.CHANGE, btn_1_stateChange);
			
			btn_1.state = "click";
			btn_1.state = "rollOver";
		}
		
		private function btn_1_stateChange(e:StateEvent):void 
		{
			GLog.log("old=", e.oldState, "new=", e.newState);
		}
		
	}

}