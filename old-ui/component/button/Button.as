package simbionte.ui.component.button 
{
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	import simbionte.ui.component.Component;
	
	public class Button extends Component
	{
		
		public function Button() 
		{
			
		}
		
		override protected function setVariables():void 
		{
			buttonMode = true;
			
			super.setVariables();
		}
		
		override protected function setListeners():void 
		{
			addEventListener(MouseEvent.CLICK, 			button_click);
			addEventListener(MouseEvent.ROLL_OVER, 		button_rollOver);
			addEventListener(MouseEvent.ROLL_OUT, 		button_rollOut);
			addEventListener(MouseEvent.MOUSE_DOWN, 	button_mouseDown);
			addEventListener(MouseEvent.MOUSE_UP, 		button_mouseUp);
			addEventListener(MouseEvent.MOUSE_WHEEL,	button_mouseWheel);
			
			super.setListeners();
		}
		
		private function button_click(e:MouseEvent):void 
		{
			click();
		}
		
		private function button_rollOver(e:MouseEvent):void 
		{
			rollOver();
		}
		
		private function button_rollOut(e:MouseEvent):void 
		{
			if (enabled)
				rollOut();
		}
		
		private function button_mouseDown(e:MouseEvent):void 
		{
			mouseDown();
		}
		
		private function button_mouseUp(e:MouseEvent):void 
		{
			mouseUp();
		}
		
		private function button_mouseWheel(e:MouseEvent):void 
		{
			mouseWheel();
		}
		
		override protected function focusIn():void 
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, focusIn_stage_keyDown,false,0,true);
			
			super.focusIn();
		}
		
		override protected function focusOut():void 
		{
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, focusIn_stage_keyDown);
			
			super.focusOut();
		}
		
		private function focusIn_stage_keyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.SPACE)
				dispatchEvent(new MouseEvent(MouseEvent.CLICK));
		}
		
		protected function click():void 
		{
			
		}
		
		protected function rollOver():void 
		{
			
		}
		
		protected function rollOut():void 
		{
			
		}
		
		protected function mouseDown():void 
		{
			
		}
		
		protected function mouseUp():void 
		{
			
		}
		
		protected function mouseWheel():void 
		{
			
		}
		
		override public function destroy():void 
		{
			if (stage)
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, focusIn_stage_keyDown);
			
			super.destroy();
		}
		
	}

}